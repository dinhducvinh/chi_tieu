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
2. Sửa, thêm hoặc xóa các mốc giờ. Có thể tạo tối đa 6 mốc mỗi ngày.
3. Chạm **Tạo lịch với giờ đã chọn**.
4. Khi Safari mở tệp lịch, chọn **Thêm tất cả** và bảo đảm cảnh báo được bật.

Các mốc mặc định là 09:00, 13:00, 17:00 và 21:00. Lựa chọn mới được lưu trong `localStorage`; ứng dụng tự tạo tệp `.ics` tương ứng ngay trên thiết bị. Nếu Safari không mở trực tiếp tệp lịch, dùng nút **Chia sẻ hoặc lưu tệp .ics**, gửi tệp vào Mail rồi mở tệp đính kèm.

Khi thay đổi một lịch đã thêm vào Calendar, hãy xóa các chuỗi sự kiện nhắc cũ trước khi nhập lịch mới để tránh nhận thông báo trùng. Muốn ngừng nhắc, xóa các chuỗi sự kiện **Nhắc ghi chi tiêu** trong Calendar.

## Cấu trúc

- `Chi tiêu tháng.html`: giao diện và logic thu chi.
- `manifest.webmanifest`: thông tin cài đặt PWA.
- `sw.js`: bộ nhớ đệm để chạy offline.
- `nhac-ghi-chi-tieu.ics`: lịch mặc định dự phòng; lịch tùy chỉnh được tạo bằng JavaScript.
- `icons/`: biểu tượng ứng dụng.
- `tools/generate-icons.ps1`: tạo lại các biểu tượng PNG.

Khi sửa danh sách tài nguyên trong PWA, hãy đổi tên cache trong `sw.js` để thiết bị nhận bản mới.
