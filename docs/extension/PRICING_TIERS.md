# PRICING TIERS — Chi tiết các gói và chính sách

| | |
|---|---|
| **Tài liệu** | Bảng giá + tính năng theo tier + chính sách subscription + brokerage referral |
| **Phiên bản** | 1.0 — draft chờ PO |
| **Ngày lập** | 28/07/2026 |
| **Tham chiếu** | `BUSINESS_MODEL.md`, `URS_AMENDMENTS.md`, `BROKER_INTEGRATION.md` |
| **Benchmark** | wichart Pro 499k/năm, Vietstock Pro 990k/năm, FireAnt 499k/năm |

> **Nguyên tắc pricing**: Free tier phải đủ tốt để user ở lại + mở TK qua app. Premium tier phải khác biệt rõ với wichart để chứng minh giá cao hơn. Brokerage referral là revenue chính, không phụ thuộc subscription.

---

## 1. Ma trận gói (Pricing Matrix)

| Tính năng | Free | Pro | Premium | Premium AI |
|---|---|---|---|---|
| **Giá/tháng** | 0đ | 58k | 108k | 299k |
| **Giá/năm** | 0đ | **690.000đ** | **1.290.000đ** | **3.590.000đ** |
| **Mục tiêu user** | Top of funnel | F1 casual | F1+ active | F2/serious |
| **Lưu ý** | Có forever-free | Tier chủ lực | Có 3 lớp + AI insight | Có AI Copilot không giới hạn |

### 1.1 Quy mô sử dụng theo tier

| Hạng mục | Free | Pro | Premium | Premium AI |
|---|---|---|---|---|
| Watchlist (số danh sách) | 1 | 5 | 20 | Không giới hạn |
| Mã tối đa/danh sách | 5 | 30 | 100 | Không giới hạn |
| Cảnh báo kỹ thuật active | 3 | 20 | 100 | Không giới hạn |
| AI Q&A câu/ngày | 3 | 20 | 50 | 100 (fair use) |
| Portfolio tracking mã | 5 | 30 | 100 | Không giới hạn |
| Broker API sync | — | 1 sàn | 3 sàn | 5 sàn |
| Market Brief | Weekly (chung) | Daily (cá nhân hoá) | Daily (đầy đủ) | Daily + custom |
| Crowd intelligence | — | — | Có | Có + heatmap |
| Backtest cá nhân | — | — | 3/tháng | Không giới hạn |

---

## 2. Chi tiết tính năng theo tier

### 2.1 Free (0đ) — Thu hút user mở TK

**Mục tiêu**: cho user trải nghiệm, có watchlist cơ bản, kích hoạt mở TK qua app để nhận Premium miễn phí.

| Tính năng | Miêu tả |
|---|---|
| Watchlist | 1 danh sách, tối đa 5 mã |
| Cảnh báo | 3 cảnh báo ngưỡng giá, KHÔNG có cảnh báo kỹ thuật tự động |
| AI Q&A | 3 câu/ngày (giới hạn để quen thuộc hero feature) |
| Portfolio | 5 mã (nhập tay) |
| Market Brief | Weekly bản tin chung (không cá nhân hoá) |
| Báo cáo cơ bản | Chỉ hiển thị điểm 0–100 tổng, không có chi tiết 5 trụ |
| Phân tích kỹ thuật | Wyckoff basic (1 trường phái), không có CANSLIM |
| Phân tích vĩ mô | Mục tin tức vĩ mô chung, không có "giải thích mâu thuẫn" |

**Up-sell trigger:**
- Khi user đạt 5 mã watchlist → "Nâng cấp Pro để theo dõi 30 mã"
- Khi user hỏi AI câu thứ 4 → "Nâng cấp Pro để hỏi tiếp"
- Khi user muốn cảnh báo kỹ thuật → "Chỉ có ở Pro trở lên"

### 2.2 Pro (690k/năm) — Tier chủ lực cho F1 casual

**Mục tiêu**: user sẵn sàng trả phí tương đương wichart, nhận nhiều giá trị hơn (portfolio tracking, AI Q&A, brief cá nhân hoá).

| Tính năng | Miêu tả |
|---|---|
| Watchlist | 5 danh sách, 30 mã/danh sách |
| Cảnh báo | Tất cả cảnh báo kỹ thuật + ngưỡng giá, 20 active alerts |
| AI Q&A | 20 câu/ngày |
| Portfolio | 30 mã, import CSV, 1 broker API sync |
| Market Brief | Daily, cá nhân hoá theo watchlist |
| Báo cáo cơ bản | Đầy đủ 5 trụ chi tiết |
| Phân tích kỹ thuật | Đủ 4 trường phái + Đồng thuận |
| Phân tích vĩ mô | Hiển thị yếu tố thuận lợi/bất lợi cho từng mã |

**Không có ở Pro (chỉ Premium+):**
- "Giải thích mâu thuẫn cơ bản–kỹ thuật" (Lớp 3 full)
- Crowd intelligence (xem user khác đang hold gì)
- Backtest cá nhân

### 2.3 Premium (1.290k/năm) — Tier cho F1+ active

**Mục tiêu**: đủ cả 3 lớp phân tích, AI insight có trích dẫn đầy đủ, crowd intelligence. Đây là tier chứng minh giá khác biệt với wichart.

| Tính năng thêm so với Pro | Miêu tả |
|---|---|
| "Giải thích mâu thuẫn" | Khi cơ bản tốt + giá giảm (hoặc ngược lại), app hiển thị mục phân tích vĩ mô + ngành lý giải |
| Crowd intelligence | Xem "X% Premium holders hold VCB", "Y% đã bán 7 ngày", "Z% mới thêm watchlist" |
| AI Q&A | 50 câu/ngày (đủ để hỏi sâu) |
| Portfolio | 100 mã, 3 broker API sync, phân tích beta/correlation |
| Backtest | 3 backtest cá nhân/tháng (FR-EXT-BT-*) |
| Market Brief | Daily đầy đủ, có preview tuần tới |

### 2.4 Premium AI (3.590k/năm) — Tier cho F2 serious

**Mục tiêu**: user nghiêm túc, dùng AI Copilot thường xuyên. Đây là tier cao nhất, có biên lợi nhuận lớn nhất.

| Tính năng thêm | Miêu tả |
|---|---|
| AI Q&A | 100 câu/ngày (fair use), context memory dài |
| Backtest | Không giới hạn |
| Watchlist | Không giới hạn |
| Broker API sync | 5 sàn |
| Crowd heatmap | Sector rotation + contrarian signal |
| AI Agent | Tự động đề xuất cảnh báo cá nhân hoá (vs trigger-based) |
| Voice input | Voice-to-text cho Q&A |
| Priority support | Học viên trả lời trong 24h |

---

## 3. Chính sách mở tài khoản + tặng Premium

### 3.1 Cơ chế (xem BROKER_INTEGRATION.md)

| Hành động của user | Tặng gì | Lý do |
|---|---|---|
| Mở TK VPS/SSI/DNSE qua app referral | **3 tháng Premium miễn phí** | Kích hoạt brokerage revenue (recurring, lớn hơn subscription) |
| Giao dịch ≥100tr/tháng qua ID học viên (liên tục 3 tháng) | **Gia hạn Premium thêm 3 tháng** | Kích hoạt giao dịch đều |
| Giữ TK active (có giao dịch) ≥6 tháng | **Premium miễn phí vĩnh viễn** nếu giao dịch ≥X/tháng | Lock-in brokerage revenue suốt đời |

### 3.2 Ngưỡng "Premium miễn phí vĩnh viễn"

Cần tính toán để không lỗ:
- Chi phí AI/Premium user: ~50k/tháng
- Nếu user giao dịch ≥300tr/tháng qua ID → hoa hồng ~60k–180k/tháng → **đã cover chi phí + có lãi**

**Đề xuất**: User có ≥300tr giao dịch/tháng TB trong 6 tháng liên tiếp → Premium miễn phí vĩnh viễn (conditional, review hàng quý).

### 3.3 FR mới — FR-EXT-PRICING-*

| ID | Yêu cầu | Ưu tiên | Mốc |
|---|---|---|---|
| FR-EXT-PRICING-01 | Hệ thống tự động unlock Premium 3 tháng khi user verify mở TK | M | M0 |
| FR-EXT-PRICING-02 | Hệ thống check giao dịch user hàng tháng → trigger tặng thêm nếu đủ ĐK | M | M2 |
| FR-EXT-PRICING-03 | Hệ thống tự động revert về Free nếu user không đủ ĐK vĩnh viễn (review quý) | M | M2 |
| FR-EXT-PRICING-04 | Hệ thống hiển thị progress: "Bạn đang giao dịch X/300tr tháng này để giữ Premium" | S | M2 |

---

## 4. Chiến lược pricing cho thị trường VN

### 4.1 Psychological pricing

| Giá | Tâm lý | Khuyến nghị |
|---|---|---|
| 490k/năm | Dưới wichart, dễ quyết định | Early bird M0.5–M1 |
| 690k/năm | Ngang немного cao hơn wichart, dưới Vietstock | Pro tier chính thức |
| 990k/năm | Ngang Vietstock Pro | Có thể dùng promo |
| 1.290k/năm | Hơi cao nhưng có Lớp 3 + AI khác biệt | Premium |
| 1.990k/năm | Cao, nhưng có research đi kèm | Tier "Research" (nếu có) |
| 3.590k/năm | Ngang phần mềm quỹ nhỏ | Premium AI |

### 4.2 Khuyến nghị (monthly vs yearly)

- **Yearly only** ở giai đoạn đầu: dòng tiền upfront, đơn giản ops
- **Monthly** từ M3: giảm rào cản thử nghiệm
- **Yearly discount**: ~15–20% so với monthly (1 tháng miễn phí)

### 4.3 Lifetime deal (cẩn trọng!)

**Chỉ chạy 1 lần, giới hạn 50 người**, cho 700 người Zalo đầu:
- Giá: **4.900.000đ** lifetime (tương đương 3.8 năm Premium)
- Lý do:gom vốn nhanh, tạo FOMO, reward early adopter
- **Risk**: chi phí AI dài hạn (50k/user/tháng × 12 × nhiều năm) có thể vượt revenue
- **Bắt buộc**: giới hạn 50 user + closing date + disclaimer "Lifetime = trong khi sản phẩm còn hoạt động"

---

## 5. B2B Tier (M3+)

### 5.1 Affiliate cho KOL

| Gói | Giá | Nội dung |
|---|---|---|
| KOL Affiliate Basic | 0đ (chia commission) | KOL giới thiệu user, nhận 30% subscription + 20% hoa hồng |
| KOL Affiliate Pro | 5tr/tháng | + Custom branding nhẹ + co-branded landing page |
| White-label | 10–15tr/tháng | App brand hoàn toàn của KOL + KOL tự cắm ID mình |

### 5.2 Data API cho CTCK

| Gói | Giá | Nội dung |
|---|---|---|
| Data API Standard | 15tr/tháng | API giá + BCTC chuẩn hoá, rate limit 10k request/h |
| Data API Pro | 30tr/tháng | + AI insight API (điểm cơ bản, alert), 50k request/h |
| Enterprise | 50tr+/tháng | SLA + custom integration + dedicated support |

---

## 6. Discount và promo

### 6.1 Discount cố định

| Loại | Mức | Điều kiện |
|---|---|---|
| Early bird (M0.5–M1) | -30% (490k Pro, 990k Premium) | 50 người đầu |
| Group buy (5+ user) | -15% | Mua chung qua 1 Zalo group |
| Referral | Tặng 1 tháng cho referrer + referee | User giới thiệu user |
| Student | -50% | Có thẻ sinh viên |

### 6.2 Promo theo mùa

- **Q1 (sau Tết)**: "Năm mới đầu tư mới" — Premium -20%
- **Q4 (cuối năm)**: "Year-end review" — tặng 2 tháng khi mua năm
- **Black Friday**: Lifetime deal giai đoạn đầu, sau đó đóng

---

## 7. Unit economics theo tier

### 7.1 Chi phí phục vụ 1 user

| Tier | AI cost/tháng | Data cost | Khác | Tổng/tháng |
|---|---|---|---|---|
| Free | ~5k | ~2k | — | 7k |
| Pro | ~15k | ~2k | — | 17k |
| Premium | ~35k | ~3k | Crowd infra | 40k |
| Premium AI | ~60k | ~5k | Crowd + voice | 70k |

### 7.2 Margin (subscription only)

| Tier | Giá/tháng | Chi phí/tháng | Margin/tháng | Margin/năm |
|---|---|---|---|---|
| Free | 0 | 7k | -7k | -84k |
| Pro | 58k | 17k | +41k | +492k |
| Premium | 108k | 40k | +68k | +816k |
| Premium AI | 299k | 70k | +229k | +2.748k |

### 7.3 Khi thêm brokerage revenue

Giả sử 50% user Pro+ mở TK qua app, TB giao dịch 100tr/tháng → hoa hồng 30k/tháng/user.

| Tier | Subscription margin/năm | + Brokerage/năm (50% user) | Total/user/năm |
|---|---|---|---|
| Pro | 492k | +180k | **672k** |
| Premium | 816k | +180k | **996k** |
| Premium AI | 2.748k | +180k | **2.928k** |

Brokerage tăng ARPU thêm 15–25% — đáng kể nhưng không áp đảo (vì margin subscription đã cao).

---

## 8. A/B test pricing (M2+)

Khi có đủ user (≥500), test:
- (A) Pro 690k vs (B) Pro 490k → xem impact conversion
- (A) Lifetime 4.9tr vs (B) Lifetime 3.9tr → xem impact volume
- (A) Hiển thị monthly trước vs (B) yearly trước → xem anchor effect

---

## 9. Tổng hợp FR pricing

| ID | Yêu cầu | Mốc |
|---|---|---|
| FR-EXT-PRICING-01..04 | Unlock Premium theo brokerage activity | M0–M2 |
| FR-EXT-PRICING-05 | Hệ thống hỗ trợ coupon code (early bird, group, student) | M2 |
| FR-EXT-PRICING-06 | Hệ thống hỗ trợ monthly + yearly billing | M3 |
| FR-EXT-PRICING-07 | Hệ thống tự động email remind trước khi expiry | M2 |
| FR-EXT-PRICING-08 | Hệ thống hỗ trợ refund 7 ngày (vn quy định) | M2 |
| FR-EXT-PRICING-09 | Hệ thống hiển thị pricing page công khai trên website | M2 |

---

## 10. Tóm tắt một câu

> **4 tier: Free (0đ, kích mở TK) → Pro (690k, ngang wichart nhưng thêm portfolio + brief + AI) → Premium (1.290k, đủ 3 lớp + crowd intelligence, khác biệt rõ) → Premium AI (3.590k, cho user nghiêm túc). Cơ chế tặng Premium 3 tháng cho user mở TK + "Premium vĩnh viễn nếu giao dịch ≥300tr/tháng" để tối ưu brokerage revenue. B2B: Affiliate 30%/20% commission, White-label 10–15tr/tháng, Data API 15–50tr/tháng cho CTCK.**
