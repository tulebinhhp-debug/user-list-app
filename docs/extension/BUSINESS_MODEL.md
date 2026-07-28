# BUSINESS MODEL — Mô hình kinh doanh kết hợp Môi giới + SaaS

| | |
|---|---|
| **Tài liệu** | Mô hình kinh doanh mở rộng cho ứng dụng phân tích cổ phiếu VN |
| **Phiên bản** | 1.0 — draft chờ PO duyệt |
| **Ngày lập** | 28/07/2026 |
| **Tham chiếu** | `docs/urs_origin/URS-app-phan-tich-co-phieu-v1.0.md` |
| **Trạng thái** | Giả định BA, chờ PO xác nhận |

---

## 0. Tóm tắt quyết định

Học viên đóng **cả hai vai trò**: (1) KOL tư vấn CK cho 700 người trong Zalo, và (2) Môi giới cắm ID ở các sàn CK tại VN, ăn hoa hồng % giao dịch suốt đời của khách hàng.

**Mô hình tối ưu = Freemium App + Brokerage Revenue Share**, không phải SaaS subscription thuần. Lý do: hoa hồng môi giới suốt đời (recurring) có giá trị cao gấp 5–10 lần phí subscription, và đây là **lợi thế độc quyền** mà wichart, Vietstock, FireAnt không có được (họ không có giấy phép môi giới).

> **Một user active trader qua app có thể mang lại 2.4–7.2 triệu đồng/năm hoa hồng, so với 990k/năm nếu bán subscription.**

---

## 1. Hai nguồn doanh thu song song

```
┌────────────────────────────────────────────────────────────┐
│                    NGUỒN DOANH THU                         │
├─────────────────────────┬──────────────────────────────────┤
│  A. SUBSCRIPTION (SaaS) │  B. HOA HỒNG MÔI GIỚI (Brokerage) │
│  Thu phí cố định/năm    │  % giá trị giao dịch suốt đời    │
│  Có trước, ổn định      │  Có sau, recurring, lớn hơn      │
│  wichart/vietstock có   │  wichart/vietstock KHÔNG có      │
└─────────────────────────┴──────────────────────────────────┘
```

### Nguồn A — Subscription (SaaS recurring)
- Pro: 690k/năm, Premium: 1.290k/năm, Premium AI: 3.590k/năm
- Thu trước, dòng tiền ổn định, dự đoán được
- Đụng trực tiếp wichart (499k), Vietstock (990k), FireAnt (499k)
- Giới hạn ARPU: thị trường VN trần khoảng 1–2tr/năm cho B2C

### Nguồn B — Hoa hồng môi giới (recurring + scalable)
- Học viên cắm ID ở các sàn (VPS, SSI, MBS, HSC, VND, SHS, DNSE...)
- User mở tài khoản qua referral link trong app
- Mỗi user giao dịch → học viên ăn % (thường 10–30% phí giao dịch mà sàn thu user)
- **ARPU cao hơn nhiều**: user F1+ giao dịch 100–500tr/tháng → hoa hồng 100k–1.5tr/tháng
- **Recurring suốt đời user còn giao dịch** qua ID của học viên
- wichart, Vietstock, FireAnt **không được phép** làm điều này (không có giấy phép CK)

---

## 2. Đơn vị kinh tế (Unit Economics)

### 2.1 So sánh ARPU hai mô hình

| Loại user | Giao dịch/tháng | Hoa hồng/tháng | Hoa hồng/năm | Subscription/năm |
|---|---|---|---|---|
| Swing trader nhẹ | 50tr | ~50k–150k | 600k–1.8tr | 990k–1.290k |
| Active trader | 200tr | ~200k–600k | 2.4tr–7.2tr | 990k–1.290k |
| Heavy trader | 500tr+ | ~500k–1.5tr | 6tr–18tr | 990k–1.290k |
| Nhận định dài hạn | <10tr | <30k | <360k | 990k |

**Kết luận**: với active trader (phân khúc chính của group Zalo tư vấn), hoa hồng môi giới **lớn hơn 3–10 lần** subscription.

### 2.2 Kịch hình doanh thu 12 tháng đầu

Giả thiết: học viên có 700 người Zalo, conversion rate 7% mở tài khoản qua app = ~50 user mở ID.

| Tháng | User mở ID | TB giao dịch/user | Hoa hồng/tháng | Subscription/tháng | Tổng/tháng |
|---|---|---|---|---|---|
| M1–3 | 15 | 50tr | 1.5tr | 0đ (free beta) | 1.5tr |
| M4–6 | 30 | 80tr | 4.8tr | 3tr (early bird) | 7.8tr |
| M7–9 | 45 | 120tr | 10.8tr | 6tr | 16.8tr |
| M10–12 | 60 | 150tr | 18tr | 10tr | 28tr |

**Cumulative 12 tháng: ~165tr** — gấp 3 lần kịch bản subscription thuần (~50tr).

### 2.3 Kịch hình năm 2–3 khi scale

| Nguồn | User | ARPU/năm | Revenue/năm |
|---|---|---|---|
| Subscription (Premium) | 200 | 1.290k | 258tr |
| **Hoa hồng môi giới** | 150 active | 5.000k | **750tr** |
| Affiliate (KOL khác) | 5 KOL × 20 user | chia 30% | 350tr |
| **Tổng** | | | **~1.36 tỷ/năm** |

Hoa hồng môi giới chiếm **~55% revenue**, subscription ~19%, affiliate ~26%.

---

## 3. Cấu trúc sản phẩm để tối ưu revenue kép

### 3.1 Funnel thiết kế

```
        ┌──────────────────────────────────────┐
        │  700 người Zalo (Top of Funnel)      │
        └──────────────┬───────────────────────┘
                       ▼
        ┌──────────────────────────────────────┐
        │  Free tier trong app:                │
        │  - Watchlist (5 mã)                  │
        │  - Cảnh báo ngưỡng giá (3 mã)        │
        │  - 1 brief sáng/tuần                 │
        │  - Hero feature: "Mở TK CK miễn phí  │
        │    + nhận 1 tháng Premium"           │
        └──────────────┬───────────────────────┘
                       ▼  (conversion ~7–15%)
        ┌──────────────────────────────────────┐
        │  User mở tài khoản qua app/referral  │
        │  → Gắn ID học viên                   │
        │  → Tặng 3 tháng Premium miễn phí     │
        │  → Hoa hồng bắt đầu tính             │
        └──────────────┬───────────────────────┘
                       ▼  (activation ~50% sau 3 tháng)
        ┌──────────────────────────────────────┐
        │  Premium subscriber (trả phí)        │
        │  + Active trader (giao dịch qua ID)  │
        │  → ARPU kép                          │
        └──────────────────────────────────────┘
```

### 3.2 Bốn giá trị cốt lõi kích hoạt cả hai dòng tiền

| Tính năng | Kích hoạt subscription | Kích hoạt giao dịch (→ hoa hồng) |
|---|---|---|
| AI Q&A với cổ phiếu | Hiện insight → user trả phí Premium | Hiện tín hiệu mua → user đặt lệnh |
| Cảnh báo breakout realtime | Tier Pro trả phí | Đặt lệnh ngay khi nhận push |
| Market Brief sáng cá nhân hoá | Premium feature | Gợi ý cơ hội → user vào lệnh |
| Portfolio tracking + lãi lỗ | Lock-in dữ liệu | Hiện mã yếu → user cắt lỗ/rebalance |
| Backtest chiến lược | Premium feature | Cho user tự tin giao dịch nhiều hơn |

**Mọi tính năng đều phải có dual purpose**: vừa giữ chân subscriber, vừa kích hoạt giao dịch để tối ưu hoa hồng.

---

## 4. Lợi thế cạnh tranh độc quyền

### 4.1 wichart, Vietstock, FireAnt KHÔNG thể copy

| Yếu tố | wichart/Vietstock | Học viên |
|---|---|---|
| Giấy phép môi giới CK | Không có | **Có** (cắm ID được) |
| Hoa hồng % giao dịch user | Không được phép | **Được phép** |
| KOL trust với cộng đồng | Generic | **700 người Zalo warm** |
| Tư vấn cá nhân hoá | Dashboard chung | **AI Q&A + group Zalo** |

**Đây là moat thực sự.** wichart có thể copy Lớp 3 (vĩ mô) trong 3 tháng, nhưng **không thể có giấy phép môi giới + 700 người warm**.

### 4.2 Vòng lặp tăng trưởng (flywheel)

```
App miễn phí cực tốt
        ↓
User mở tài khoản qua app (để được free Premium)
        ↓
Hoa hồng suốt đời → dòng tiền ổn định
        ↓
Tái đầu tư vào content/research/AI feature
        ↓
App tốt hơn → user mới đến nhiều hơn
        ↓
(vòng lặp)
```

Flywheel này giống mô hình **Cake by VPBank** (app đầu tư miễn phí + revenue từ broker partner) và **Robinhood** (miễn phí giao dịch + revenue từ payment for order flow).

---

## 5. Mô hình B2B mở rộng (Năm 2+)

Sau khi mô hình B2C chạy, học viên có thể mở rộng B2B bằng chính lợi thế môi giới:

### 5.1 Affiliate cho KOL tư vấn khác

- Học viên tiếp cận 3–5 KOL khác có group Zalo riêng (500–2000 members mỗi người)
- Offer: "Bán app của tôi cho group của bạn, bạn được **(a)** 30% commission subscription + **(b)** hoa hồng môi giới chia đôi nếu user mở ID qua KOL đó"
- Moat: học viên cung cấp **cả tool + hạ tầng môi giới** cho KOL, KOL không cần tự xây

### 5.2 White-label cho nhóm tư vấn

- KOL muốn brand riêng: học viên cung cấp app white-label, tính 5–15tr/tháng
- KOL đó có thể tự chèn ID môi giới của họ (nếu có giấy phép) hoặc dùng ID học viên chia sẻ hoa hồng
- Revenue: 5–15tr/tháng × 5 KOL = 25–75tr/tháng

### 5.3 Data API cho CTCK nhỏ

- CTCK nhỏ (SHS, VCI, BVS...) chưa có app phân tích chuyên sâu
- Học viên bán data API (đã chuẩn hoá + AI insight) cho họ
- Giá: 15–30tr/tháng/khách
- Đây là tier cao nhất, cần pháp nhân + SLA

---

## 6. Rủi ro và cách giảm thiểu

### 6.1 Rủi ro mô hình

| # | Rủi ro | Mức | Giảm thiểu |
|---|---|---|---|
| BM-R1 | User mở TK qua app nhưng giao dịch qua ID khác | Cao | Tích hợp broker API để đọc xác nhận; ưu đãi "Premium miễn phí nếu giao dịch ≥X/tháng qua ID học viên" |
| BM-R2 | Sàn CK thay đổi chính sách chia sẻ hoa hồng | Trung bình | Đa dạng hoá: cắm ID nhiều sàn (VPS, SSI, MBS, DNSE...) |
| BM-R3 | Pháp lý: app + môi giới có bị coi là tư vấn CK không | **Cao** | Luật sư rà soát trước khi launch; disclaimer rõ; "công cụ thông tin" không "khuyến nghị mua/bán" |
| BM-R4 | Conflict of interest: kích thích user giao dịch nhiều để ăn hoa hồng, nhưng trái với lợi ích user | **Cao** | **Bắt buộc**: tuân thủ FR-COMP-01 (ngôn ngữ trung tính); không có feature "đặt lệnh 1 click" từ alert; cảnh báo overtrading |
| BM-R5 | Wichart/Vietstock hợp tác với CTCK để có lợi thế tương tự | Trung bình | Tốc độ + KOL trust + 700 người warm là head start 12–18 tháng |
| BM-R6 | User rời app sau khi mở TK (vì TK đã có app riêng của sàn) | Trung bình | Portfolio tracking + AI insight = lock-in; push alert realtime giữ chân |

### 6.2 Conflict of interest — điểm cần cẩn thận nhất

Đây là rủi ro lớn nhất về cả pháp lý lẫn uy tín dài hạn:

**CẦN LÀM:**
- Ngôn ngữ trung tính (FR-COMP-01), không "nên mua/nên bán"
- Cảnh báo overtrading: nếu user giao dịch >X lần/tuần, app cảnh báo "Có thể bạn đang overtrade"
- Transparency: hiện rõ "Học viên nhận hoa hồng khi bạn giao dịch qua ID trong app"
- Long-term thinking: feature phải hướng tới "giúp user ra quyết định tốt", không phải "kích thích user giao dịch nhiều"

**KHÔNG ĐƯỢC LÀM:**
- Đặt nút "Mua ngay" / "Bán ngay" từ màn hình cảnh báo (friction quá thấp → overtrade)
- Gamification giao dịch (streak, badge theo số lệnh)
- Push alert quá dày để kích thích FOMO
- Ẩn thông tin bất lợi về mã mà user đang hold

---

## 7. Kế hoạch triển khai 3 giai đoạn

### Giai đoạn 1 (Tháng 1–6) — B2C + Brokerage Bootstrap

**Mục tiêu:** 50 user mở ID qua app, 15tr/tháng revenue cuối giai đoạn.

| Tuần | Hành động |
|---|---|
| 1–2 | Verify điều khoản cắm ID + chia sẻ hoa hồng với 3 sàn (VPS, SSI, DNSE) |
| 3–4 | Referral link system + onboarding flow "Mở TK + nhận 3 tháng Premium" |
| 5–12 | Build M0+M1 (data + kỹ thuật + watchlist + cảnh báo + portfolio tracking) |
| 13–20 | Beta cho 50 người Zalo đầu, thu feedback, tối ưu |
| 21–24 | Push early bird: 490k/năm + mở TK → 50 user đầu |

### Giai đoạn 2 (Tháng 7–18) — AI Copilot + Scale Kênh

**Mục tiêu:** 150 user active trader qua app, 40tr/tháng revenue.

| Hoạt động | Kết quả |
|---|---|
| Ra mắt AI Q&A (M0.5 → M2) | Premium tier 1.290k/năm |
| Market Brief cá nhân hoá | Daily engagement tăng |
| Crowd intelligence (network effect) | Stickiness tăng |
| Mở rộng ra 3–5 KOL affiliate | +50–100 user mới |

### Giai đoạn 3 (Tháng 19–36) — B2B + Platform

**Mục tiêu:** Revenue 80–150tr/tháng, có lãi rõ ràng.

| Hoạt động | Kết quả |
|---|---|
| White-label cho 3–5 KOL | 25–75tr/tháng B2B |
| Data API cho 2 CTCK nhỏ | 30–60tr/tháng |
| Premium AI tier 3.590k/năm | ARPU tăng |
| Cân nhắc raise vốn hoặc acqui-hire | Valuation ~25 tỷ VND |

---

## 8. Quyết định cần chốt với PO

| ID | Quyết định | Hạn chót |
|---|---|---|
| BM-D1 | Chốt danh sách sàn CK cắm ID (ưu tiên VPS, SSI, DNSE) | Tuần 1 |
| BM-D2 | Xác nhận chính sách chia sẻ hoa hồng với mỗi sàn | Tuần 2 |
| BM-D3 | Có tặng 3 tháng Premium miễn phí cho user mở TK qua app không? | Tuần 3 |
| BM-D4 | Ngân sách discount: "Giao dịch ≥X/tháng qua ID → miễn phí Premium"? | Tuần 4 |
| BM-D5 | Luật sư chứng khoán rà soát mô hình = bắt buộc trước khi nhận tiền | Tháng 2 |
| BM-D6 | Có mở affiliate B2B ngay từ năm 1 hay đợi năm 2? | Tháng 6 |

---

## 9. Tóm tắt một câu

> **Mô hình tối ưu = "App miễn phí cực tốt + User mở TK qua app + Học viên ăn hoa hồng suốt đời" (giống Cake/Robinhood), cộng thêm tier Premium subscription cho user cao cấp. Hoa hồng môi giới là nguồn revenue chính (55–70%), subscription là phụ (20–30%), affiliate B2B là tầng mở rộng. wichart, Vietstock, FireAnt không thể copy vì họ không có giấy phép môi giới và kênh warm 700 người.**
