# 🚀 Railway Deployment Guide - Complete Step by Step

## Overview
This guide will help you deploy your Bike Showroom application to Railway. Your app has:
- **Frontend**: React + TypeScript (Vite)
- **Backend**: Node.js Express API
- **Database**: Supabase (Cloud)

---

## 📋 STEP 1: Prerequisites

Before you start, make sure you have:

1. **GitHub Account** - Create one at https://github.com if you don't have it
2. **Railway Account** - Sign up at https://railway.app (free tier available)
3. **Git installed** on your computer
4. **All your code committed to GitHub**

---

## 🔧 STEP 2: Prepare Your Code for Deployment

### 2.1 Create a `.gitignore` file
Make sure you have a `.gitignore` in your root folder with:
```
node_modules/
dist/
.env
.env.local
.DS_Store
*.log
npm-debug.log*
yarn-debug.log*
```

### 2.2 Check your package.json scripts
Your root `package.json` should have been updated with:
- `"build"`: Builds both frontend and installs backend dependencies
- `"start"`: Runs the server (Railway uses this)

### 2.3 Ensure you have `server/package.json`
Your server folder should have its own `package.json` with all backend dependencies.

---

## 📤 STEP 3: Push Code to GitHub

### 3.1 Initialize Git (if not already done)
```bash
cd "c:\Users\Dharneesh S\Downloads\bikeshowroom (1)\bikeshowroom"
git init
git add .
git commit -m "Initial commit - ready for Railway deployment"
```

### 3.2 Create GitHub Repository
1. Go to https://github.com/new
2. Create a repository named `bikeshowroom`
3. Don't initialize with README/gitignore

### 3.3 Push to GitHub
```bash
git remote add origin https://github.com/YOUR_USERNAME/bikeshowroom.git
git branch -M main
git push -u origin main
```

---

## 🚀 STEP 4: Deploy to Railway

### 4.1 Connect Railway to GitHub
1. Go to https://railway.app/dashboard
2. Click **"New Project"**
3. Select **"Deploy from GitHub repo"**
4. Authorize Railway to access your GitHub
5. Select the `bikeshowroom` repository

### 4.2 Railway will automatically detect:
- Node.js as runtime
- Your build and start scripts

### 4.3 Configure Environment Variables
In Railway dashboard, go to your project → **Variables** and add:

```
PORT=5000
NODE_ENV=production

SUPABASE_URL=https://hncighhoeqmrvmdxdtns.supabase.co
SUPABASE_ANON_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhuY2lnaGhvZXFtcnZtZHhkdG5zIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njk2ODg5MjMsImV4cCI6MjA4NTI2NDkyM30.hL7_QzOJozTJHqQlVpVL_vwp-659yv0X_n8ZQknZ1Ig
SUPABASE_SERVICE_ROLE_KEY=your_supabase_service_role_key

CLOUDINARY_CLOUD_NAME=your_cloudinary_cloud_name
CLOUDINARY_API_KEY=your_cloudinary_api_key
CLOUDINARY_API_SECRET=your_cloudinary_api_secret

ALLOWED_ORIGINS=https://your-railway-url.railway.app,https://your-custom-domain.com
```

**Important**: Get your Railway URL from the project settings before adding ALLOWED_ORIGINS.

---

## 📝 STEP 5: Files That Will Be Deployed

Railway will automatically upload and deploy:

### Root Level Files
```
package.json              ← Must have "build" and "start" scripts
package-lock.json
.gitignore
.env.example             ← Reference file (actual .env created on Railway)
vite.config.ts           ← Frontend build config
tailwind.config.ts       ← Styling config
tsconfig.json            ← TypeScript config
tsconfig.app.json
tsconfig.node.json
postcss.config.js
eslint.config.js
index.html               ← Frontend entry point
```

### Frontend Folder (src/)
```
src/
  ├── components/        ← React components
  ├── pages/            ← Page components
  ├── lib/              ← Utilities and API calls
  ├── hooks/            ← Custom React hooks
  ├── assets/           ← Images and assets
  ├── App.tsx
  ├── main.tsx
  ├── App.css
  ├── index.css
  └── ...
```

### Backend Folder (server/)
```
server/
  ├── package.json      ← Backend dependencies
  ├── index.js          ← Main server file
  ├── config/           ← Configuration files
  ├── routes/           ← API routes
  ├── models/           ← Database models
  ├── utils/            ← Helper functions
  ├── database/         ← SQL files
  └── ...
```

---

## ✅ STEP 6: Deployment Process

### 6.1 Railway Build Process
Railway will:
1. **Clone** your GitHub repo
2. **Run** `npm run build` 
   - Installs frontend dependencies
   - Builds React app to `dist/` folder
   - Installs server dependencies
3. **Run** `npm start` (production mode)
   - Starts your Express server
   - Serves frontend files from `dist/` folder

### 6.2 Monitor Deployment
1. Go to Railway Dashboard
2. Click on your project
3. Watch the build logs in real-time
4. Once deployed, you'll see a green checkmark

---

## 🌐 STEP 7: Get Your Live URL

1. In Railway Dashboard, click on your project
2. Find the **"Generate Domain"** button in the top right
3. Railway will assign: `https://your-app-name.railway.app`
4. This is your live website!

---

## 🔐 STEP 8: Update CORS Settings

After getting your Railway URL:

1. Go to Railway Dashboard → Variables
2. Update `ALLOWED_ORIGINS` to include your Railway URL:
```
ALLOWED_ORIGINS=https://your-app-name.railway.app
```
3. This allows your frontend to communicate with your backend API

---

## 🐛 STEP 9: Test Your Deployment

1. Visit: `https://your-app-name.railway.app`
2. Test the login (should work with rrmotors / rrmotors@1)
3. Test bike browsing
4. Test form submissions
5. Check browser console for any errors

---

## 📊 STEP 10: View Logs & Debug

If something goes wrong:

1. Railway Dashboard → Your Project
2. Click on the service/deployment
3. Click **"Logs"** to see real-time logs
4. Look for error messages
5. Fix issues locally, commit to GitHub
6. Railway will auto-redeploy

---

## 💰 Railway Pricing (Free Tier)

- **Free monthly credit**: $5 (enough for small projects)
- **No credit card required** for free tier
- **Pay as you go** if you exceed free tier
- Database queries to Supabase are cheap

---

## 🚀 Quick Deployment Summary

```
1. Create GitHub repo
2. Push your code to GitHub
3. Sign up on Railway.app
4. Connect GitHub to Railway
5. Add environment variables
6. Railway auto-builds and deploys
7. Get your live URL
8. Update CORS settings
9. Test your website
10. Done! 🎉
```

---

## 📞 Common Issues & Solutions

### Issue: Build fails
**Solution**: Check build logs, ensure all dependencies in package.json

### Issue: "Cannot find module"
**Solution**: Run `npm install` locally, commit package-lock.json

### Issue: API not working
**Solution**: Check environment variables, verify ALLOWED_ORIGINS

### Issue: Static files not serving
**Solution**: Ensure frontend is built to `dist/` folder before deployment

### Issue: Database connection error
**Solution**: Check Supabase credentials in environment variables

---

## 🎯 Next Steps

1. Get a custom domain (optional)
   - Buy domain from GoDaddy, Namecheap, etc.
   - Connect to Railway in settings

2. Set up CI/CD
   - Railway auto-deploys when you push to GitHub
   - No additional setup needed!

3. Monitor performance
   - Use Railway metrics tab
   - Check logs for errors

4. Scale up (if needed)
   - Upgrade from free tier
   - Add more resources

---

**Your website will be live at**: https://your-app-name.railway.app 🎉
