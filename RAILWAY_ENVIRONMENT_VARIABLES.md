# 📋 Railway Environment Variables - COPY PASTE READY

## Before You Deploy - Gather These Values

You'll need to add these environment variables to Railway Dashboard.

### 1️⃣ Basic Server Config (No changes needed)
```
PORT=5000
NODE_ENV=production
```

### 2️⃣ Supabase Credentials

Get these from your Supabase account:
1. Go to: https://app.supabase.com
2. Select your project
3. Go to Settings → API
4. Copy these values:

```
SUPABASE_URL=https://hncighhoeqmrvmdxdtns.supabase.co
SUPABASE_ANON_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhuY2lnaGhvZXFtcnZtZHhkdG5zIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njk2ODg5MjMsImV4cCI6MjA4NTI2NDkyM30.hL7_QzOJozTJHqQlVpVL_vwp-659yv0X_n8ZQknZ1Ig
SUPABASE_SERVICE_ROLE_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhuY2lnaGhvZXFtcnZtZHhkdG5zIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc2OTY4ODkyMywiZXhwIjoyMDg1MjY0OTIzfQ.REPLACE_WITH_YOUR_ACTUAL_KEY
```

### 3️⃣ Cloudinary Credentials

Get these from Cloudinary:
1. Go to: https://cloudinary.com/console
2. Your credentials are on the dashboard

```
CLOUDINARY_CLOUD_NAME=your_cloud_name_here
CLOUDINARY_API_KEY=your_api_key_here
CLOUDINARY_API_SECRET=your_api_secret_here
```

### 4️⃣ Admin Credentials (Already configured)
```
ADMIN_USERNAME=rrmotors
ADMIN_PASSWORD=rrmotors@1
```

### 5️⃣ CORS Configuration (Add AFTER getting Railway URL)

After Railway generates your URL, update this:
```
ALLOWED_ORIGINS=https://your-app-name.railway.app
```

---

## 📌 How to Add These to Railway

### Step 1: Go to Railway Dashboard
1. Visit https://railway.app/dashboard
2. Click on your project
3. Click the **"Variables"** tab

### Step 2: Add Each Variable
For each variable above:
1. Click **"New Variable"**
2. Enter the key (e.g., `PORT`)
3. Enter the value
4. Press Enter
5. Repeat for all variables

### Step 3: Add After Getting URL
After Railway deploys and gives you a URL:
1. Update `ALLOWED_ORIGINS` with your actual Railway URL
2. Railway will redeploy automatically
3. Your site should work perfectly!

---

## ❓ Where to Find Each Value

### Supabase
- 🔗 https://app.supabase.com
- Look for: Settings → API
- Your URL and Keys are there

### Cloudinary
- 🔗 https://cloudinary.com/console
- API Key and Secret are on main dashboard
- Cloud Name is at the top

### Railway
- 🔗 https://railway.app/dashboard
- After deploying, your URL appears in project settings
- Format: `https://your-app-name.railway.app`

---

## ✅ Complete Variable List

Copy all of these at once:

```
PORT=5000
NODE_ENV=production
SUPABASE_URL=https://hncighhoeqmrvmdxdtns.supabase.co
SUPABASE_ANON_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhuY2lnaGhvZXFtcnZtZHhkdG5zIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njk2ODg5MjMsImV4cCI6MjA4NTI2NDkyM30.hL7_QzOJozTJHqQlVpVL_vwp-659yv0X_n8ZQknZ1Ig
SUPABASE_SERVICE_ROLE_KEY=[GET_FROM_SUPABASE]
CLOUDINARY_CLOUD_NAME=[GET_FROM_CLOUDINARY]
CLOUDINARY_API_KEY=[GET_FROM_CLOUDINARY]
CLOUDINARY_API_SECRET=[GET_FROM_CLOUDINARY]
ALLOWED_ORIGINS=[RAILWAY_URL_AFTER_DEPLOYMENT]
```

---

## 🚨 Important Notes

1. **Never share these values** - Keep them secret!
2. **API Keys are sensitive** - Treat like passwords
3. **ALLOWED_ORIGINS must match** your deployment URL exactly
4. **Services need to be active**:
   - Supabase account with tables
   - Cloudinary account for image uploads
   - (Optional) Google Sheets integration

---

## 🔍 If You Don't Have Cloudinary

If you haven't set up Cloudinary yet:

1. Go to: https://cloudinary.com
2. Sign up (free)
3. Confirm your email
4. Go to Dashboard
5. Copy the three values (Cloud Name, API Key, API Secret)
6. Add to Railway

---

## Testing Your Variables

After adding all variables to Railway:

1. Deploy your app
2. Visit your Railway URL
3. Try to:
   - Load images ✅ (Cloudinary)
   - Login ✅ (Username: rrmotors, Password: rrmotors@1)
   - View bikes ✅ (Supabase)
   - Submit forms ✅ (Database)

If any fail, check:
- Variable spelling (case-sensitive)
- Values copied correctly
- No extra spaces
- Correct service accounts

---

## 📞 Get Help

If stuck:
1. Check Railway logs: Dashboard → Logs
2. Check browser console: F12 → Console
3. Look for error messages
4. Check `.env.example` in your code

---

**Status**: Ready to add variables to Railway! 🚀
