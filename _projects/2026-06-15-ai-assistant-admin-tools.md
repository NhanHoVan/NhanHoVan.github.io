---
title: "AI Assistant & Admin Tools"
date: 2026-06-15
featured: true
project_type: "Cá nhân"
description: "Plugin WordPress toàn diện tích hợp Trợ lý ảo AI Chatbot tương tác, hệ thống viết bài tự động chuẩn SEO, tùy biến đăng nhập thương hiệu và bảo mật log hệ thống."
tech_stack: [WordPress, PHP, React, JavaScript, HTML5, CSS3, OpenAI API, MySQL, WP Cron]
header:
  overlay_image: /assets/images/projects/2026-06-15-ai-assistant-admin-tools.png
  overlay_filter: 0.3
demo_url: "https://nhanhovan.github.io/ai-assistant-admin-tools-docs/"
---

**AI Assistant and Admin Tools** là một plugin WordPress mạnh mẽ được thiết kế để nâng cao trải nghiệm quản trị website và tối ưu hóa tương tác với khách hàng trực tuyến. Dự án bắt nguồn từ nhu cầu thực tế nhằm tối giản hóa quy trình sáng tạo nội dung và tăng cường khả năng thu thập leads (thông tin khách hàng tiềm năng) tự động.

## Điểm nổi bật của sản phẩm

### Trợ Lý Ảo AI Chatbot (Virtual Assistant)
Tính năng hỗ trợ khách hàng thông minh hiển thị trực tiếp tại giao diện Frontend của website:
* **Thu thập Lead tự động (Lead Capture):** Yêu cầu khách hàng nhập thông tin gồm Tên, Email và Ngành nghề trước khi trò chuyện, giúp tích lũy dữ liệu khách hàng tiềm năng một cách tự nhiên.
* **Tùy biến giao diện linh hoạt:** Cho phép admin thay đổi Avatar, đặt tên cho trợ lý (ví dụ: *Mimi*, *Jarvis*), thay đổi màu sắc background/text của bong bóng chat để khớp với nhận diện thương hiệu của website.
* **Q&A Keyword Matching (Tiết kiệm chi phí):** Thiết lập các cặp hỏi đáp nhanh dựa trên từ khóa. Khi tin nhắn chứa từ khóa chỉ định, chatbot trả lời ngay lập tức mà không cần gọi API OpenAI.
* **Hỏi đáp thông minh theo danh mục sản phẩm (WooCommerce):** Người dùng có thể chọn chuyên mục bài viết hoặc danh mục sản phẩm WooCommerce quan tâm. Hệ thống tự động đính kèm thông tin mô tả danh mục cùng 5 sản phẩm/bài viết mới nhất làm ngữ cảnh để AI đưa ra câu trả lời cực kỳ chính xác kèm link sản phẩm trực tiếp.
* **Lịch sử trò chuyện:** Ghi lại toàn bộ lịch sử trò chuyện của từng khách hàng giúp admin theo dõi hành vi và chăm sóc kịp thời.

### Viết Bài Tự Động Bằng AI (AI Post Generator)
Công cụ đắc lực hỗ trợ biên tập viên tạo bài viết chuẩn SEO trực tiếp trong admin WordPress:
* **Hàng đợi tác vụ ngầm (Generator Queue):** Tránh tình trạng quá tải server hoặc gặp lỗi quá hạn thực thi (timeout) của PHP khi gọi API tạo bài viết dài. Tác vụ được đẩy vào hàng đợi cơ sở dữ liệu và xử lý ngầm thông qua tác vụ định kỳ của **WP Cron**.
* **Tích hợp Block Editor (Gutenberg):** Tích hợp sidebar React chuyên dụng ngay trong Gutenberg. Khi AI đang thực thi viết bài, giao diện soạn thảo sẽ được khóa an toàn để tránh thao tác sai lệch từ người dùng.
* **Hỗ trợ Classic Editor:** Hiển thị dưới dạng Meta Box ở phía dưới hoặc cột bên phải giao diện soạn thảo cũ.

## Công nghệ sử dụng

* **Ngôn ngữ cốt lõi:** PHP (phát triển các Class xử lý Logic, API Endpoint, và WP Cron tác vụ ngầm).
* **Giao diện trang quản trị:** React, JavaScript, CSS3, Gutenberg Block API (thiết kế Sidebar và Meta Box).
* **Giao diện Frontend Chatbot:** Thuần JavaScript, CSS3 (Glassmorphism design, tối ưu hiệu suất tải trang).
* **Cơ sở dữ liệu:** MySQL (sử dụng đối tượng `$wpdb` để khởi tạo các bảng lưu trữ tùy biến cho cấu hình, lịch sử chat và hàng đợi xử lý).
* **Tích hợp dịch vụ:** OpenAI API (GPT-4o / GPT-3.5) phục vụ chatbot và viết bài chuẩn SEO.

## Trách nhiệm trong dự án
* Thiết kế kiến trúc plugin theo mô hình hướng đối tượng (OOP) sạch sẽ, phân tách rõ ràng giữa phần xử lý Admin và Frontend.
* Phát triển các component React tùy biến để nhúng trực tiếp vào Gutenberg Editor Sidebar.
* Xây dựng hệ thống hàng đợi tác vụ ngầm an toàn sử dụng cơ chế lưu trữ tạm và xử lý cron-job của WordPress.
* Tối ưu hóa truy vấn SQL khi lưu trữ và hiển thị lượng lớn dữ liệu log bảo mật cũng như lịch sử hội thoại khách hàng.

## Thử thách & Giải pháp

### Lỗi timeout PHP khi tạo bài viết dài bằng AI
Quá trình gọi API của OpenAI để tạo một bài viết chuẩn SEO chi tiết (từ 1500 - 2000 từ) có thể mất từ 40 giây đến hơn 1 phút, vượt quá thời gian thực thi tối đa (Maximum Execution Time) mặc định của đa số hosting/server WordPress (thường là 30 giây).

* **Giải pháp:** Thiết kế cơ chế **Generator Queue**. Thay vì gọi trực tiếp API đồng bộ (synchronous) trên trình duyệt, yêu cầu tạo bài viết sẽ được lưu vào một bảng cơ sở dữ liệu hàng đợi. Một tác vụ ngầm (background job) liên kết với **WP Cron** sẽ định kỳ quét và xử lý bất đồng bộ (asynchronous). Người dùng có thể đóng trình duyệt hoặc làm việc khác mà không lo bài viết bị gián đoạn hay lỗi timeout.

### Chi phí API OpenAI tăng cao khi Chatbot hoạt động liên tục ngoài Frontend
Khách hàng ngoài Frontend có thể gửi rất nhiều câu hỏi trùng lặp hoặc mang tính chất hỏi nhanh (ví dụ: giá, thông tin liên hệ, địa chỉ). Nếu mỗi câu hỏi đều gọi trực tiếp đến API OpenAI, chi phí sẽ tăng rất nhanh.

* **Giải pháp:** Xây dựng tính năng **Q&A Keyword Matching** (Khớp từ khóa thông minh). Admin có thể cấu hình trước các bộ từ khóa và câu trả lời tương ứng. Hệ thống sẽ quét tin nhắn từ người dùng trước bằng JavaScript/PHP. Nếu tìm thấy từ khóa khớp, chatbot trả về câu trả lời đã định cấu hình ngay lập tức mà không cần gọi API OpenAI, giúp phản hồi siêu nhanh và giảm tới 40% chi phí vận hành API.

## Bài học kinh nghiệm
* Nắm vững cách tích hợp sâu vào hệ sinh thái Gutenberg Editor của WordPress bằng React và các package `@wordpress/*`.
* Tối ưu hóa trải nghiệm người dùng bằng cách xử lý tác vụ bất đồng bộ thông qua hàng đợi database giúp duy trì tính ổn định của server.
* Áp dụng mã hóa đối xứng để bảo vệ các thông tin nhạy cảm của người dùng (API key) khi lưu trữ trong MySQL.

## Đường dẫn dự án
* **Tài liệu hướng dẫn chi tiết (Documentation):** [Tài liệu AI Assistant and Admin Tools]({{ page.demo_url }}){:target="_blank" rel="noopener noreferrer"}
