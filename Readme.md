# How edit blog posts?

Just run `./launch_local_editor.sh`

# How to deploy the content?

The content is automatically transformed to static webpages with Github actions and pushed to Netlify when the code is pushed to this repo with a `git push`.

But first we need some configuration.
    1. Create a new site on [Netlify](https://app.netlify.com/)
    2. Edit `./deploy_static.sh` and replace `WEB_URL=http://example.com` with your website url
    2. Go to your repository on Github then `Settings > Secrets` and add `NETLIFY_AUTH_TOKEN` and `NETLIFY_SITE_ID` as decribed [here](https://github.com/marketplace/actions/netlify-deploy#inputs).
    3. Just edit your articles on your locally running editor at `http://localhost:2368/ghost`
    4. Commit your changes + `git push` and you're done, you can go to the Github "Actions" tab on your repository page to check the deployment progress

# Alternatives?

[CloudFlare pages](https://pages.cloudflare.com/) will be interesting when it will get released.