# DOCS EXTENSION — Tài liệu mở rộng cho URS v1.0

| | |
|---|---|
| **Mục đích** | Mở rộng URS gốc để phản ánh (1) mô hình kinh doanh kết hợp môi giới + SaaS, (2) pivot AI Copilot làm hero feature, (3) lộ trình đi đường dài với doanh thu cao |
| **Ngày lập** | 28/07/2026 |
| **PO** | Tú (môi giới CK + KOL tư vấn, 700 người Zalo) |
| **BA** | Claude |

---

## Cấu trúc tài liệu

```
docs/
├── urs_origin/
│   └── URS-app-phan-tich-co-phieu-v1.0.md   # URS gốc, không chỉnh sửa
└── extension/
    ├── INDEX.md                  # File này
    ├── BUSINESS_MODEL.md         # Mô hình kinh doanh kết hợp môi giới + SaaS
    ├── URS_AMENDMENTS.md         # Bổ sung/cải tiến URS gốc (41 FR mới)
    ├── BROKER_INTEGRATION.md     # Tích hợp sàn CK + referral hoa hồng
    ├── PRICING_TIERS.md          # Bảng giá Free/Pro/Premium/Premium AI + B2B
    └── GTM_PLAN.md               # Go-to-market 90 ngày cho kênh 700 Zalo
```

---

## Thứ tự đọc đề nghị

| Bước | Tài liệu | Mục đích |
|---|---|---|
| 1 | `../urs_origin/URS-app-phan-tich-co-phieu-v1.0.md` | Hiểu baseline sản phẩm |
| 2 | `BUSINESS_MODEL.md` | Hiểu pivot mô hình (brokerage + SaaS) |
| 3 | `URS_AMENDMENTS.md` | Hiểu thay đổi về yêu cầu (41 FR mới) |
| 4 | `BROKER_INTEGRATION.md` | Hiểu cơ chế kỹ thuật + business broker |
| 5 | `PRICING_TIERS.md` | Hiểu bảng giá và unit economics |
| 6 | `GTM_PLAN.md` | Hiểu kế hoạch triển khai 90 ngày đầu |

---

## Tóm tắt thay đổi chiến lược

| Khía cạnh | URS gốc | Mở rộng |
|---|---|---|
| **Mô hình** | SaaS subscription thuần | Brokerage revenue (chính) + SaaS subscription (phụ) |
| **Hero feature** | Dashboard phân tích 3 lớp | AI Copilot chat (dashboard là phụ) |
| **Portfolio** | Ngoài phạm vi (3.2) | Brought back (FR-EXT-PORT-01..07) — lock-in mechanism |
| **Pháp lý** | M4 (cuối) | M0 (blocker) |
| **Market Brief** | Không có | Daily cá nhân hoá (FR-EXT-BRIEF-01..06) |
| **Crowd Intelligence** | Không có | Network effect (FR-EXT-CROWD-01..06) |
| **AI Backtest** | Tín hiệu cố định | User tự nhập rule (FR-EXT-BT-01..06) |
| **Enterprise** | Không có | White-label + Data API (M3+) |
| **ARPU/year** | ~990k (subscription only) | ~2–5tr (subscription + brokerage) |
| **Roadmap** | M0–M4 (12–18 tháng) | M0 + M0.5 + M1 + M2 + M3 + M3.5 + M4 (~16 tháng) |

---

## Quyết định binary blocker (verify TRƯỚC khi code)

| ID | Việc | Hạn | Plan B |
|---|---|---|---|
| BRK-V6 | Luật sư CK confirm mô hình app + brokerage hợp pháp | Tuần 1 | Pivot sang SaaS thuần hoặc Research-as-a-Service (xem GTM_PLAN.md section 9) |
| BRK-V1..V3 | VPS/SSI/DNSE cho phép API + referral | Tuần 1 | Đổi sàn hoặc dùng data public |
| A6 (URS gốc) | VPS cho phép dùng dữ liệu trong sản phẩm thu phí | Tuần 1 | Đổi nguồn giá |

---

## FR mới tổng hợp

| Nhóm | SL FR | Tài liệu |
|---|---|---|
| FR-EXT-PORT (Portfolio tracking) | 7 | URS_AMENDMENTS.md |
| FR-EXT-AI (AI Copilot hero) | 10 | URS_AMENDMENTS.md |
| FR-EXT-BRIEF (Market Brief) | 6 | URS_AMENDMENTS.md |
| FR-EXT-CROWD (Crowd Intelligence) | 6 | URS_AMENDMENTS.md |
| FR-EXT-BT (AI Backtest) | 6 | URS_AMENDMENTS.md |
| FR-EXT-COMP (Compliance) | 6 | URS_AMENDMENTS.md |
| FR-EXT-BRK (Broker config) | 7 | BROKER_INTEGRATION.md |
| FR-EXT-REF (Referral flow) | 7 | BROKER_INTEGRATION.md |
| FR-EXT-BRKAPI (Broker API sync) | 7 | BROKER_INTEGRATION.md |
| FR-EXT-COM (Hoa hồng) | 8 | BROKER_INTEGRATION.md |
| FR-EXT-BRK-COMP (Broker compliance) | 5 | BROKER_INTEGRATION.md |
| FR-EXT-PRICING | 9 | PRICING_TIERS.md |
| FR-EXT-RR (Referral reward) | 3 | GTM_PLAN.md |
| **Tổng cộng** | **87 FR mới** | |

---

## Trạng thái chờ PO

Tất cả tài liệu trong `/extension/` đang là **draft chờ PO duyệt**. Quyết định cần chốt:

1. **BUSINESS_MODEL.md** — BM-D1..D6 (chốt sàn cắm ID, chính sách hoa hồng, tặng Premium, affiliate năm 1 hay năm 2)
2. **URS_AMENDMENTS.md** — AM-D1..D6 (duyệt mở lại portfolio, chọn hero feature, duyệt M0.5/M3.5 mới)
3. **BROKER_INTEGRATION.md** — BRK-V1..V6 (verify blocker) + broker policy
4. **PRICING_TIERS.md** — chốt 4 tier giá, chính sách lifetime, B2B tier
5. **GTM_PLAN.md** — chốt scope 90 ngày, budget 9.8tr, target KPI

---

## Cập nhật tiếp theo (nếu PO duyệt)

- [ ] Viết URS v2.0 (merge URS gốc + Amendments + FR mới thành 1 document)
- [ ] Viết ARCHITECTURE.md (kiến trúc kỹ thuật chi tiết)
- [ ] Viết TECHNICAL_STACK.md (chọn stack cụ thể: backend, mobile, AI)
- [ ] Viết UI_WIREFRAMES.md (wireframe chính: AI chat, dashboard, portfolio)
- [ ] Viết TEST_PLAN.md (kế hoạch test M0.5)
- [ ] Viết LEGAL_REVIEW.md (sau khi có luật sư opinion)

---

*Hết tài liệu — INDEX v1.0*
