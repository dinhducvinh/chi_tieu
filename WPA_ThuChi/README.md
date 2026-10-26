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

## Lọc chi tiêu theo khoảng thời gian

1. Trong tab **Chi tiêu**, chạm **Lọc khoảng thời gian**.
2. Chọn **Từ ngày** và **Đến ngày**, rồi chạm **Xem tổng chi**.
3. Ứng dụng hiển thị tổng tiền đã chi và các giao dịch trong khoảng đã chọn, tính cả hai ngày đầu và cuối.
4. Mở lại bộ lọc và chạm **Bỏ lọc** để trở về chế độ xem theo tháng.

## Sao lưu và khôi phục dữ liệu

Mở tab **Cài đặt** ở thanh dưới cùng:

- **Xuất dữ liệu** tạo một tệp JSON để lưu vào Files, AirDrop hoặc chia sẻ theo cách bạn muốn.
- **Nhập dữ liệu** đọc lại tệp JSON và thay thế dữ liệu hiện có sau khi bạn xác nhận.
- **Xóa sạch dữ liệu** yêu cầu chạm hai lần trong 5 giây để tránh thao tác nhầm.

Mọi thao tác đều diễn ra ngay trên thiết bị, không cần tài khoản hay máy chủ. Nên xuất một bản sao trước khi xóa dữ liệu hoặc đổi điện thoại.

## Cấu trúc

- `Chi tiêu tháng.html`: giao diện và logic thu chi.
- `manifest.webmanifest`: thông tin cài đặt PWA.
- `sw.js`: bộ nhớ đệm để chạy offline.
- `icons/`: biểu tượng ứng dụng.
- `tools/generate-icons.ps1`: tạo lại các biểu tượng PNG.

Khi sửa danh sách tài nguyên trong PWA, hãy đổi tên cache trong `sw.js` để thiết bị nhận bản mới.
