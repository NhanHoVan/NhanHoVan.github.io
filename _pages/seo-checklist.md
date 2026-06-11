---
title: "SEO Checklist"
permalink: /seo-checklist/
sitemap: false
---

# SEO Verification Checklist

## Meta Tags (Property 9)
- ✅ `jekyll-seo-tag` plugin configured → generates title, description, og:title, og:description, og:image, twitter:card
- ✅ `title` set in `_config.yml`
- ✅ `description` set in `_config.yml`
- ✅ `url` set in `_config.yml`

## og:image (Requirement 8.2)
- ✅ Posts with `header.overlay_image` will have that URL as og:image
- ✅ All sample posts have `header.overlay_image: /assets/images/default-banner.jpg`

## Sitemap (Requirement 8.3)
- ✅ `jekyll-sitemap` plugin configured → generates `/sitemap.xml`
- ✅ Absolute URLs will use `url` from `_config.yml`

## RSS Feed (Requirement 8.4)
- ✅ `jekyll-feed` plugin configured → generates `/feed.xml`

## Syntax Highlighting (Requirement 8.5)
- ✅ `highlighter: rouge` configured in `_config.yml`
- ✅ `markdown: kramdown` configured (uses Rouge)
- ✅ Sample posts contain code blocks in multiple languages: bash, TypeScript, JavaScript, YAML, Python, SQL
