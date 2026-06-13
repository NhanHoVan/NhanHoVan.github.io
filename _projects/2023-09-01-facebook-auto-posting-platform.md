---
title: "Social Sheet Poster"
date: 2023-09-01
featured: true
project_type: "Cá nhân & Freelance"
description: "Công cụ tự động hóa việc lên lịch và xuất bản bài viết lên Facebook Page trực tiếp từ Google Sheets, hỗ trợ làm việc nhóm."
tech_stack: [Go, React, TypeScript, Vite, Ant Design, PostgreSQL, Google Sheets API, Facebook Graph API, Vercel, GCP Cloud Run, GitHub Actions, Docker]
header:
  overlay_image: /assets/images/default-banner.jpg
  overlay_filter: 0.3
demo_url: "https://social-sheet-poster-f.vercel.app/"
---

## Giới thiệu dự án

**Social Sheet Poster** ra đời nhằm giải quyết bài toán quản lý Fanpage tối ưu cho các biên tập viên và đội ngũ xây dựng nội dung. Thay vì phải sao chép thủ công từng bài đăng từ tài liệu lên giao diện quản trị của Facebook, công cụ này cho phép bạn làm việc trực tiếp ngay trên **Google Sheets** quen thuộc. 

Bạn chỉ cần chuẩn bị bài đăng, soạn thảo nội dung, gắn thẻ hình ảnh và lên lịch đăng ngay trên trang tính. Hệ thống sẽ tự động đồng bộ định kỳ và xuất bản nội dung lên các Fanpage tương ứng đúng giờ hẹn.

## Điểm nổi bật của sản phẩm

- **Quản lý tập trung từ Google Sheets:** Toàn bộ nội dung bài đăng, trạng thái lên lịch, và lịch sử xuất bản đều hiển thị rõ ràng trên một trang tính duy nhất.
- **Hỗ trợ cộng tác nhóm:** Cho phép nhiều cộng tác viên biên tập cùng tham gia viết bài, kiểm duyệt nội dung và theo dõi tiến trình đăng tải tại một nơi duy nhất trước khi bài viết được duyệt lên Page.
- **Xác thực bảo mật qua Facebook Login:** Đăng nhập và liên kết Fanpage một cách nhanh chóng qua luồng OAuth chính thức của Facebook. Hệ thống chỉ quản lý và đăng bài lên các Fanpage mà bạn cấp quyền, cam kết không can thiệp vào trang cá nhân.
- **Lưu trữ an toàn:** Các token truy cập được mã hóa và bảo vệ nghiêm ngặt trong cơ sở dữ liệu PostgreSQL.

## Công nghệ sử dụng

- **Giao diện người dùng (Frontend):** React.js, TypeScript, Vite, Ant Design (giao diện kéo thả trực quan và quản lý trạng thái mượt mà bằng Context API).
- **Hệ thống xử lý (Backend):** Go (Golang) được thiết kế theo mô hình Clean Architecture (Handler, UseCase, Repository) giúp xử lý nhanh và tiết kiệm tài nguyên.
- **Cơ sở dữ liệu:** PostgreSQL (lưu trữ thông tin phòng, người dùng, và mã hóa token xác thực).
- **Tích hợp bên thứ ba:** Google Sheets API (quét dữ liệu bảng tính) và Facebook Graph API (kết nối xuất bản bài viết).
- **Vận hành & Deployment:** Tự động hóa qua GitHub Actions, triển khai Frontend trên Vercel và chạy Container Backend trên GCP Cloud Run qua Docker.

## Đường dẫn dự án
- **Trải nghiệm trực tuyến (Live Demo):** [social-sheet-poster-f.vercel.app]({{ page.demo_url }})
