---
title: "Deploy Checklist"
permalink: /deploy-checklist/
sitemap: false
---

# Post-Deploy Checklist

## Before First Deploy

- [ ] Update `_config.yml`:
  - [ ] `url`: Change `username` to your actual GitHub username
  - [ ] `title`: Set your actual site title
  - [ ] `description`: Set your actual site description
  - [ ] `author.name`: Your real name
  - [ ] `author.bio`: Your actual bio
  - [ ] `author.email`: Your email
  - [ ] Social links: Update all GitHub/LinkedIn/YouTube/Facebook URLs
- [ ] Replace placeholder images:
  - [ ] `assets/images/avatar.jpg` — your profile photo
  - [ ] `assets/images/default-banner.jpg` → `default-banner.jpg`
- [ ] Update sample content in `_posts/` and `_projects/` with your real content

## GitHub Pages Setup

1. Go to repository Settings → Pages
2. Under "Build and deployment" → Source, select **"GitHub Actions"**
3. Save settings

## After Deploy

- [ ] Visit `https://username.github.io` and verify site loads
- [ ] Check HTTPS is active (padlock icon in browser)
- [ ] Verify all 4 navigation links work (Home, Bài viết, Dự án, Giới thiệu)
- [ ] Test Dark Mode toggle button
- [ ] View `/sitemap.xml` — confirm all pages are listed
- [ ] View `/feed.xml` — confirm RSS feed is valid
- [ ] Test on mobile device (layout should be single column < 768px)
- [ ] Test on desktop (layout should have sidebar on right)
- [ ] Check a post with attachments — verify external links open in new tab
- [ ] Check a post without `header.overlay_image` — verify default banner appears

## Correctness Properties Verification

Run these checks after deploy to confirm all 10 properties hold:

### Property 1: No post in both Featured and Latest sections
- Visit home page, check no post title appears in both "Bài viết nổi bật" and "Bài viết mới nhất"

### Property 2: Featured Articles ≤ 5 posts, all featured: true
- Verify "Bài viết nổi bật" shows at most 5 posts

### Property 3: Featured Project is newest featured: true project
- Verify "Dự án nổi bật" shows E-Commerce Platform (2026-04-01, most recent)

### Property 4: Fallback banner for posts without overlay_image
- Create a test post without `header.overlay_image` and verify default banner appears

### Property 5: Attachment URL classification
- In "Docker Best Practices" post, verify:
  - "Slide trình bày" (https://...) opens in new tab
  - "Tải PDF" (/assets/...) has download attribute

### Property 6: Dark mode persistence
- Toggle to dark mode, refresh page → dark mode should be preserved

### Property 7: Toggle icon reflects theme
- Light mode → 🌙 icon; Dark mode → ☀️ icon

### Property 8: Toggle involution
- Click toggle twice → returns to original state

### Property 9: SEO meta tags on all pages
- View page source of any page, check for title, og:title, og:description, og:image

### Property 10: Articles grouped by year
- Visit /articles/ — posts should be grouped under year headings (2025, 2026)
