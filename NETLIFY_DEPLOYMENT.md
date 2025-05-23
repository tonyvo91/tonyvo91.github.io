# Deploying Your Portfolio to Netlify

This guide provides a simple process to deploy your personal portfolio to Netlify, making it accessible on the internet with a custom domain.

## Benefits of Netlify vs EC2

- **Free tier** for static sites with generous bandwidth
- **Zero maintenance** - no server management required
- **Built-in CI/CD** - automatic deployment from Git
- **Free SSL certificates** - HTTPS enabled automatically
- **Global CDN** - faster loading worldwide
- **Custom domains** with simple setup

## Deployment Options

### Option 1: Deploy via Netlify UI (Easiest)

1. Create a Netlify account at [netlify.com](https://www.netlify.com/)
2. Click "Add new site" > "Import an existing project"
3. Drag and drop your entire `/Users/tony/Documents/personal_portfolio` folder to the upload area
4. Wait for deployment (usually under 1 minute)
5. Your site will be live at a random `*.netlify.app` subdomain

### Option 2: Deploy via Netlify CLI (More control)

1. Install Netlify CLI:
   ```
   npm install -g netlify-cli
   ```

2. Navigate to your portfolio directory:
   ```
   cd /Users/tony/Documents/personal_portfolio
   ```

3. Login to Netlify:
   ```
   netlify login
   ```

4. Initialize and deploy your site:
   ```
   netlify init
   netlify deploy --prod
   ```

## Adding a Custom Domain

1. In the Netlify dashboard, go to your site > "Domain settings"
2. Click "Add custom domain"
3. Enter your domain name and follow the verification process
4. Update your domain's DNS settings to point to Netlify's servers (instructions provided by Netlify)

## Updating Your Site

To update your site after making changes, simply:

### For manual uploads:
- Go to your site in the Netlify dashboard
- Click "Deploys" > "Drag and drop" your updated files

### For CLI:
```
cd /Users/tony/Documents/personal_portfolio
netlify deploy --prod
```

## Cost Considerations

- The Netlify free tier includes:
  - Unlimited personal or commercial projects
  - 100GB bandwidth/month
  - 300 build minutes/month
  - Custom domains with HTTPS
  - Continuous deployment
  
- This is more than sufficient for a personal portfolio site

## Alternatives

If you still prefer AWS, consider **AWS Amplify** instead of EC2:
- Similar to Netlify with a free tier
- Integrated with AWS ecosystem
- Simple static site hosting with CI/CD
- Automatic HTTPS
