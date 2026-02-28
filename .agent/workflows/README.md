# 🤖 IELTS 7.0 Automation Workflows

Thư mục này chứa các quy trình tự động hóa (Workflows) giúp quản lý và vận hành khóa học IELTS 7.0 hiệu quả.

Bạn có thể kích hoạt các workflow này bằng cách gõ lệnh (Slash Command) trực tiếp vào khung chat với Agent.

---

## 🚀 Danh sách lệnh có sẵn

### 1. `/new-day` (Content Generator)
> **Dành cho:** Content Creator / Developer
> **Tác dụng:** Tự động sinh nội dung bài học mới cho một ngày cụ thể.

Tự động thực hiện 4 bước:
1. Đọc Topic & Âm IPA từ `MASTER-PLAN.md`.
2. check Vocabulary Bank để tránh trùng từ.
3. Sinh nội dung (Vocab, Pronun, Listen, Speak) chuẩn Premium.
4. Code vào `dashboard.html` và update trạng thái Plan.

**Cú pháp:**
```bash
/new-day week=[W] day=[D]
```

**Ví dụ:**
- `/new-day week=2 day=1` (Tạo nội dung cho Tuần 2, Ngày 1)
- `/new-day week=2 day=2` (Tạo nội dung cho Tuần 2, Ngày 2)

---

### 2. `/daily-study` (Learner Guide)
> **Dành cho:** Người học (User)
> **Tác dụng:** Hướng dẫn từng bước cách học trong ngày.

Cung cấp quy trình học chuẩn 90-120 phút:
1. **Pronunciation**: Drills & Connected Speech.
2. **Listening**: Deep Listening & Extract words.
3. **Speaking**: 4-Tier Framework & Recording.
4. **Vocabulary**: 25 từ/ngày & Sentence Mastery.

**Cú pháp:**
```bash
/daily-study
```
*(Chỉ cần gõ lệnh, Agent sẽ mở quy trình học)*

---

## 📂 Cấu trúc file liên quan

Các workflow này hoạt động dựa trên sự liên kết chặt chẽ giữa các file sau:

1. **`Codebase/MASTER-PLAN.md`**: Bộ não chứa dữ liệu quy hoạch (Plan) và dữ liệu đã học (Bank).
2. **`Codebase/dashboard.html`**: Giao diện hiển thị bài học cho người dùng.
3. **`.agent/workflows/*.md`**: Kịch bản thực thi của từng lệnh.

---

## 🤝 Phối hợp giữa Agent & Người học

Để đạt hiệu quả cao nhất (Mục tiêu Premium 25 từ/ngày), hãy phối hợp 2 workflow theo quy trình: **"AI chuẩn bị - Người học thực thi"**.

| Giai đoạn | Hành động | Ai thực hiện | Mục đích |
| :--- | :--- | :--- | :--- |
| **1. Tiếp tế** | `/new-day week=W day=D` | **AI (Agent)** | Tự động soạn bài, tìm link audio, đặt ví dụ vào Dashboard. |
| **2. Chiến đấu** | `/daily-study` | **Bạn (Người trẻ)** | Mở hướng dẫn học ngay bên cạnh Dashboard để luyện tập đúng phương pháp. |

---

## 💡 Mẹo sử dụng

- **Quy tắc "Tối tạo - Sáng học"**: Hãy ra lệnh `/new-day` vào buổi tối để sáng hôm sau bài học đã sẵn sàng.
- **Kỷ luật checklist**: Luôn mở `daily-study` trong lúc học và tích vào các ô hoàn thành để duy trì động lực.
- **Kiểm tra**: Sau khi chạy `/new-day`, hãy mở `dashboard.html` để kiểm tra hiển thị trước khi bắt đầu học.
- **Backup**: Commit code (`git commit`) sau khi Agent sinh xong nội dung cho mỗi ngày.
