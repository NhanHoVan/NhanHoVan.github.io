# Personal Website & Technical Blog — Design Document

## 1. Project Goal

Xây dựng website cá nhân phục vụ:

- Giới thiệu bản thân
- Chia sẻ kiến thức kỹ thuật
- Trình bày các dự án đã thực hiện
- Lưu trữ hồ sơ nghề nghiệp dài hạn

**Technology Stack:**

- Jekyll
- GitHub Pages
- Minimal Mistakes Theme
- GitHub Actions

---

## 2. Site Map

```
Home
Articles
Projects
About Me
```

---

## 3. Visual Design

### Color Scheme

| Element       | Light Mode                                                          | Dark Mode     |
|---------------|---------------------------------------------------------------------|---------------|
| Background    | `#FFFFFF`                                                           | `#1A1A1A`     |
| Text          | `#111111`                                                           | `#EEEEEE`     |
| Border / Rule | `#E0E0E0`                                                           | `#333333`     |
| Link          | Màu mặc định trình duyệt                                            | (giữ nguyên)  |
| Accent        | Không dùng màu accent cố định — màu sắc đến từ hình ảnh, icon, link |               |

> **Nguyên tắc:** Giao diện trắng-đen tối giản. Màu sắc duy nhất là từ hình ảnh, icon mạng xã hội (màu thương hiệu tự nhiên) và hyperlink mặc định.

### Typography

- **Font:** Sans-serif — dùng font mặc định của Minimal Mistakes (`-apple-system`, `BlinkMacSystemFont`, `sans-serif`)
- **Base font size:** `16px` (không override nếu theme mặc định đã đủ lớn)
- **Line height:** `1.6` (mặc định theme)
- **Heading:** Bold, scale chuẩn, không dùng màu khác ngoài màu text

### Dark / Light Mode

- Sử dụng **skin có sẵn của Minimal Mistakes** (ví dụ: `skin: "default"` cho light, `skin: "dark"` cho dark)
- Thêm **toggle button** bằng JavaScript tùy chỉnh nhỏ để chuyển đổi skin động
- Lưu preference vào `localStorage`
- Default: `light` — không tự động detect OS để tránh phức tạp

> **Lưu ý triển khai:** Toggle dark/light là phần duy nhất cần custom JS vì Minimal Mistakes không hỗ trợ sẵn. Phần còn lại dùng skin có sẵn.

### Responsive & Breakpoints

Sử dụng responsive mặc định của Minimal Mistakes:

| Màn hình        | Layout                                   |
|-----------------|------------------------------------------|
| Desktop ≥ 768px | 2 cột (nội dung + sidebar phải)          |
| Mobile < 768px  | 1 cột — sidebar xuống dưới nội dung      |

- **Max content width:** Dùng `wide` layout của theme (max ~1280px)
- Không override breakpoint — dùng mặc định theme

---

## 4. Global Layout

### Header / Banner

- Sử dụng tính năng `header.overlay_image` có sẵn của Minimal Mistakes
- **Height:** Dùng mặc định theme (thường ~200–250px) — **không tăng cao hơn 300px**
- **Overlay:** Dùng `header.overlay_color` hoặc `header.overlay_filter` có sẵn
- **Nguồn ảnh (theo thứ tự ưu tiên):**
  1. `header.overlay_image` khai báo trong front matter của từng trang/bài viết
  2. `header.overlay_image` khai báo trong `_config.yml` (ảnh chủ đề chung)
  3. **Fallback:** `assets/images/default-banner.jpg` — ảnh mặc định cố định

```yaml
# Ví dụ front matter khai báo banner
header:
  overlay_image: /assets/images/posts/2024-01-01-ten-bai.jpg
  overlay_filter: 0.3
```

- **Hình ảnh trong bài viết:** Full-width trong vùng nội dung, không cần giới hạn thêm

### Navigation Menu

- Sử dụng navigation mặc định của Minimal Mistakes (`_data/navigation.yml`)
- **Sticky:** Bật sẵn trong theme (`masthead` sticky)
- Cấu hình trong `_data/navigation.yml`:

```yaml
main:
  - title: "Home"
    url: /
  - title: "Articles"
    url: /articles/
  - title: "Projects"
    url: /projects/
  - title: "About Me"
    url: /about/
```

- Mobile: Hamburger menu có sẵn trong theme
- Dark/Light toggle: Thêm vào cuối navigation bằng custom include

---

## 5. Home Page

**Mục tiêu:** Trang tổng quan, tham chiếu dữ liệu từ các trang khác.

**Layout:** 1 cột (`layout: home` hoặc custom `layout: splash`)

### Quy tắc loại trừ nội dung giữa các section

Một bài viết chỉ xuất hiện **ở một section duy nhất** trên Home, theo thứ tự ưu tiên:

1. Nếu `featured: true` → hiển thị ở **Featured Articles**
2. Nếu không featured → có thể xuất hiện ở **Latest Updates**

> Featured Articles và Latest Updates **không được trùng bài**.

### 5.1 Featured Articles

- Hiển thị **3–5 bài viết** có `featured: true` trong front matter
- Nếu có nhiều hơn 5 bài `featured: true` → ưu tiên theo **ngày mới nhất**
- Mỗi item hiển thị:
  - Thumbnail (`header.overlay_image` của bài, fallback về default banner)
  - Title
  - Publish Date
  - Excerpt (~2 dòng)

### 5.2 Featured Project

- Hiển thị **1 dự án** có `featured: true`
- Nếu có nhiều → lấy dự án **mới nhất theo `date`**
- Thông tin hiển thị:
  - Tên dự án
  - Mô tả ngắn
  - Tech Stack (danh sách tag)
  - Link chi tiết

### 5.3 Latest Updates

- Danh sách **5 bài viết mới nhất** có `featured: false` (hoặc không khai báo `featured`)
- **Loại trừ** các bài đã xuất hiện trong Featured Articles
- Hiển thị: Title + Publish Date (dạng list đơn giản)

---

## 6. Articles Page

**Layout:** `layout: single` với `sidebar: right` (mặc định Minimal Mistakes)

### 6.1 Left — Nội dung bài viết

- Hiển thị nội dung Markdown được render
- **Article Metadata** (dùng tính năng sẵn có của theme):
  - Title
  - Publish Date
  - Category
  - Tags
  - Reading Time — bật bằng `read_time: true` trong front matter hoặc `_config.yml`
- Body: Heading, paragraph, code block (Rouge highlighter), hình ảnh, blockquote
- **Không có:** Navigation bài trước/tiếp, Related Posts

```yaml
# _config.yml — bật globally
read_time: true
related: false
```

### 6.2 Right — Sidebar (mặc định theme)

Sử dụng `author profile` sidebar có sẵn:

- Avatar + tên tác giả
- Bio ngắn
- Links (GitHub, LinkedIn, Email...)

> Sidebar danh sách bài viết / Categories / Tags sử dụng **trang archive có sẵn** của Minimal Mistakes (`/categories/`, `/tags/`, `/year-archive/`) thay vì nhúng vào sidebar — đơn giản hơn, không cần custom.

---

## 7. Projects Page

**Layout:** `layout: single` với sidebar phải (mặc định)

### 7.1 Left — Chi tiết dự án

Nội dung viết bằng Markdown trong file `_projects/`:

- Tên dự án (title)
- Business Overview
- Tech Stack
- Responsibilities
- Challenges
- Solutions
- Lessons Learned
- Screenshots (hình ảnh inline trong Markdown)
- Repository / Demo Links

### 7.2 Right — Danh sách dự án

Sử dụng sidebar author profile mặc định (giống Articles).

> Danh sách các dự án khác: tạo trang `/projects/` dạng archive list dùng `layout: collection` có sẵn của theme.

---

## 8. About Me Page

**Layout:** `layout: single` với sidebar phải (mặc định Minimal Mistakes)

### 8.1 Right Sidebar — Author Profile (mặc định theme)

Cấu hình trong `_config.yml` → `author:`:

```yaml
author:
  name: "Họ Tên"
  avatar: /assets/images/avatar.jpg
  bio: "Vị trí hiện tại · X năm kinh nghiệm"
  location: "Việt Nam"
  email: "email@example.com"
  links:
    - label: "GitHub"
      icon: "fab fa-fw fa-github"
      url: "https://github.com/username"
    - label: "LinkedIn"
      icon: "fab fa-fw fa-linkedin"
      url: "https://linkedin.com/in/username"
    - label: "YouTube"
      icon: "fab fa-fw fa-youtube"
      url: "https://youtube.com/..."
    - label: "Facebook"
      icon: "fab fa-fw fa-facebook"
      url: "https://facebook.com/..."
```

> Icon dùng màu thương hiệu tự nhiên qua FontAwesome — đây là ngoại lệ màu sắc duy nhất ngoài trắng-đen.

### 8.2 Left Content — Viết bằng Markdown

Nội dung file `_pages/about.md`, từ trên xuống:

#### Career Summary
Đoạn văn tóm tắt kinh nghiệm tổng thể (~3–5 câu)

#### Working Experience
Theo **timeline** (mới nhất lên trên):

- Company Name
- Role / Title
- Duration (`MM/YYYY – MM/YYYY` hoặc `Present`)
- Business Domain
- Achievements (bullet points)
- Tech Stack (inline tags)

#### Project Experience

- Tên dự án
- Business Description
- Team Size
- Responsibilities
- Tech Stack
- Result

#### Certifications

- Tên chứng chỉ
- Đơn vị cấp
- Ngày cấp
- Link xác thực

#### Awards

- Tên giải thưởng
- Thời gian
- Mô tả ngắn

---

## 9. Đa ngôn ngữ (i18n)

**Chiến lược:** Chủ yếu tiếng Việt, một số bài viết tiếng Anh — **không dùng plugin i18n**.

### Quy ước

- Bài tiếng Việt: viết bình thường, không cần khai báo thêm
- Bài tiếng Anh: thêm tag `lang: en` trong front matter

```yaml
# Bài viết tiếng Anh
---
title: "English Article Title"
lang: en
tags: [english, tutorial]
---
```

- Không tạo URL song song (`/en/`, `/vi/`) — tất cả chung một URL namespace
- Navigation menu và UI labels: **tiếng Việt là mặc định**
- Người đọc biết bài tiếng Anh qua: tag `english`, hoặc title bài viết

> **Không cần thêm plugin.** Đơn giản, không làm phức tạp cấu trúc site.

---

## 10. Content Structure & Quy ước Đặt Tên File

```
_posts/
  YYYY-MM-DD-ten-bai-viet.md         # Tiếng Việt (slug dùng tiếng Anh hoặc viết không dấu)
  YYYY-MM-DD-english-article.md      # Tiếng Anh

_projects/
  YYYY-MM-DD-ten-du-an.md

_pages/
  about.md
  articles.md
  projects.md

assets/
  images/
    default-banner.jpg               # Fallback banner toàn site
    avatar.jpg                       # Ảnh cá nhân
    posts/
      YYYY-MM-DD-ten-bai.jpg         # Banner theo tên file bài viết
    projects/
      YYYY-MM-DD-ten-du-an.jpg
  certificates/
    YYYY-certificate-name.jpg
```

**Quy tắc đặt tên:**

- Prefix `YYYY-MM-DD` bắt buộc (Jekyll yêu cầu cho `_posts/`)
- Slug: chữ thường, dùng `-` thay khoảng trắng, không dấu tiếng Việt
- Ảnh banner đặt cùng tên với file bài viết để dễ tra cứu

---

## 11. Front Matter Schema

### _posts/

```yaml
---
title: "Tiêu đề bài viết"
date: YYYY-MM-DD
categories: [Category]
tags: [tag1, tag2]
featured: false            # true → xuất hiện ở Featured Articles trên Home
lang: vi                   # vi (mặc định) hoặc en
header:
  overlay_image: /assets/images/posts/YYYY-MM-DD-ten-bai.jpg
  overlay_filter: 0.3      # 0.0–1.0, tối overlay
excerpt: "Tóm tắt ngắn hiển thị trên danh sách (~2 dòng)"
read_time: true
---
```

### _projects/

```yaml
---
title: "Tên dự án"
date: YYYY-MM-DD
featured: false            # true → xuất hiện ở Featured Project trên Home
description: "Mô tả ngắn"
tech_stack: [React, Node.js, PostgreSQL]
header:
  overlay_image: /assets/images/projects/YYYY-MM-DD-ten-du-an.jpg
  overlay_filter: 0.3
repo_url: "https://github.com/..."
demo_url: "https://..."    # tuỳ chọn
---
```

---

## 12. Jekyll Config (_config.yml) — Các mục chính

```yaml
# Theme
remote_theme: mmistakes/minimal-mistakes
minimal_mistakes_skin: "default"   # hoặc "dark" — chuyển đổi bằng JS toggle

# Site
title: "Tên Website"
locale: "vi"
url: "https://username.github.io"

# Build
markdown: kramdown
highlighter: rouge             # Code highlight mặc định
permalink: /:year/:month/:day/:title/

# Reading time (global)
read_time: true
related: false                 # Tắt related posts

# Collections
collections:
  projects:
    output: true
    permalink: /projects/:slug/

# Defaults
defaults:
  - scope:
      path: ""
      type: posts
    values:
      layout: single
      author_profile: true
      read_time: true
      related: false
  - scope:
      path: ""
      type: projects
    values:
      layout: single
      author_profile: true

# Plugins
plugins:
  - jekyll-seo-tag
  - jekyll-feed
  - jekyll-sitemap
  - jekyll-paginate
```

---

## 13. SEO

- `jekyll-seo-tag`: tự động tạo meta title, description, og:image từ front matter
- `jekyll-feed`: RSS feed tại `/feed.xml`
- `jekyll-sitemap`: sitemap tại `/sitemap.xml`
- `og:image` mặc định lấy từ `header.overlay_image` của bài viết

---

## 14. Future Enhancements

Theo thứ tự ưu tiên:

| Priority | Feature         | Ghi chú                                          |
|----------|-----------------|--------------------------------------------------|
| P1       | Dark Mode Toggle | Custom JS nhỏ — phần duy nhất cần custom        |
| P1       | Code Highlight   | Rouge — có sẵn trong Jekyll, chỉ cần bật config |
| P2       | Search           | Lunr.js — Minimal Mistakes hỗ trợ sẵn           |
| P2       | Mermaid Diagram  | Thêm script vào `_includes/head/custom.html`     |
| P3       | Analytics        | Google Analytics — khai báo trong `_config.yml`  |
| P3       | Newsletter       | Đánh giá sau khi có lượng người đọc             |

> **Không triển khai Comment System**