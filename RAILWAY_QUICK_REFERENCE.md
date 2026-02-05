# 🚀 Railway Deployment - Quick Summary

## What Gets Uploaded?

```
Your GitHub Repository
├── package.json (root)              ← Railway reads this
├── .env                             ← NOT uploaded (create on Railway)
├── .env.example                     ← Reference file
├── src/                             ← Frontend React code
│   ├── components/
│   ├── pages/
│   ├── lib/
│   └── ...all React files
├── server/                          ← Backend Express code
│   ├── index.js
│   ├── package.json
│   ├── routes/
│   ├── config/
│   └── ...all server files
├── public/                          ← Static files
├── vite.config.ts
├── tailwind.config.ts
├── tsconfig.json
└── ...all config files
```

## What Happens During Deployment?

```
1. GitHub Sync
   You push code → Railway pulls from GitHub
   
2. Build Phase
   npm run build
   ├── npm run build:app (creates dist/ folder)
   └── npm install --prefix server
   
3. Start Phase
   npm start
   ├── Starts server on PORT 5000
   └── Serves frontend from dist/ folder
   
4. Go Live
   Railway assigns URL
   Example: https://bikeshowroom.railway.app
```

## Environment Variables You Need

```env
PORT=5000
NODE_ENV=production

SUPABASE_URL=https://hncighhoeqmrvmdxdtns.supabase.co
SUPABASE_ANON_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
SUPABASE_SERVICE_ROLE_KEY=your_key_here

CLOUDINARY_CLOUD_NAME=your_name
CLOUDINARY_API_KEY=your_key
CLOUDINARY_API_SECRET=your_secret

ALLOWED_ORIGINS=https://bikeshowroom.railway.app
```

## Step-by-Step in One Page

### 1️⃣ Prepare Code
```bash
# Make sure everything is committed
git add .
git commit -m "Ready for Railway"
git push origin main
```

### 2️⃣ Create GitHub Repo
- Go to github.com/new
- Create "bikeshowroom" repo
- Push your code there

### 3️⃣ Go to Railway
- Visit railway.app
- Sign up (free)
- Click "New Project"
- Select "Deploy from GitHub"

### 4️⃣ Connect Repository
- Authorize Railway with GitHub
- Select bikeshowroom repo
- Click Deploy

### 5️⃣ Add Environment Variables
In Railway Dashboard:
- Click Variables
- Add all env vars from .env.example
- With YOUR actual values

### 6️⃣ Wait for Build
- Watch the logs
- Takes 2-5 minutes
- Green checkmark = Success!

### 7️⃣ Get Your URL
- Railway shows your domain
- Example: bikeshowroom.railway.app
- Your site is LIVE!

### 8️⃣ Update CORS
- Add your Railway URL to ALLOWED_ORIGINS
- Save changes
- Railway redeploys automatically

## Testing Your Deployment

| Feature | Test Command |
|---------|---|
| Site loads | Visit railway.app URL |
| Admin login | Username: rrmotors, Password: rrmotors@1 |
| Bikes display | Check bikes listing page |
| API works | Check browser Network tab |
| Database works | Check if data loads from Supabase |

## Important Files Modified

| File | Purpose | Modified? |
|------|---------|-----------|
| package.json | Build & start scripts | ✅ Yes |
| server/index.js | Serve frontend + API | ✅ Yes |
| .env.example | Document env vars | ✅ Yes |

## Common Issues & Quick Fixes

| Problem | Solution |
|---------|----------|
| Build fails | Check build logs, ensure dependencies installed |
| Site loads but no data | Check env variables, verify Supabase credentials |
| CORS errors | Update ALLOWED_ORIGINS with Railway URL |
| Login doesn't work | Check if credentials in server/index.js are correct |
| API returns 404 | Make sure server is running, check routes |

## Files NOT Uploaded (Ignored)

```
node_modules/          ← Railway installs these
dist/                  ← Railway builds this
.env                   ← You create this on Railway
.git/                  ← Git metadata
```

## What Railway Provides (Free)

- 🚀 Deploy automatically on every git push
- 🔒 SSL certificate (HTTPS)
- 🌐 Free domain (your-app.railway.app)
- 📊 Monitoring & logs
- 💬 Support
- 💰 $5/month free credit

## Your Deployment Journey

```
START
  ↓
[1. Code Ready on GitHub]
  ↓
[2. Railway Project Created]
  ↓
[3. Environment Variables Added]
  ↓
[4. Build Succeeds]
  ↓
[5. Site Goes Live]
  ↓
[6. Test All Features]
  ↓
SUCCESS! 🎉
```

## Key Numbers to Remember

- **Port**: 5000 (backend server)
- **Build time**: 2-5 minutes
- **Redeployment time**: 2-3 minutes (on git push)
- **Free monthly credit**: $5
- **Browser console check**: Always do this first when debugging

## Useful Links

- Railway Dashboard: https://railway.app/dashboard
- Railway Docs: https://docs.railway.app
- GitHub: https://github.com

## After Deployment

✅ **Monitor** - Check logs occasionally
✅ **Update** - Make changes locally, push to GitHub, Railway redeploys
✅ **Backup** - Your code stays in GitHub
✅ **Scale** - Upgrade plan if needed

---

**Your website will be accessible at:**
```
https://your-railway-url.railway.app
```

**Status**: 🟢 Ready to Deploy!
