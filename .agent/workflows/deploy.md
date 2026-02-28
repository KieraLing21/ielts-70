---
description: Deploy IELTS 7.0 lên GitHub Pages
---

# Workflow: Deploy lên GitHub Pages

Dùng workflow này mỗi khi bạn muốn cập nhật nội dung lên trang web công khai.

## Bước 1: Chạy script deploy

// turbo
Run the deploy script to push latest changes to GitHub Pages:
```powershell
cd c:\Users\admin\Courses\ielts-7.0
.\deploy.ps1
```

## Bước 2: Chờ GitHub build (~1-2 phút)

GitHub Pages sẽ tự động cập nhật sau khi nhận được code mới.

## Bước 3: Kiểm tra trang web

Mở link để xác nhận thay đổi đã hiển thị:
```
https://kieraling21.github.io/ielts-70/
```

---

> **Lưu ý**: Nếu có thay đổi trong `docs/` hoặc `resources/`, bạn cần thêm chúng vào script deploy.ps1 nếu muốn chia sẻ.
