# ✅ Railway Deployment Checklist

## Pre-Deployment Checklist

### Code Preparation
- [ ] Frontend builds successfully: `npm run build:app`
- [ ] No console errors in development
- [ ] All API calls use relative paths (`/api/...`)
- [ ] Backend starts without errors: `npm run dev:server`
- [ ] `.gitignore` file exists with node_modules and .env
- [ ] `.env.example` file exists with all required variables

### Git & GitHub
- [ ] GitHub account created
- [ ] Code committed to git: `git add . && git commit -m "message"`
- [ ] GitHub repository created (empty, no README)
- [ ] Code pushed to GitHub: `git push -u origin main`
- [ ] Check GitHub shows your latest code

### Railway Setup
- [ ] Railway account created at railway.app
- [ ] Logged into Railway Dashboard
- [ ] GitHub authorization granted to Railway

## Deployment Steps

### Step 1: Create New Project
- [ ] Click "New Project" on Railway Dashboard
- [ ] Select "Deploy from GitHub repo"
- [ ] Authorize Railway with GitHub
- [ ] Select your `bikeshowroom` repository
- [ ] Railway detects Node.js environment

### Step 2: Set Environment Variables
In Railway Dashboard → Variables, add all these:

#### Server Configuration
- [ ] `PORT` = `5000`
- [ ] `NODE_ENV` = `production`

#### Supabase Credentials
- [ ] `SUPABASE_URL` = `https://hncighhoeqmrvmdxdtns.supabase.co`
- [ ] `SUPABASE_ANON_KEY` = (copy from your account)
- [ ] `SUPABASE_SERVICE_ROLE_KEY` = (from Supabase settings)

#### Cloudinary Credentials
- [ ] `CLOUDINARY_CLOUD_NAME` = (your cloud name)
- [ ] `CLOUDINARY_API_KEY` = (from Cloudinary dashboard)
- [ ] `CLOUDINARY_API_SECRET` = (from Cloudinary dashboard)

#### CORS Settings (after getting Railway URL)
- [ ] `ALLOWED_ORIGINS` = `https://your-app-name.railway.app`

### Step 3: Monitor Build
- [ ] Watch build logs in real-time
- [ ] Build completes without errors
- [ ] See "Generated domain" message
- [ ] Note your Railway URL: `https://your-app-name.railway.app`

### Step 4: Post-Deployment
- [ ] Update `ALLOWED_ORIGINS` with actual Railway URL
- [ ] Wait for redeployment (2-3 minutes)
- [ ] Visit your live URL
- [ ] Check if site loads

## Testing Checklist

### Frontend Testing
- [ ] Website loads at your Railway URL
- [ ] Navigation works (all pages load)
- [ ] CSS/styling looks correct
- [ ] Images load properly
- [ ] No 404 errors in console

### Backend Testing
- [ ] Admin login works (rrmotors / rrmotors@1)
- [ ] Bike listing loads from database
- [ ] Can view bike details
- [ ] Forms submit successfully
- [ ] Check "Log in" functionality

### Database Testing
- [ ] Supabase tables accessible
- [ ] Data displays correctly
- [ ] New submissions save to database
- [ ] No database connection errors

### API Testing
- [ ] API calls work from deployed site
- [ ] No CORS errors in console
- [ ] All endpoints respond correctly
- [ ] Image uploads work (if applicable)

## Troubleshooting Checklist

If deployment fails:
- [ ] Check Railway build logs for errors
- [ ] Verify all environment variables are set
- [ ] Ensure package.json has correct "build" and "start" scripts
- [ ] Check if dist/ folder is created in build
- [ ] Verify server/package.json has all dependencies

If site loads but features don't work:
- [ ] Check browser console for errors
- [ ] Check Railway logs for API errors
- [ ] Verify environment variables are correct
- [ ] Check CORS is properly configured
- [ ] Verify Supabase connection details

If login doesn't work:
- [ ] Verify admin credentials are hardcoded in server/index.js
- [ ] Check authentication endpoint responds correctly
- [ ] Verify localStorage is working

## Post-Deployment

### Monitoring
- [ ] Set up email notifications for build failures
- [ ] Monitor Railway metrics daily
- [ ] Check logs for any errors
- [ ] Test critical features weekly

### Maintenance
- [ ] Pull latest code to local: `git pull origin main`
- [ ] Fix bugs and test locally
- [ ] Commit and push to GitHub
- [ ] Railway auto-redeploys within 2-3 minutes

### Custom Domain (Optional)
- [ ] Buy domain from registrar
- [ ] Get Railway custom domain link
- [ ] Update DNS records at registrar
- [ ] Wait for DNS propagation (up to 24 hours)
- [ ] Update `ALLOWED_ORIGINS` to include custom domain

## Success Indicators ✨

You're successfully deployed when:
- ✅ Website is live at Railway URL
- ✅ All pages load without errors
- ✅ Admin login works
- ✅ Database queries work
- ✅ API endpoints respond
- ✅ No CORS errors
- ✅ Images display correctly
- ✅ Forms submit data

---

## Quick Commands Reference

```bash
# Local testing before deployment
npm run build              # Build entire project
npm run build:app          # Build just frontend
npm install --prefix server # Install server dependencies
npm start                  # Start server

# Git commands
git add .                  # Stage all changes
git commit -m "message"    # Commit changes
git push origin main       # Push to GitHub

# Viewing your site
# Once deployed, visit: https://your-app-name.railway.app
```

---

**Last Updated**: February 5, 2026
**Status**: Ready for Deployment 🚀
