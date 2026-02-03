import express from 'express';
import cors from 'cors';
import dotenv from 'dotenv';
import cloudinary from 'cloudinary';
import bikeRoutes from './routes/bikes.js';
import uploadRoutes from './routes/upload.js';
import { testConnection, supabase } from './config/supabase.js';

dotenv.config();

// Configure Cloudinary
cloudinary.config({
  cloud_name: process.env.CLOUDINARY_CLOUD_NAME,
  api_key: process.env.CLOUDINARY_API_KEY,
  api_secret: process.env.CLOUDINARY_API_SECRET
});

const app = express();
const PORT = process.env.PORT || 5000;

// Middleware
app.use(cors({
  origin: (process.env.ALLOWED_ORIGINS || 'http://localhost:5173,http://localhost:3000').split(',').map(url => url.trim()),
  credentials: true,
  methods: ['GET', 'POST', 'PUT', 'DELETE', 'OPTIONS'],
  allowedHeaders: ['Content-Type', 'Authorization'],
  exposedHeaders: ['Content-Type', 'Authorization']
}));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Routes
app.use('/api/bikes', bikeRoutes);
app.use('/api/upload', uploadRoutes);

// Store Bike Submission to Google Sheets
app.post('/api/bikes/store-submission', async (req, res) => {
  try {
    const { bikeId, bikeName, brand, price, timestamp, action } = req.body;

    console.log('📊 Storing submission to Google Sheets:', {
      bikeId,
      bikeName,
      brand,
      price,
      timestamp,
      action
    });

    // TODO: Integrate with actual Google Sheets API
    // For now, just log the submission
    res.json({
      success: true,
      message: 'Submission recorded',
      data: {
        bikeId,
        bikeName,
        brand,
        price,
        timestamp,
        action
      }
    });
  } catch (error) {
    console.error('Error storing submission:', error);
    res.status(500).json({ message: 'Error storing submission' });
  }
});

// Fetch Submissions from Google Sheets
app.get('/api/bikes/submissions', async (req, res) => {
  try {
    // TODO: Integrate with actual Google Sheets API to fetch submissions
    res.json({
      success: true,
      submissions: []
    });
  } catch (error) {
    console.error('Error fetching submissions:', error);
    res.status(500).json({ message: 'Error fetching submissions' });
  }
});

// Admin Authentication Endpoint
app.post('/api/auth/admin-login', (req, res) => {
  try {
    const { email, password } = req.body;

    if (!email || !password) {
      return res.status(400).json({ message: 'Email and password are required' });
    }

    const adminEmail = process.env.ADMIN_EMAIL;
    const adminPassword = process.env.ADMIN_PASSWORD;
    const adminName = process.env.ADMIN_NAME || 'Administrator';
    const adminPhone = process.env.ADMIN_PHONE || 'N/A';

    console.log('Login attempt:', { email, providedPassword: password ? '***' : 'empty' });
    console.log('Admin config:', { adminEmail, adminPassword: adminPassword ? '***' : 'empty' });

    // Verify credentials
    if (email === adminEmail && password === adminPassword) {
      return res.status(200).json({
        success: true,
        admin: {
          email: adminEmail,
          name: adminName,
          phone: adminPhone,
          role: 'admin',
          loginTime: new Date()
        },
        token: Buffer.from(`${adminEmail}:${Date.now()}`).toString('base64')
      });
    } else {
      return res.status(401).json({ 
        success: false,
        message: 'Invalid email or password' 
      });
    }
  } catch (error) {
    console.error('Admin login error:', error);
    res.status(500).json({ message: 'Server error during login' });
  }
});

// Get Admin Info (Protected by token)
app.get('/api/auth/admin', (req, res) => {
  try {
    const token = req.headers.authorization?.split(' ')[1];
    
    if (!token) {
      return res.status(401).json({ message: 'Unauthorized' });
    }

    const adminEmail = process.env.ADMIN_EMAIL;
    const adminName = process.env.ADMIN_NAME || 'Administrator';
    const adminPhone = process.env.ADMIN_PHONE || 'N/A';

    res.json({
      email: adminEmail,
      name: adminName,
      phone: adminPhone,
      role: 'admin'
    });
  } catch (error) {
    res.status(500).json({ message: 'Server error' });
  }
});

// Health check endpoint
app.get('/api/health', (req, res) => {
  res.json({ status: 'Server is running', timestamp: new Date() });
});

// Diagnostics endpoint
app.get('/api/diagnostics', async (req, res) => {
  try {
    const diagnostics = {
      server: 'Running',
      timestamp: new Date(),
      database: {
        configured: !!process.env.DB_HOST,
        host: process.env.DB_HOST ? '***' : 'Not set',
        supabaseUrl: process.env.SUPABASE_URL ? '***' : 'Not set',
        supabaseKey: process.env.SUPABASE_ANON_KEY ? '***' : 'Not set'
      }
    };

    // Test Supabase
    const { data: testData, error: testError } = await supabase
      .from('bikes')
      .select('id', { count: 'exact', head: true });

    if (testError) {
      diagnostics.database.supabaseConnection = 'Failed';
      diagnostics.database.supabaseError = testError.message;
    } else {
      diagnostics.database.supabaseConnection = 'Success';
    }

    res.json(diagnostics);
  } catch (error) {
    res.status(500).json({
      status: 'Diagnostic check failed',
      error: error.message
    });
  }
});

// Error handling middleware
app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).json({ message: 'Something went wrong!', error: err.message });
});

// Start server
async function startServer() {
  // Test Supabase connection
  const isConnected = await testConnection();
  
  if (!isConnected) {
    console.error('⚠️  Warning: Could not connect to Supabase');
  } else {
    console.log('✅ Supabase connected successfully');
  }

  // Check Cloudinary configuration
  if (process.env.CLOUDINARY_CLOUD_NAME && process.env.CLOUDINARY_API_KEY) {
    console.log('✅ Cloudinary configured:', {
      cloud_name: process.env.CLOUDINARY_CLOUD_NAME,
      api_key: process.env.CLOUDINARY_API_KEY ? '***' : 'Not set'
    });
  } else {
    console.warn('⚠️  Warning: Cloudinary not fully configured');
  }

  app.listen(PORT, () => {
    console.log(`🚀 Server running on http://localhost:${PORT}`);
    console.log(`📝 API Documentation:`);
    console.log(`   GET    /api/bikes           - Get all bikes`);
    console.log(`   GET    /api/bikes/:id       - Get bike by ID`);
    console.log(`   GET    /api/bikes/brand/:brand - Get bikes by brand`);
    console.log(`   POST   /api/bikes           - Create new bike`);
    console.log(`   PUT    /api/bikes/:id       - Update bike`);
    console.log(`   DELETE /api/bikes/:id       - Delete bike`);
  });
}

startServer();
