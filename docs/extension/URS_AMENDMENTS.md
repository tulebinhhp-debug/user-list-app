# URS AMENDMENTS — Bổ sung URS gốc

| | |
|---|---|
| **Tài liệu** | Các bổ sung, cải tiến, điều chỉnh so với URS v1.0 gốc |
| **Phiên bản** | 1.0 — draft chờ PO duyệt |
| **Ngày lập** | 28/07/2026 |
| **Tham chiếu** | `docs/urs_origin/URS-app-phan-tich-co-phieu-v1.0.md` |
| **Lý do bổ sung** | (1) Pivot mô hình sang brokerage + SaaS, (2) Thêm tính năng lock-in và moat, (3) Đưa AI Copilot lên hero feature |

> **Cách đọc:** Mỗi mục nêu (a) Gap/Issue trong URS gốc, (b) Bổ sung FR mới, (c) FR cũ bị sửa đổi nếu có. Các FR mới có tiền tố `FR-EXT-*` để phân biệt với FR gốc.

---

## 1. Bổ sung nhóm "Quản lý danh mục" (mở lại phần bị loại trừ)

### 1.1 Gap

URS gốc **mục 3.2** loại trừ "Quản lý danh mục có giá vốn và tính lãi/lỗ". Đây là **sai lầm lớn nhất** của URS gốc, vì:
- Portfolio tracking là **lock-in mechanism mạnh nhất** (user không rời app có dữ liệu của họ)
- wichart, FireAnt đều có → nếu không có sẽ bị coi thiếu feature cơ bản
- Học viên là môi giới → cần biết user đang hold gì để gợi ý rebalance (tạo giao dịch → hoa hồng)

### 1.2 FR mới — FR-EXT-PORT-* (M1)

| ID | Yêu cầu | Ưu tiên | Mốc |
|---|---|---|---|
| FR-EXT-PORT-01 | User tạo danh mục thủ công: thêm mã, số lượng, giá vốn, ngày mua | M | M1 |
| FR-EXT-PORT-02 | User import danh mục từ CSV (template chuẩn) | M | M1 |
| FR-EXT-PORT-03 | User connect broker API (xem BROKER_INTEGRATION.md) để auto-sync danh mục | S | M1 |
| FR-EXT-PORT-04 | Hiển thị: giá vốn, giá hiện tại, lãi/lỗ realised + unrealised, % lãi/lỗ theo từng mã và tổng danh mục | M | M1 |
| FR-EXT-PORT-05 | Cảnh báo khi mã trong danh mục: kỹ thuật xấu, cơ bản giảm, vĩ mô bất lợi | M | M2 |
| FR-EXT-PORT-06 | Phân tích danh mục: ngành tập trung, hệ số beta, tương quan giữa các mã | S | M3 |
| FR-EXT-PORT-07 | Gợi ý rebalance dựa trên signal (KHÔNG dùng chữ "nên bán", chỉ "tín hiệu yếu/strong") | S | M3 |

### 1.3 Sửa đổi mục 3.2 URS gốc

**Bỏ** dòng: "Quản lý danh mục có giá vốn và tính lãi/lỗ" khỏi phần "Ngoài phạm vi bản 1.0".

**Thay bằng**: "Quản lý danh mục thủ công và import CSV ở phạm vi M1. Connect broker API ở M2 (xem BROKER_INTEGRATION.md)."

---

## 2. Bổ sung nhóm "AI Copilot Interface" (Hero feature)

### 2.1 Gap

URS gốc chỉ có dashboard phân tích. wichart, Vietstock cũng vậy. Để có moat sâu, cần **chat interface làm hero feature**,wichart/vietstock không có LLM infrastructure để clone nhanh.

### 2.2 FR mới — FR-EXT-AI-* (M0.5 → M2)

| ID | Yêu cầu | Ưu tiên | Mốc |
|---|---|---|---|
| FR-EXT-AI-01 | Hệ thống cung cấp giao diện chat Q&A trong app: user hỏi câu tự nhiên về cổ phiếu, danh mục, thị trường | M | M0.5 |
| FR-EXT-AI-02 | AI trả lời **có trích dẫn provenance**: chỉ số nào, báo cáo nào, trang nào, cảnh báo kỹ thuật nào | M | M0.5 |
| FR-EXT-AI-03 | AI trả lời theo nguyên tắc FR-FUND-06: **con số do code tính, AI chỉ tổng hợp chữ nghĩa** | M | M0.5 |
| FR-EXT-AI-04 | Mỗi câu trả lời kèm disclaimer ngắn: "Đây là thông tin phân tích, không phải tư vấn đầu tư" | M | M0.5 |
| FR-EXT-AI-05 | Hệ thống duy trì context: user có thể hỏi tiếp "tại sao?", "so sánh với VCB", "giải thích thêm về Lớp 3" | M | M2 |
| FR-EXT-AI-06 | Hệ thống lưu lịch sử Q&A theo tài khoản, user xem lại được | S | M2 |
| FR-EXT-AI-07 | Hệ thống có **guardrail**: từ chối câu kiểu "cho tôi nên mua hay không", "khuyến nghị", "tư vấn cá nhân hoá" | M | M0.5 |
| FR-EXT-AI-08 | Hệ thống có **rate limit** để kiểm soát chi phí AI: Free 10 câu/ngày, Premium không giới hạn (fair use) | M | M0.5 |
| FR-EXT-AI-09 | Mỗi câu trả lời có nút "Xem chi tiết" → mở màn hình phân tích đầy đủ của mã đó | S | M2 |
| FR-EXT-AI-10 | Hệ thống hỗ trợ cả văn bản và giọng nói (voice-to-text) | C | M3 |

### 2.3 Hero feature user flow

```
User mở app
    ↓
Default screen = AI Chat (KHÔNG phải dashboard)
    ↓
Gợi ý prompt mẫu:
  - "FPT tại sao giảm dù cơ bản tốt?"
  - "So sánh VCB và TCB"
  - "Danh mục của tôi đang có rủi ro gì?"
  - "Ngành ngân hàng tuần này có gì đáng chú ý?"
    ↓
User hỏi hoặc chọn prompt mẫu
    ↓
AI trả lời 1 đoạn ngắn + sources + "Xem chi tiết" link
```

---

## 3. Bổ sung "Market Brief cá nhân hoá"

### 3.1 Gap

wichart có "bản tin" nhưng không **cá nhân hoá theo danh mục user**. Daily brief là engagement driver mạnh.

### 3.2 FR mới — FR-EXT-BRIEF-* (M1 → M3)

| ID | Yêu cầu | Ưu tiên | Mốc |
|---|---|---|---|
| FR-EXT-BRIEF-01 | Hệ thống gửi Brief sáng qua push + Zalo/email lúc 7:30 mỗi ngày giao dịch | M | M1 |
| FR-EXT-BRIEF-02 | Brief có 4 phần: (a) Danh mục user hôm qua, (b) Cảnh báo kỹ thuật mới, (c) Tin vĩ mô ảnh hưởng mã hold, (d) Top movers thị trường | M | M3 |
| FR-EXT-BRIEF-03 | Brief cá nhân hoá: chỉ hiển thị tin ảnh hưởng tới mã user đang hold hoặc watchlist | M | M3 |
| FR-EXT-BRIEF-04 | Brief có ngôn ngữ trung tính, không "tín hiệu tăng → nên mua" | M | M1 |
| FR-EXT-BRIEF-05 | User tuỳ chỉnh: bật/tắt brief, chọn giờ gửi, chọn độ dài (ngắn/trung/dài) | S | M3 |
| FR-EXT-BRIEF-06 | Weekly Brief Chủ nhật: tóm tắt tuần, preview tuần tới, review dự đoán tuần trước | S | M3 |

---

## 4. Bổ sung "Crowd Intelligence" (Network effect)

### 4.1 Gap

wichart không có vì không có user base đủ. Đây là moat network effect: càng nhiều user, dữ liệu càng giá trị.

### 4.2 FR mới — FR-EXT-CROWD-* (M3 → M4)

| ID | Yêu cầu | Ưu tiên | Mốc |
|---|---|---|---|
| FR-EXT-CROWD-01 | Hệ thống thu thập dữ liệu ẩn danh: danh mục user (đã mã hoá), watchlist, alert đã nhận | M | M3 |
| FR-EXT-CROWD-02 | User consent rõ ràng (opt-in) khi đăng ký: "Cho phép dùng dữ liệu ẩn danh để cải thiện crowd signal" | M | M3 |
| FR-EXT-CROWD-03 | Aggregate: hiển thị "X% user Premium đang hold VCB", "Y% đã bán trong 7 ngày", "Z% mới thêm vào watchlist tuần này" | M | M3 |
| FR-EXT-CROWD-04 | Phân tầng: chỉ aggregate từ Premium user để tránh spam account | M | M3 |
| FR-EXT-CROWD-05 | Hiển thị "Sector rotation heatmap": dòng tiền flowing in/out các ngành theo crowd | S | M4 |
| FR-EXT-CROWD-06 | Cảnh báo "Crowd sentiment khác biệt với technical signal" → insight về contrarian | C | M4 |

---

## 5. Bổ sung "AI Backtest cá nhân"

### 5.1 Gap

FR-BT-01 gốc chỉ backtest tín hiệu cố định. Mở rộng: user tự nhập rule để backtest. Đây là differentiator mạnh cho F1+.

### 5.2 FR mới — FR-EXT-BT-* (M4)

| ID | Yêu cầu | Ưu tiên | Mốc |
|---|---|---|---|
| FR-EXT-BT-01 | User nhập rule bằng ngôn ngữ tự nhiên: "Mua khi giá vượt MA50 + khối lượng > 2x TB 20 phiên" | M | M4 |
| FR-EXT-BT-02 | AI dịch rule sang query → chạy backtest trên 5–10 năm dữ liệu | M | M4 |
| FR-EXT-BT-03 | Hiển thị: số lệnh, win rate, average return, max drawdown, Sharpe ratio | M | M4 |
| FR-EXT-BT-04 | So sánh với benchmark VNINDEX | M | M4 |
| FR-EXT-BT-05 | User có thể lưu rule thành "strategy" và apply vào watchlist hiện tại | S | M4 |
| FR-EXT-BT-06 | Cảnh báo overfitting: hiển thị "Rule này có X tham số → khả năng overfit cao" | M | M4 |

---

## 6. Sửa đổi FR-COMP (Pháp lý + Conflict of Interest)

### 6.1 Gap

URS gốc FR-COMP-04 để luật sư rà soát ở M4. Với mô hình brokerage, pháp lý phải check **M0**, không phải M4.

### 6.2 FR mới và sửa đổi

| ID | Yêu cầu | Ưu tiên | Mốc |
|---|---|---|---|
| FR-EXT-COMP-01 | **Sửa FR-COMP-04**: luật sư rà soát pháp lý = M0 (không phải M4) | M | M0 |
| FR-EXT-COMP-02 | Transparency: app hiển thị rõ "Học viên nhận hoa hồng khi user giao dịch qua ID trong app" ở onboarding + cài đặt | M | M0 |
| FR-EXT-COMP-03 | Cấm "One-click order" từ màn cảnh báo: phải có friction (confirm dialog + waiting period 5s) | M | M1 |
| FR-EXT-COMP-04 | Cảnh báo overtrading: nếu user giao dịch >10 lệnh/tuần, app hiển thị cảnh báo "Có thể bạn đang overtrade" | M | M2 |
| FR-EXT-COMP-05 | Audit log mọi AI output (lưu 90 ngày) để đối chiếu khi có khiếu nại | M | M0.5 |
| FR-EXT-COMP-06 | User data isolation: dữ liệu crowd intelligence phải mã hoá, không trace về cá nhân | M | M3 |

---

## 7. Điều chỉnh Roadmap (xem lại M0 → M4)

### 7.1 Thêm Mốc M0.5 — AI Q&A MVP

| Mốc | Nội dung | Ước lượng | Kết quả bàn giao |
|---|---|---|---|
| **M0.5 — AI Q&A MVP** (MỚI) | RAG trên 50 mã VN100 (BCTC gần nhất), chat interface, hero feature demo cho 700 Zalo | 3–4 tuần | App demo "chat với cổ phiếu" + early bird mở TK |

### 7.2 Điều chỉnh M1 — Thêm Portfolio Tracking

| Mốc | Nội dung (thêm) | Ước lượng |
|---|---|---|
| **M1 — Lớp Kỹ thuật + Cảnh báo + Portfolio** | + Portfolio tracking (FR-EXT-PORT-01..06) + Referral link broker | +3 tuần |

### 7.3 Thêm Mốc M3.5 — Market Brief + Crowd Intelligence

| Mốc | Nội dung | Ước lượng |
|---|---|---|
| **M3.5 — Brief + Crowd** (MỚI) | Market Brief cá nhân hoá (FR-EXT-BRIEF-*) + Crowd intelligence (FR-EXT-CROWD-*) | 4–6 tuần |

### 7.4 Điều chỉnh M4 — Thêm Enterprise Tier

| Mốc | Nội dung (thêm) |
|---|---|
| **M4 — Thương mại hoá + Enterprise** | + White-label/affiliate features + Data API tier + B2B compliance (ISO-style) |

### 7.5 Roadmap tổng thể mới

| Mốc | Tuần | Nội dung chính |
|---|---|---|
| M0 | 0–8 | Nền móng: data, DB, broker integration |
| **M0.5** | **6–10** | **AI Q&A MVP (hero feature demo)** |
| M1 | 8–22 | Kỹ thuật + cảnh báo + watchlist + portfolio + app Flutter |
| M2 | 22–40 | Cơ bản + AI deep-dive + 5 trụ + chỉ số ngành |
| M3 | 40–52 | Vĩ mô + giải thích mâu thuẫn |
| **M3.5** | **48–56** | **Brief cá nhân hoá + Crowd intelligence** |
| M4 | 52–64 | Backtest cá nhân + Enterprise tier + launch |

**Tổng mới:** ~64 tuần (~16 tháng) với 15–20h/tuần = **1.050–1.280 giờ** thực tế (thực tế có thể 1.5–2x với non-tech học while doing).

---

## 8. Sửa đổi NFR (Yêu cầu phi chức năng)

### 8.1 Bổ sung NFR mới

| ID | Yêu cầu | Chỉ tiêu |
|---|---|---|
| NFR-11 | Chi phí AI/chat | ≤ 50k/Premium user/tháng (sau cache + batch) |
| NFR-12 | Latency AI Q&A | P95 ≤ 5 giây cho câu trả lời đầy đủ |
| NFR-13 | Data isolation | Crowd data phải anonymised, không trace về user ID |
| NFR-14 | Uptime AI service | ≥ 99% trong giờ giao dịch |
| NFR-15 | Audit log | Lưu 90 ngày mọi AI output + mọi cảnh báo đã phát |
| NFR-16 | Rate limiting | Free: 10 AI câu/ngày, Premium: 100 câu/ngày (fair use) |

### 8.2 Sửa đổi NFR-03 và NFR-09

**NFR-03** (500 user đồng thời): **giảm xuống 200** ở M1, tăng dần lên 500 ở M3, 1000+ ở M4.

**NFR-09** (≤6tr/tháng): **giữ nguyên**, nhưng bổ sung ngân sách AI riêng:
- AI cost ước tính: 200k/user/tháng × 100 Premium = 20tr/tháng
- Tổng chi phí vận hành + AI: ~25tr/tháng (vẫn trong ngân sách nếu revenue đủ)

---

## 9. Tổng hợp thay đổi so với URS gốc

| Hạng mục | Thay đổi |
|---|---|
| Mục 3.2 | Bỏ "Quản lý danh mục" khỏi ngoài phạm vi |
| FR-EXT-PORT (7 FR) | Thêm nhóm portfolio tracking |
| FR-EXT-AI (10 FR) | Thêm nhóm AI Copilot (hero feature) |
| FR-EXT-BRIEF (6 FR) | Thêm nhóm Market Brief cá nhân hoá |
| FR-EXT-CROWD (6 FR) | Thêm nhóm Crowd Intelligence |
| FR-EXT-BT (6 FR) | Thêm nhóm AI Backtest cá nhân |
| FR-EXT-COMP (6 FR) | Pháp lý + conflict of interest (sửa FR-COMP-04 sang M0) |
| NFR-11..16 | Thêm 6 NFR mới |
| NFR-03 | Giảm threshold 500 → 200 (M1) |
| M0.5 (MỚI) | AI Q&A MVP |
| M3.5 (MỚI) | Brief + Crowd intelligence |
| M4 mở rộng | Enterprise tier + B2B |

**Tổng cộng:** +41 FR mới, +6 NFR mới, 2 mốc roadmap mới, 1 sửa đổi mục phạm vi, 1 sửa đổi FR-COMP-04.

---

## 10. Trạng thái chờ PO

| ID | Nội dung | Hạn |
|---|---|---|
| AM-D1 | PO duyệt mở lại portfolio tracking? | Tuần 1 |
| AM-D2 | PO chọn hero feature = AI Chat hay Dashboard? | Tuần 1 |
| AM-D3 | PO đồng ý M0.5 = AI Q&A MVP (thêm 3–4 tuần)? | Tuần 1 |
| AM-D4 | PO duyệt M3.5 = Brief + Crowd intelligence? | Tháng 3 |
| AM-D5 | PO duyệt enterprise tier ở M4? | Tháng 4 |
| AM-D6 | PO chốt NFR-03 = 200 (M1) hay giữ 500? | Tuần 2 |
