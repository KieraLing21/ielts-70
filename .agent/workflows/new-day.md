---
description: Tự động sinh nội dung bài học mới cho một ngày cụ thể dựa trên ROADMAP tương ứng theo Block.
---

# 🪄 Workflow: Generate New Day Content

Quy trình này giúp Agent tự động xây dựng nội dung bài học hoàn chỉnh cho một ngày cụ thể, đảm bảo tuân thủ mọi quy tắc về cấu trúc và không trùng lặp từ vựng.

## 📝 Cú pháp lệnh
Người dùng chỉ cần gõ: `/new-day week=[W] day=[D]`
*(Ví dụ: `/new-day week=2 day=1`)*

---

## 🤖 Các bước thực hiện (Dành cho Agent)

### Bước 1: Phân tích Roadmap tương ứng
1. **Xác định Block hiện tại**:
   - Nếu `W <= 12`: Sử dụng `docs/roadmaps/ROADMAP-B1-FOUNDATION.md`
   - Nếu `12 < W <= 24`: Sử dụng `docs/roadmaps/ROADMAP-B2-ACADEMY.md`
   - Nếu `W > 24`: Sử dụng `docs/roadmaps/ROADMAP-B3-PRECISION.md`
2. **Đọc file Roadmap tương ứng**.
3. **Xác định Topic & Skills** cho `Week [W] Day [D]` từ bảng lộ trình trong file đó.
4. **Scan Personal Discovery Lab (Reinforcement)**: 
   - Kiểm tra các "Gems" (kiến thức hay) mà người dùng đã tự bổ sung ở các ngày trước đó.
   - **QUY TẮC QUAN TRỌNG**: Luôn giữ Topic & Skill cốt lõi theo Roadmap làm trọng tâm. Phần Discovery chỉ được dùng để "lồng ghép" làm phong phú thêm ví dụ hoặc bài tập thực hành, KHÔNG được làm chệch hướng bài học chính của lộ trình.
5. **Review Vocabulary Bank**: Kiểm tra các từ đã học trong file Roadmap (hoặc lịch sử) để tránh trùng lặp.

### Bước 2: Soạn thảo nội dung (Curriculum Generation)
Tạo cấu trúc JSON cho `p1-w[W]-d[D]` cho `index.html` (hoặc block tương ứng) với tiêu chuẩn **Premium**:

1. **Vocabularies (25 từ)**:
   - **10 Core Words**: Liên quan đến Daily Topic (ví dụ: Family members, Love...).
     - **Nguồn từ:** Ưu tiên [Cambridge Dictionary](https://dictionary.cambridge.org/vi/dictionary/english/) cho ví dụ và IPA.
     - **Danh sách 25 từ:**
       - 10 Core Words (Oxford/Cambridge): Phải có IPA, **Định nghĩa (m)**, và 2 ví dụ (DAILY - 🌱 và ACADEMIC - 🎓).
       - 10 MIS Specialized (BABOK/Business): Phải có IPA, **Định nghĩa (m)**, và 2 ví dụ liên quan đến phân tích doanh nghiệp.
       - 5 words from Listening: Lấy từ video chính của ngày hôm đó.
     - **Pronunciation:** 10 từ luyện âm IPA (UK/US) từ Cambridge.
     - **Connected Speech:** 3-5 cụm từ nối âm thực tế.
     - **Ví dụ:** Cho mỗi từ vựng, viết `w: "System", p: "/ˈsɪs.təm/", m: "A set of connected things that work together", s: "a central heating system", a: "The system keeps crashing and no one is able to figure out why."`
     - **Link:** Gán link Cambridge vào code (tự động theo slug từ).

2. **Pronunciation**:
   - 10 Daily words + 10 Specialized words chứa cặp âm mục tiêu.
   - **IPA**: Lấy chuẩn từ Cambridge Dictionary (bao gồm cả UK và US).
   - **Connected Speech**: 3-5 cụm từ nối âm tự nhiên.

3. **Speaking (Dual-Context)**:
   - **Scenario 1 (Daily)**: Câu hỏi & Sample answer theo 4-Tier Framework.
   - **Scenario 2 (Professional)**: Câu hỏi MIS/Work & Sample answer theo 4-Tier Framework.

4. **Grammar Focus (MỚI)**:
   - Dựa vào Roadmap để xác định chủ điểm ngữ pháp của tuần.
   - **Theory**: Giải thích ngắn gọn bằng tiếng Việt.
   - **Formula**: Công thức chuẩn.
   - **Examples**: 2 ví dụ (🌱 Daily & 🎓 MIS/Academic).
   - **Exercise**: 1 bài tập thực hành nhỏ (viết câu).

5. **Listening**:
   - Chọn Topic phù hợp (VOA cho ngày lẻ, BBC cho ngày chẵn).
   - Tạo 4 bước learning steps.

### Bước 3: Cập nhật Code (Dashboard)
1. **Đọc file** `index.html`.
2. **Chèn JSON** mới vào object `curriculumData`.
3. Đảm bảo cấu trúc hiển thị đúng trình độ của Block hiện tại.

### Bước 4: Cập nhật Tiến độ (Roadmap)
1. Cập nhật trạng thái trong bảng `Week [W]` của file Roadmap tương ứng từ `⏳ Todo` thành `✅ Filled`.
2. Thêm 150 từ vừa tạo vào nhật ký từ vựng để tránh trùng lặp cho lần sau.

---

## ✅ Output mong đợi
- File `index.html` có bài học mới, hiển thị đẹp trên UI.
- File Roadmap tương ứng (`B1`, `B2`, hoặc `B3`) được cập nhật trạng thái.
- Người dùng có thể bắt đầu học ngay lập tức.
