# BROKER INTEGRATION — Tích hợp sàn chứng khoán & hệ thống referral

| | |
|---|---|
| **Tài liệu** | Đặc tả kỹ thuật + business cho tích hợp broker API và referral hoa hồng |
| **Phiên bản** | 1.0 — draft |
| **Ngày lập** | 28/07/2026 |
| **Tham chiếu** | `BUSINESS_MODEL.md`, `URS_AMENDMENTS.md` (FR-EXT-PORT-03) |
| **Lưu ý pháp lý** | Cần luật sư CK rà soát trước khi triển khai (FR-EXT-COMP-01) |

---

## 0. Tóm tắt

Học viên là **môi giới cắm ID ở nhiều sàn CK tại VN**. Mục tiêu của tài liệu này:
1. Xác định danh sách sàn CK ưu tiên cắm ID + chính sách hoa hồng
2. Đặc tả luồng referral: user mở TK qua app → gắn ID học viên → hệ thống theo dõi
3. Đặc tả tích hợp broker API (nếu sàn hỗ trợ) để auto-sync danh mục user
4. Quy định transparency + compliance để tránh conflict of interest

---

## 1. Danh sách sàn CK tại VN — ưu tiên tích hợp

### 1.1 Phân loại sàn theo khả năng tích hợp

| Sàn | API public? | Cho phép cắm ID môi giới? | Chính sách chia sẻ hoa hồng | Ưu tiên |
|---|---|---|---|---|
| **VPS (VPS Securities)** | Có (đã có trong URS FR-DATA-01) | Có | Cần xác minh (A6) | **P1** |
| **SSI** | Có (SSI iBoard API) | Có | Cần xác minh | **P1** |
| **DNSE** | Có (xu hướng open API) | Có | Cần xác minh | **P2** |
| **MBS** | Hạn chế | Có | Cần xác minh | **P2** |
| **VNDIRECT (VND)** | Có | Có | Cần xác minh | **P2** |
| **HSC** | Hạn chế | Có | Cần xác minh | **P3** |
| **SHS** | Hạn chế | Có | Cần xác minh | **P3** |
| **VCBS (VCSC)** | Hạn chế | Có | Cần xác minh | **P3** |
| **TCBS (Techcombank)** | API kín, chỉ cho khách | Có | Cần xác minh | **P4** |

### 1.2 Lựa chọn ưu tiên giai đoạn 1

**Đề xuất M0–M1:** Tích hợp 3 sàn P1+P2:
1. **VPS** — đã có trong URS, có realtime price API (FR-DATA-01)
2. **SSI** — user base lớn nhất VN, API tương đối mở
3. **DNSE** — open API, fee thấp, segment trẻ

**Đề xuất M2 trở đi:** Mở rộng VNDIRECT, MBS, HSC.

### 1.3 FR mới — FR-EXT-BRK-* (M0)

| ID | Yêu cầu | Ưu tiên | Mốc |
|---|---|---|---|
| FR-EXT-BRK-01 | Hệ thống quản lý nhiều broker_id (1 học viên có thể cắm ID ở nhiều sàn) | M | M0 |
| FR-EXT-BRK-02 | Hệ thống cho phép user mở TK qua referral link của sàn (deeplink đến onboarding sàn) | M | M0 |
| FR-EXT-BRK-03 | Hệ thống ghi nhận user mở TK qua referral nào → gắn broker_id cho user | M | M0 |
| FR-EXT-BRK-04 | Hệ thống tra cứu trạng thái TK user qua broker API (nếu sàn hỗ trợ) | S | M1 |
| FR-EXT-BRK-05 | Hệ thống tra cứu lịch sử giao dịch user qua broker API → tính hoa hồng | S | M1 |
| FR-EXT-BRK-06 | Hệ thống hiển thị dashboard cho user: "Hoa hồng đã chia cho học viên từ TK của bạn" | S | M2 |
| FR-EXT-BRK-07 | Hệ thống hỗ trợ user đổi broker_id (nếu muốn chuyển sàn) | C | M3 |

---

## 2. Referral Flow — User mở TK qua app

### 2.1 Sơ đồ luồng

```
User trong app (Free tier)
    ↓
Xem nút "Mở tài khoản CK — nhận 3 tháng Premium miễn phí"
    ↓
Chọn sàn: VPS / SSI / DNSE
    ↓
App mở deeplink đến trang onboarding của sàn, có gắn referral code học viên
    ↓
User mở TK tại sàn (flow của sàn, không phải app)
    ↓
User quay lại app, nhập số TK hoặc scan giấy phép TK
    ↓
App verify số TK với broker API (nếu sàn hỗ trợ) HOẶC học viên verify thủ công
    ↓
App gắn broker_id của học viên cho user này
    ↓
User được unlock 3 tháng Premium miễn phí
    ↓
Broker sàn ghi nhận giao dịch user → chia hoa hồng cho học viên theo chu kỳ sàn
```

### 2.2 FR mới — FR-EXT-REF-* (M0)

| ID | Yêu cầu | Ưu tiên | Mốc |
|---|---|---|---|
| FR-EXT-REF-01 | Hệ thống hiển thị nút "Mở TK + nhận 3 tháng Premium" ở onboarding và dashboard Free | M | M0 |
| FR-EXT-REF-02 | Hệ thống cho user chọn sàn (VPS/SSI/DNSE ở M0, thêm sàn khác ở M2) | M | M0 |
| FR-EXT-REF-03 | Hệ thống mở deeplink đến trang onboarding sàn, có referral code | M | M0 |
| FR-EXT-REF-04 | Hệ thống có form "Nhập số TK đã mở" để user confirm | M | M0 |
| FR-EXT-REF-05 | Hệ thống (admin) verify số TK và approve unlock Premium | M | M0 |
| FR-EXT-REF-06 | Hệ thống tự động unlock Premium 3 tháng khi admin approve | M | M0 |
| FR-EXT-REF-07 | Hệ thống hiển thị "TK của bạn đã gắn broker_id học viên X" ở cài đặt user | M | M0 |

### 2.3 Edge cases

| Trường hợp | Xử lý |
|---|---|
| User đã có TK ở sàn trước (không qua referral) | Hỗ trợ "chuyển ID môi giới" — user liên hệ sàn yêu cầu gắn broker_id học viên |
| User mở TK qua referral khác nhưng nhập vào app | Học viên verify thủ công với sàn; nếu không thuộc ID học viên thì từ chối unlock |
| User mở TK ở sàn học viên chưa cắm ID | Hiển thị "Sàn này chưa hỗ trợ, vui lòng chọn VPS/SSI/DNSE" |
| User muốn rút broker_id (chuyển sang môi giới khác) | Cho phép, nhưng mất Premium miễn phí nếu đang ở giai đoạn tặng |

---

## 3. Broker API Integration — Auto-sync danh mục

### 3.1 Gap

FR-EXT-PORT-03 (URS_AMENDMENTS) yêu cầu "user connect broker API để auto-sync danh mục". Đây là tính năng **quan trọng nhưng khó**, vì:
- Không phải sàn nào cũng cấp API cho user end
- Token authentication phức tạp
- Format dữ liệu khác nhau giữa các sàn

### 3.2 Chiến lược từng sàn

| Sàn | API sync khả thi? | Phương án dự phòng |
|---|---|---|
| VPS | Có — API document có (cần verify quyền truy cập user) | User nhập tay + import CSV |
| SSI | Có — SSI iBoard API | User nhập tay |
| DNSE | Có — open API | User nhập tay |
| MBS, HSC, SHS, VND | Hạn chế | User nhập tay + import CSV |
| TCBS | Không | User nhập tay |

### 3.3 FR mới — FR-EXT-BRKAPI-* (M1 → M2)

| ID | Yêu cầu | Ưu tiên | Mốc |
|---|---|---|---|
| FR-EXT-BRKAPI-01 | User connect broker API: nhập username/password hoặc token của sàn | M | M1 |
| FR-EXT-BRKAPI-02 | Hệ thống sync danh mục: gọi API sàn mỗi ngày hoặc khi user mở app | M | M1 |
| FR-EXT-BRKAPI-03 | Hệ thống sync lệnh đã khớp: đọc lịch sử giao dịch để tính lãi/lỗ realised | M | M2 |
| FR-EXT-BRKAPI-04 | Hệ thống không lưu password của user — chỉ lưu token OAuth hoặc session | M | M1 |
| FR-EXT-BRKAPI-05 | Hệ thống hiển thị "Đã sync lúc HH:MM DD/MM" để user biết dữ liệu mới đến đâu | M | M1 |
| FR-EXT-BRKAPI-06 | Hệ thống cho user disconnect broker bất kỳ lúc nào, xoá token | M | M1 |
| FR-EXT-BRKAPI-07 | Hệ thống có fallback: nếu API lỗi, hiển thị "Dữ liệu cũ lúc HH:MM", KHÔNG hiển thị cũ như mới (NFR-10) | M | M1 |

### 3.4 Kiến trúc BrokerAdapter (mở rộng DataSourceAdapter)

```
                    ┌─── DataSourceAdapter (URS gốc FR-DATA-03) ───┐
                    │   - Giá/KL realtime từ VPS API                │
                    │   - BCTC, vĩ mô từ wichart crawler            │
                    └────────────────────┬─────────────────────────┘
                                         │
                    ┌────────────────────▼─────────────────────────┐
                    │       BrokerAdapter (MỚI - FR-EXT-BRKAPI)    │
                    │   - Sync danh mục user từ VPS/SSI/DNSE       │
                    │   - Lịch sử lệnh đã khớp                     │
                    │   - Token management (không lưu password)    │
                    │   - Rate limit theo policy mỗi sàn           │
                    └────────────────────┬─────────────────────────┘
                                         │
                    ┌────────────────────▼─────────────────────────┐
                    │          Portfolio Engine                     │
                    │   - Tính lãi/lỗ realised + unrealised        │
                    │   - Phân tích danh mục (beta, correlation)   │
                    │   - Cảnh báo theo mã hold                    │
                    └──────────────────────────────────────────────┘
```

---

## 4. Hoa hồng — Cách tính và chia sẻ

### 4.1 Cơ chế hoa hồng môi giới tại VN (sơ lược)

Khi user A mở TK qua môi giới B (cắm ID sàn C):
- Sàn C thu phí giao dịch từ user A (thường 0.15–0.25% giá trị giao dịch)
- Sàn C chia 10–30% phí đó cho môi giới B (tỷ lệ tuỳ sàn và thoả thuận)
- Thường tính theo tháng, sàn C báo cáo + chuyển khoản cho B

**Ví dụ:** User A mua 100tr cổ phiếu VCB
- Sàn VPS thu phí: 100tr × 0.15% = 150.000đ
- Môi giới (học viên) nhận: 150.000đ × 20% = **30.000đ**
- Nếu user A giao dịch 10 lệnh/tháng × TB 100tr = 1 tỷ → học viên nhận 300.000đ/tháng

### 4.2 FR mới — FR-EXT-COM-* (M2)

| ID | Yêu cầu | Ưu tiên | Mốc |
|---|---|---|---|
| FR-EXT-COM-01 | Hệ thống admin (học viên) import báo cáo hoa hồng từ sàn hàng tháng (CSV/manual) | M | M2 |
| FR-EXT-COM-02 | Hệ thống tính hoa hồng theo từng user (nếu sàn cung cấp breakdown) | S | M2 |
| FR-EXT-COM-03 | Hệ thống hiển thị "User A đóng góp X đồng hoa hồng tháng này" cho admin | S | M2 |
| FR-EXT-COM-04 | Hệ thống KHÔNG hiển thị hoa hồng cụ thể cho user (chỉ hiển thị "TK của bạn đang gắn broker_id học viên") | M | M2 |
| FR-EXT-COM-05 | Hệ thống có report tổng: revenue theo tháng, theo sàn, theo user | S | M2 |

### 4.3 Kịch bản affiliate (M3+)

Khi mở rộng affiliate cho KOL khác:
- KOL D giới thiệu user E vào app của học viên
- User E mở TK → broker_id có thể là của học viên HOẶC của KOL D (nếu KOL D có giấy phép)
- Học viên chia X% hoa hồng với KOL D theo thỏa thuận
- Hệ thống cần tracking attribution: "User E đến từ KOL D"

| ID | Yêu cầu | Ưu tiên | Mốc |
|---|---|---|---|
| FR-EXT-COM-06 | Hệ thống tracking attribution: user đến từ affiliate nào | M | M3 |
| FR-EXT-COM-07 | Hệ thống tính hoa hồng chia cho KOL affiliate | M | M3 |
| FR-EXT-COM-08 | Hệ thống có dashboard cho KOL: "User của tôi, hoa hồng tháng này" | S | M3 |

---

## 5. Compliance & Conflict of Interest

### 5.1 Bắt buộc theo FR-EXT-COMP (URS_AMENDMENTS)

| Yêu cầu | Cách thực hiện |
|---|---|
| Transparency (FR-EXT-COMP-02) | Onboarding + cài đặt hiển thị "App nhận hoa hồng khi bạn giao dịch qua ID trong app" |
| No one-click order (FR-EXT-COMP-03) | Cấm nút "Mua/Bán ngay" từ màn cảnh báo; phải có confirm dialog + 5s countdown |
| Overtrading warning (FR-EXT-COMP-04) | Nếu user >10 lệnh/tuần, app cảnh báo |
| Audit log (FR-EXT-COMP-05) | Lưu 90 ngày mọi alert + AI output |
| User data isolation (FR-EXT-COMP-06) | Crowd data anonymised, không trace về user |

### 5.2 FR mới — FR-EXT-BRK-COMP-*

| ID | Yêu cầu | Ưu tiên | Mốc |
|---|---|---|---|
| FR-EXT-BRK-COMP-01 | App KHÔNG đặt lệnh thay user — chỉ đọc danh mục + lịch sử | M | M0 |
| FR-EXT-BRK-COMP-02 | App KHÔNG kích hoạt user giao dịch — alert chỉ là thông tin | M | M0 |
| FR-EXT-BRK-COMP-03 | App có disclaimer cố định: "Công cụ thông tin + môi giới. Hoa hồng được chia khi bạn giao dịch." | M | M0 |
| FR-EXT-BRK-COMP-04 | Audit log mọi API call tới broker (lưu 90 ngày) | M | M1 |
| FR-EXT-BRK-COMP-05 | User có quyền xoá toàn bộ broker connection + data liên quan (GDPR-style) | M | M2 |

---

## 6. Kỹ thuật — Stack và thư viện gợi ý

### 6.1 Backend

| Layer | Gợi ý |
|---|---|
| BrokerAdapter | Python hoặc Node.js module riêng cho mỗi sàn (tương tự DataSourceAdapter) |
| Token storage | Mã hoá AES-256, key trong KMS, không bao giờ log |
| Rate limiter | Redis-based, mỗi broker_id có quota riêng |
| Sync scheduler | Cron job mỗi 30 phút trong phiên giao dịch, 1 lần/ngày ngoài phiên |
| Audit log | Append-only table, không xoá, retention 90 ngày |

### 6.2 Mobile (Flutter)

| Feature | Gợi ý |
|---|---|
| Deeplink mở sàn | `url_launcher` package |
| Broker connect UI | WebView (nếu sàn có OAuth) hoặc form username/password |
| Portfolio display | `fl_chart` cho biểu đồ lãi/lỗ |
| Sync indicator | SnackBar "Đã sync lúc HH:MM" |

### 6.3 Security checklist

- [ ] Không lưu password broker — chỉ token
- [ ] Token mã hoá at-rest + in-transit
- [ ] Không bao giờ log credential
- [ ] API call broker qua backend, KHÔNG từ mobile trực tiếp (tránh lộ secret key)
- [ ] Rate limit để tránh bị sàn block
- [ ] Audit log mọi thao tác nhạy cảm

---

## 7. Verify trước khi code (Blocker)

| ID | Cần verify | Hạn | Cách |
|---|---|---|---|
| BRK-V1 | VPS có API cho user end sync danh mục? Quyền sử dụng? | Tuần 1 | Email VPS dev support |
| BRK-V2 | SSI iBoard API có cho third-party app? | Tuần 1 | Đọc docs + email SSI |
| BRK-V3 | DNSE open API — scope và rate limit? | Tuần 1 | Đọc docs DNSE |
| BRK-V4 | Chính sách chia sẻ hoa hồng cụ thể mỗi sàn? | Tuần 2 | Hỏi trực tiếp phòng môi giới |
| BRK-V5 | Sàn có chấp nhận referral code từ app bên ngoài? | Tuần 2 | Hỏi sàn + luật sư |
| BRK-V6 | Pháp lý: app + brokerage có vi phạm Luật CK 2019? | Tháng 1 | Luật sư CK |

> **BRK-V6 là binary blocker.** Nếu luật sư nói không được, toàn bộ BUSINESS_MODEL.md sụp đổ. Phải verify trước.

---

## 8. Tổng hợp FR mới trong tài liệu này

| Nhóm | SL FR | Mốc |
|---|---|---|
| FR-EXT-BRK (broker config) | 7 | M0–M3 |
| FR-EXT-REF (referral flow) | 7 | M0 |
| FR-EXT-BRKAPI (API sync) | 7 | M1–M2 |
| FR-EXT-COM (hoa hồng) | 8 | M2–M3 |
| FR-EXT-BRK-COMP (compliance) | 5 | M0–M2 |
| **Tổng cộng** | **34 FR mới** | |

---

## 9. Tóm tắt một câu

> **Hệ thống broker integration có 5 lớp: (1) BrokerAdapter đa sàn mở rộng DataSourceAdapter, (2) Referral flow với deeplink + verify số TK, (3) Broker API sync danh mục qua token (không lưu password), (4) Hoa hồng tracking qua admin import + attribution cho affiliate, (5) Compliance layer chống conflict of interest (no one-click order, overtrading warning, audit log). BRK-V6 (pháp lý) là binary blocker phải verify trước khi code.**
