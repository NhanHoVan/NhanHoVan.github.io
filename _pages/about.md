---
title: "Giới thiệu"
layout: single
permalink: /about/
author_profile: true
classes: hide-title
---

Chào bạn, tôi là **Nhân** — một kỹ sư lập trình đam mê công nghệ và luôn tìm kiếm sự tối ưu trong từng dòng code. Với hơn 5 năm đồng hành cùng các dự án phần mềm đa dạng trong và ngoài nước, tôi tập trung chuyên sâu vào phát triển hệ thống backend hiệu năng cao sử dụng hệ sinh thái Java.

Ngôn ngữ lập trình chính của tôi là **Java**. Bên cạnh đó, tôi đã tự học và ứng dụng thành công **Go (Golang)** vào nhiều dự án thực tế.

---

## Kinh nghiệm làm việc

### BAP IT Co., Ltd. — Software Engineer
**Thời gian:** 08/2023 – Hiện tại · Đà Nẵng, Việt Nam

* **Dự án RemoteClaw (04/2026 – 06/2026):**
  - *Mô tả:* Hệ thống backend điều khiển và vận hành trò chơi gắp thú thời gian thực trực tiếp từ xa. Người chơi tương tác trực tiếp với máy gắp thú vật lý thông qua app.
  - *Công việc thực hiện:*
    - Phát triển hệ thống xử lý logic backend thời gian thực cho phòng chơi, quản lý ghép cặp (matchmaking), cấu hình điểm số và đồng bộ trạng thái trận đấu.
    - Cấu hình và viết các kịch bản kiểm thử tích hợp tự động (integration test) sử dụng Testcontainers để giả lập kết nối và chạy thử nghiệm trực tiếp trên database.
  - *Tech Stack:* `Java (Spring Boot)` `Gradle` `JMS` `WebSocket` `Redis` `MySQL` `MyBatis-Plus` `Testcontainers` `Docker`

* **Hệ thống Quản lý Hợp đồng (08/2023 – 03/2026):**
  - *Mô tả:* Dự án trích xuất dữ liệu hợp đồng. Dự án được phát triển toàn chu kỳ (full-cycle) từ khâu thiết kế đến vận hành thực tế phối hợp trực tiếp với đối tác nước ngoài.
  - *Công việc thực hiện:*
    - Soạn thảo tài liệu thiết kế chức năng chi tiết cho hệ thống sử dụng Notion.
    - Thiết kế và phát triển backend bằng Java (Armeria), xây dựng các tiến trình chạy ngầm (batch job, cron job) và ETL pipeline phục vụ xử lý và biến đổi dữ liệu hợp đồng.
    - Hiện thực cơ chế giao tiếp gRPC hiệu năng cao giữa client và server giúp tăng tốc độ truyền tải dữ liệu.
    - Xây dựng bảng quản trị và các công cụ nội bộ hỗ trợ vận hành bằng Retool (low-code).
    - Triển khai mô hình kiến trúc hướng sự kiện (event-driven) thông qua GCP Cloud Pub/Sub để tối ưu hóa khả năng mở rộng.
    - Viết kiểm thử đơn vị với JUnit và kiểm thử tích hợp với WireMock; kiểm thử thủ công trên môi trường sandbox.
    - Quản lý hạ tầng đám mây dưới dạng mã (IaC) thông qua Terraform và cấu hình deploy ứng dụng lên hệ thống Kubernetes trên các môi trường dev, qa01, qa02, qa03, qa04.
  - *Tech Stack:* `Java (Armeria)` `React` `Retool` `Protobuf` `MySQL` `PostgreSQL` `GCP Cloud Pub/Sub` `Terraform` `Kubernetes` `JUnit` `WireMock`

---

### Rikai Technology — Java Developer
**Thời gian:** 06/2022 – 07/2023 · Đà Nẵng, Việt Nam

* **Dự án AISearch SaaS (01/2023 – 07/2023):**
  - *Mô tả:* Ứng dụng quản trị tìm kiếm và quản lý câu trả lời cho hệ thống Chatbot doanh nghiệp.
  - *Công việc thực hiện:* Xây dựng giao diện ứng dụng Single Page Application (Vue2 Composition API).
  - *Tech Stack:* `Python (Django)` `Vue2` `TypeScript` `MySQL`

* **Hệ thống Quản lý Du học sinh - KBee (09/2022 – 12/2022):**
  - *Mô tả:* Hệ thống quản lý thông tin, tìm kiếm học bổng và thủ tục cho du học sinh.
  - *Công việc thực hiện:* Thiết kế và xây dựng các API backend hiệu năng cao, áp dụng chặt chẽ các nguyên lý thiết kế SOLID và hướng đối tượng để phục vụ cho giao diện Vue2 (Options API).
  - *Tech Stack:* `Java (Spring Framework)` `Spring JPA` `Vue2` `PostgreSQL` `Git`

* **Hệ thống Quản lý Điểm Cửa hàng (06/2022 – 09/2022):**
  - *Mô tả:* Hệ thống quản lý cửa hàng tích điểm đổi quà.
  - *Công việc thực hiện:* Phát triển các tính năng nghiệp vụ mới, viết kiểm thử JUnit3 bảo vệ chất lượng code và bàn giao mã nguồn dự án.
  - *Tech Stack:* `Java` `JDBC` `JSP` `Thymeleaf` `MySQL` `GitLab`

---

### Vinabook Co., Ltd. — Web Developer / Team Lead
**Thời gian:** 05/2020 – 05/2022 · Đà Nẵng, Việt Nam

* **Hệ thống Học nghe Tiếng Việt qua AI (AI Vietnamese Listening Practice):**
  - *Mô tả:* Hệ thống giáo dục trực tuyến hỗ trợ người nước ngoài học nghe tiếng Việt qua các câu chuyện văn hóa tích hợp trí tuệ nhân tạo.
  - *Công việc thực hiện:*
    - Dẫn dắt đội ngũ phát triển Frontend, trực tiếp thiết kế các bản vẽ giao diện người dùng (UI/UX) trên công cụ Figma.
    - Khởi tạo môi trường phát triển, thiết lập cấu trúc khung dự án client đa nền tảng bằng Vue2 và React Native.
    - Thiết kế và xây dựng hệ thống API backend bằng Java (Spring framework) để đồng bộ và phục vụ dữ liệu cho ứng dụng di động.
    - Quản lý mã nguồn, giải quyết xung đột mã nguồn và kiểm soát chất lượng tích hợp các nhánh tính năng trên GitHub.
  - *Tech Stack:* `Java (Spring)` `React Native` `Vue2` `TypeScript` `MySQL` `Figma`

* **Thiết kế Website E-commerce & Hoạt động Đội ngũ:**
  - *Mô tả:* Dự án xây dựng các website thương mại điện tử kết hợp các hoạt động đào tạo phát triển đội ngũ và nghiên cứu công nghệ mới.
  - *Công việc thực hiện:*
    - Thiết kế và lập trình giao diện website thương mại điện tử sử dụng WordPress, Flatsome, WooCommerce; tối ưu hóa trải nghiệm người dùng thông qua các plugin và chuyển động mượt mà.
    - Dẫn dắt hoạt động chuyên môn tuần của nhóm, trực tiếp hướng dẫn và đào tạo thành viên mới về chiến lược tối ưu hóa công cụ tìm kiếm (SEO) và viết bài công nghệ.
    - Chủ trì nghiên cứu thử nghiệm và ứng dụng các giải pháp Trí tuệ nhân tạo (AI) như chuyển đổi văn bản - giọng nói (Text-to-Speech, Speech-to-Text) và sinh ảnh (Midjourney) để cải thiện quy trình làm việc nhóm.
  - *Tech Stack:* `WordPress` `Flatsome` `WooCommerce` `SEO` `Generative AI` `HTML/CSS/JS`

---

## Chứng chỉ kỹ thuật

- **Google AI Professional Certificate** (Google / Credly - 2026) · [Xác thực chứng chỉ](https://www.credly.com/badges/dfb4d6ce-419c-4b99-ae74-41b2636c465a/public_url)

---

## Giải thưởng công việc

- **Achieve Code Master Award of the Year 2025** — BAP IT Co., Ltd. (12/2025)  
  *Ghi nhận đóng góp xuất sắc về năng lực chuyên môn và chất lượng mã nguồn trong các dự án phát triển hệ thống năm 2025.*

---

## Học vấn

* **Trường Đại học Khoa học — Đại học Huế** (09/2013 – 06/2017)
  - Chuyên ngành: Quản lý Môi trường
  - Xếp loại tốt nghiệp: Giỏi
