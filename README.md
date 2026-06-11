# Personal Blog & Portfolio — GitHub Pages

A personal blog and portfolio site built with Jekyll + Minimal Mistakes Theme, deployed on GitHub Pages.

## Local Development

### Prerequisites
- Ruby 3.1+
- Bundler

### Setup

```bash
bundle install
```

### Run locally

```bash
bundle exec jekyll serve
```

Visit `http://localhost:4000` in your browser.

### Build for production

```bash
bundle exec jekyll build
```

## Deployment

### GitHub Pages Setup (first time)

1. Go to your repository **Settings → Pages**
2. Under "Build and deployment" → **Source**, select **"GitHub Actions"**
3. Save settings

### Deploy

To deploy the site, you can either publish a new Release on GitHub or trigger the workflow manually:

#### Option 1: Deploy by creating a new Release (Recommended)
1. Go to your GitHub repository.
2. Under the **Releases** section on the right side, click **Draft a new release** (or **Create a new release**).
3. Choose/create a new tag (e.g., `v1.0.0`) and publish the release.
4. The deployment workflow will automatically run and publish the site.

#### Option 2: Run workflow manually
1. Go to the **Actions** tab on your GitHub repository.
2. In the left sidebar, select the **Deploy Jekyll to GitHub Pages** workflow.
3. Click the **Run workflow** dropdown, select the branch (e.g., `main`), and click the **Run workflow** button.

After the workflow completes, find your live URL at **Settings → Pages** (format: `https://username.github.io`).

## Structure

- `_posts/` — Blog posts (format: `YYYY-MM-DD-title.md`)
- `_projects/` — Portfolio projects
- `_pages/` — Static pages (about, articles, projects listing)
- `assets/` — Images, documents, JavaScript
- `_sass/custom/` — Custom SCSS styles
- `_includes/` — Custom Liquid includes
- `_data/navigation.yml` — Navigation menu

## Customization

Edit `_config.yml` to update:
- Site title, description, URL
- Author name, bio, avatar, social links
- Theme skin

## Placeholder Images

The following placeholder files need to be replaced with real images before publishing:

- `assets/images/avatar.svg` → Replace with your actual profile photo (rename to `avatar.jpg` and update `_config.yml`)
- `assets/images/default-banner.jpg` → Replace with a real banner image (rename to `default-banner.jpg`)

> **Note:** `_config.yml` references `default-banner.jpg` as the site-wide fallback banner. Until a real image is added, pages without an explicit `header.overlay_image` will use the SVG placeholder.
