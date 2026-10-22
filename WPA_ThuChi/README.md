# Sổ chi tiêu PWA

Ứng dụng thu chi cá nhân chạy hoàn toàn trong trình duyệt, lưu dữ liệu trên thiết bị và có thể dùng offline sau lần tải đầu tiên. Không có backend hay tài khoản người dùng.

## Chạy thử trên máy tính

Service worker không hoạt động khi mở trực tiếp bằng đường dẫn `file://`. Hãy chạy thư mục qua HTTP cục bộ:

```powershell
python -m http.server 8080
```

Sau đó mở `http://localhost:8080`.

## Cài trên iPhone

1. Đưa toàn bộ thư mục lên một dịch vụ lưu trữ tĩnh có HTTPS.
2. Mở địa chỉ bằng Safari trên iPhone.
3. Chạm **Chia sẻ** → **Thêm vào Màn hình chính**.
4. Mở ứng dụng từ biểu tượng vừa tạo ít nhất một lần để hoàn tất bộ nhớ đệm offline.

## Cài lịch nhắc

1. Trong ứng dụng, chạm thẻ **Nhắc ghi chi tiêu**.
2. Chạm **Cài lịch nhắc trên iPhone**.
3. Cho phép mở Calendar và chọn **Đăng ký**. Bảo đảm cảnh báo của lịch được bật.

Lịch tạo bốn lời nhắc lặp lại mỗi ngày lúc 09:00, 13:00, 17:00 và 21:00 theo múi giờ Việt Nam. Cần kết nối mạng khi đăng ký lần đầu; sau đó iPhone Calendar tự phát cảnh báo mà không cần mở PWA hay kết nối tới backend.

Muốn ngừng nhắc: mở **Calendar** → **Calendars** → nút thông tin cạnh **Nhắc ghi chi tiêu** → **Hủy đăng ký**.

## Cấu trúc

- `Chi tiêu tháng.html`: giao diện và logic thu chi.
- `manifest.webmanifest`: thông tin cài đặt PWA.
- `sw.js`: bộ nhớ đệm để chạy offline.
- `nhac-ghi-chi-tieu.ics`: lịch nhắc lặp lại dành cho iPhone.
- `icons/`: biểu tượng ứng dụng.
- `tools/generate-icons.ps1`: tạo lại các biểu tượng PNG.

Khi sửa danh sách tài nguyên trong PWA, hãy đổi tên cache trong `sw.js` để thiết bị nhận bản mới.
