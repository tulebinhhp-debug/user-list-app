# GTM PLAN — Go-to-market 90 ngày cho kênh 700 Zalo

| | |
|---|---|
| **Tài liệu** | Kế hoạch go-to-market 90 ngày cho giai đoạn 1 (B2C + Brokerage bootstrap) |
| **Phiên bản** | 1.0 — draft chờ PO |
| **Ngày lập** | 28/07/2026 |
| **Tham chiếu** | `BUSINESS_MODEL.md`, `PRICING_TIERS.md`, `BROKER_INTEGRATION.md` |
| **Context** | PO là môi giới CK + KOL tư vấn, có 700 người Zalo warm. Non-tech, 1 người, ngoài giờ. |

> **Nguyên tắc GTM**: Khai thác kênh warm 700 người Zalo TRƯỚC khi đụng đến kênh lạnh. 50 user trả phí đầu đến từ Zalo này, không từ Ads hay SEO. Tiền early bird dùng để cover chi phí build.

---

## 0. Mục tiêu 90 ngày

| Metric | Mục tiêu | Tối thiểu |
|---|---|---|
| User trong app | 200 | 150 |
| User mở TK qua app referral | 50 | 30 |
| User trả phí early bird | 30 | 15 |
| Revenue 90 ngày | 25tr | 12tr |
| Referral link click | 300 | 200 |
| Kết quả định tính | App chạy được M0+M0.5, user feedback tích cực | Demo khả dụng |

---

## 1. Phase 1 — Tuần 1–4: Verify + Setup + Tease

### Mục tiêu
- Verify các blocker pháp lý + broker policy (binary)
- Setup landing page + waitlist
- Tease 700 người Zalo về sản phẩm sắp ra mắt

### 1.1 Verify Blocker (Tuần 1–2) — NGƯNG TẤT CẢ NẾU FAIL

| Task | Hạn | Output |
|---|---|---|
| BRK-V1: Email VPS hỏi API + quyền sử dụng | Ngày 3 | Câu trả lời written |
| BRK-V2: Email SSI hỏi tương tự | Ngày 3 | Câu trả lời written |
| BRK-V3: Đọc DNSE open API docs | Ngày 5 | Note kỹ thuật |
| BRK-V6: Gọi luật sư CK — hỏi "app + brokerage có vi phạm Luật CK 2019?" | Ngày 10 | Opinion viết |
| FR-V1: Quyết định cắm ID sàn nào (3 sàn P1+P2) | Ngày 14 | Danh sách chốt |

> **Nếu BRK-V6 luật sư nói KHÔNG**: pivot mô hình (xem section 9), KHÔNG build.

### 1.2 Setup landing + waitlist (Tuần 3–4)

**Stack đơn giản nhất (ponytail):**
- Landing page: Carrd.co hoặc Notion site ($19/năm)
- Waitlist: Google Forms hoặc Tally (free)
- Domain: tên sản phẩm — chưa chốt tên, dùng `phan-tich-co-phieu-vn.carrd.co` tạm
- Email collector: Tally form export CSV

**Nội dung landing page:**
```
[Hero]
  "Hiểu cổ phiếu Việt Nam — với AI, có trích dẫn"
  "App phân tích 3 lớp: Cơ bản + Kỹ thuật + Vĩ mô"
  [Đăng ký nhận early access + quà]

[3 giá trị chính]
  1. Hỏi AI bất kỳ câu nào về cổ phiếu → có nguồn trích dẫn
  2. Cảnh báo breakout realtime tới điện thoại
  3. Mở tài khoản CK qua app — nhận Premium miễn phí

[Evidence]
  "Beta version Q4/2026. Đăng ký sớm để nhận ưu đãi lifetime."

[CTA]
  [Đăng ký early access — giới hạn 50 người đầu]
```

### 1.3 Tease 700 người Zalo (Tuần 4)

**Đừng spam link ngay.** Học viên post 3–5 content tuần 4:

| Ngày | Content | Mục đích |
|---|---|---|
| T2 | "Tôi đang xây app phân tích CK, dùng AI đọc BCTC. Ai quan tâm?" | Test interest |
| T3 | (Reply từng comment) + screenshot 1 feature (ví dụ chat với cổ phiếu) | Build hype |
| T5 | "Mở waitlist cho 50 người đầu — nhận lifetime discount" | Drive conversion |
| CN | "Đã có X đăng ký, còn Y chỗ. Link: [landing page]" | Urgency |

**Đo lường:**
- Comment/inbox học viên: target ≥30
- Waitlist signup: target ≥50
- Nếu <20 signup → review content + retry

---

## 2. Phase 2 — Tuần 5–8: Build MVP + Beta invite

### Mục tiêu
- Build xong M0 (data) + M0.5 (AI Q&A MVP) — chỉ 50 mã VN100
- Beta invite 30 user từ waitlist
- Thu feedback, iterate nhanh

### 2.1 Build MVP (Tuần 5–8)

**Scope nghiêm ngặt (Ponytail mode):**
- Backend: Python + FastAPI + PostgreSQL + TimescaleDB
- Crawler: 1 nguồn (VPS API cho giá + tự crawl cafef cho BCTC cơ bản)
- AI: dùng LLM có sẵn (GLM 4.6V/Sonnet 5) qua API
- Mobile: Flutter thin client
- Skip: wichart crawler (rủi ro), 4 trường phái PTKT (chỉ Wyckoff), portfolio tracking (chỉ import CSV)

**Demo flow phải chạy được:**
1. User login → xem watchlist (5 mã VN100)
2. User hỏi AI "FPT tại sao giảm?" → AI trả lời với RAG trên BCTC gần nhất
3. User mở TK qua link VPS referral → gắn broker_id → unlock Premium 3 tháng

### 2.2 Beta invite (Tuần 7–8)

| Việc | Chi tiết |
|---|---|
| Chọn 30 user từ waitlist | Priority: người hay hỏi + hay giao dịch trong Zalo |
| Mời vào group Zalo "Beta Tester" riêng | Support trực tiếp, tránh spam 700 người |
| Onboarding 1:1 qua Zalo | Học viên hướng dẫn từng người (mất 1–2h/người nhưng cần) |
| Feedback form mỗi tuần | Tally form: "Feature nào hữu ích? Cái gì khó dùng? Bug?" |
| Daily office hour | 30 phút mỗi tối trong group Zalo beta |

**KPI Beta:**
- 30 user active (mở app ≥3 lần/tuần)
- ≥50% mở TK qua referral
- NPS ≥ 30
- Critical bugs < 5/tuần sau tuần 2

---

## 3. Phase 3 — Tuần 9–12: Launch Early Bird + Mở rộng

### Mục tiêu
- Launch early bird public cho cả 700 Zalo
- Target 30 user trả phí + 50 user mở TK
- Setup referral program

### 3.1 Launch Early Bird (Tuần 9)

**Offer:**
- **490k/năm** (giá Pro 690k giảm 30%)
- **Lifetime: 4.900.000đ** cho 30 người đầu (giới hạn)
- **Mở TK qua app: tặng 3 tháng Premium miễn phí** (FR-EXT-PRICING-01)

**Sequence launch:**

| Ngày | Hành động | Channel |
|---|---|---|
| T2 | "Launch Early Bird — 50 chỗ" | Group Zalo 700 |
| T2 (trưa) | Recap beta feedback (screenshot chat user) | Group Zalo |
| T3 | Email + Zalo broadcast tới waitlist 50 người | Direct |
| T4 | "Đã có X/50 đăng ký. Còn Y chỗ." | Group Zalo |
| T6 | "Còn Z chỗ, đóng đăng ký tuần sau" | Group Zalo |
| CN | Đóng Early Bird (nếu đủ) hoặc gia hạn (nếu thiếu) | Group Zalo |

### 3.2 Setup Referral Program (Tuần 9–10)

**Cơ chế đơn giản:**
- Mỗi user có referral code riêng (ví dụ `HOCVIEN-ABC123`)
- Bạn bè đăng ký + trả phí → referrer tặng 1 tháng Premium
- Tracking: mã referral nhập khi onboarding

**FR mới — FR-EXT-RR-* (M1)**

| ID | Yêu cầu |
|---|---|
| FR-EXT-RR-01 | Hệ thống sinh referral code unique cho mỗi user |
| FR-EXT-RR-02 | Hệ thống track khi có user mới nhập referral code |
| FR-EXT-RR-03 | Hệ thống tự động tặng 1 tháng cho referrer + referee |

### 3.3 KOL Outreach (Tuần 10–12)

Tiếp cận 3–5 KOL tư vấn CK khác (có group Zalo riêng):

**Pitch script (học viên gửi):**
> "Anh/chị ơi, em vừa build xong app phân tích CK có AI Copilot. Em đang tìm 3 KOL partner để affiliate — anh/chị giới thiệu cho group của mình, nhận 30% subscription + 20% hoa hồng nếu user mở TK qua app. Anh/chị có quan tâm không? Em demo 15 phút."

**Target KOL:**
- Group Zalo 500–2000 members
- Segment F1–F2 (đúng tệp)
- Chưa có app riêng

**Kỳ vọng:** 2 KOL đồng ý thử → thêm 30–50 user tiềm năng.

---

## 4. Content strategy trong 90 ngày

Học viên phải post đều trong group Zalo 700 để giữ engagement.

### 4.1 Lịch content/tuần

| Thứ | Loại content | Mục đích |
|---|---|---|
| T2 | "Cổ phiếu tuần này" — 1 mã deep dive ngắn | Authority + giá trị |
| T3 | Screenshot 1 feature app (tease) | Build hype sản phẩm |
| T4 | Hỏi AI "tại sao mã X?" — đăng câu trả lời | Hero feature showcase |
| T6 | Recap market + cảnh báo của app (beta) | Product placement |
| CN | Câu chuyện xây app (behind the scenes) | Connection + trust |

### 4.2 Content evergreen (tái sử dụng)

Tạo 10 content "edu" về phân tích cơ bản/kỹ thuật/vĩ mô. Mỗi tuần share lại 1 content để bổ nhóm mới:
- "5 chỉ số cơ bản phải xem trước khi mua"
- "Đọc BCTC ngân hàng khác gì doanh nghiệp thường?"
- "Vì sao cổ phiếu tốt mà giá giảm? 4 lý do phổ biến"
- v.v.

---

## 5. Đo lường và pivot

### 5.1 KPI theo phase

| Phase | KPI chính | Threshold |
|---|---|---|
| Phase 1 | Waitlist signup | ≥50 (hoặc pivot content) |
| Phase 2 | Beta user active | ≥20/30 (hoặc iterate UX) |
| Phase 3 | Early bird conversion | ≥30/700 (4.3% — hợp lý cho warm audience) |

### 5.2 Trigger pivot

| Trigger | Hành động |
|---|---|
| <20 waitlist sau Phase 1 | Pivot content angle hoặc re-position |
| <10 beta active sau Phase 2 | App khó dùng, pause launch, iterate UX |
| <15 early bird sau tuần 2 Phase 3 | Pricing quá cao hoặc product-market fit yếu |
| Luật sư BRK-V6 nói KHÔNG | Pivot toàn bộ mô hình (xem section 9) |

---

## 6. Budget 90 ngày

| Hạng mục | Chi phí |
|---|---|
| Landing + domain | ~500k |
| Server VPS (build + beta) | 1.200k × 3 = 3.600k |
| LLM API cost (beta 30 user) | ~2.000k |
| Flutter app store dev account | 1.000k (Apple) + 700k (Google one-time) |
| Luật sư CK consult (2h) | 2.000k |
| **Tổng** | **~9.800k** |

**Breakeven:** 30 user × 490k = 14.700k → **lãi 4.900k sau 90 ngày** (reinvest vào M1).

---

## 7. Task list theo tuần (checklist cho PO)

### Tuần 1
- [ ] Email VPS, SSI, DNSE hỏi API + broker policy
- [ ] Gọi luật sư CK đặt hẹn
- [ ] Tạo Notion doc "GTM plan tracker"

### Tuần 2
- [ ] Nhận câu trả lời từ 3 sàn
- [ ] Hỏi xong luật sư, có written opinion
- [ ] Quyết định 3 sàn cắm ID

### Tuần 3
- [ ] Mua domain + setup Carrd landing
- [ ] Setup Tally waitlist form
- [ ] Viết 3 content "tease" cho Zalo

### Tuần 4
- [ ] Post 3 content tease trong group Zalo 700
- [ ] Drive 50 waitlist signup
- [ ] Chốt 50 người đầu cho early access

### Tuần 5–6
- [ ] Build M0: DataSourceAdapter + DB + VPS API connect
- [ ] Build M0.5: RAG 50 mã VN100 + chat UI
- [ ] Setup referral link flow (deeplink 3 sàn)

### Tuần 7–8
- [ ] Mời 30 user beta vào group riêng
- [ ] Onboarding 1:1 qua Zalo
- [ ] Collect feedback weekly
- [ ] Fix critical bugs

### Tuần 9
- [ ] Launch Early Bird public cho 700 Zalo
- [ ] Setup referral program
- [ ] Email + broadcast tới waitlist

### Tuần 10
- [ ] Outreach 3–5 KOL affiliate
- [ ] Push urgency "còn X chỗ"
- [ ] Track conversion daily

### Tuần 11
- [ ] Onboard user trả phí
- [ ] Setup support process (Zalo + email)
- [ ] Recap "Behind the scenes" content

### Tuần 12
- [ ] Close Early Bird
- [ ] Review 90 ngày: đạt KPI?
- [ ] Quyết định kế hoạch 90 ngày tiếp theo (build M1)

---

## 8. Risk Management

| Rủi ro | Xác suất | Tác động | Mitigation |
|---|---|---|---|
| BRK-V6 luật sư cấm | 20% | Cao (kill project) | Verify sớm tuần 1, có plan B (xem section 9) |
| VPS không cho API | 30% | Trung bình | Đổi sang SSI hoặc DNSE |
| Beta khó dùng, NPS thấp | 40% | Cao | Iterate UX tuần 7–8, delay launch nếu cần |
| <15 early bird sau 2 tuần | 30% | Cao | Review pricing, thêm bonus, gia hạn deadline |
| KOL không quan tâm | 50% | Thấp | Bỏ qua, focus 700 Zalo |
| Học viên kiệt sức ngoài giờ | 60% | Rất cao | Cắt scope M0.5 tối thiểu, không build dư |

---

## 9. Plan B — Pivot nếu BRK-V6 fail

Nếu luật sư nói mô hình brokerage + app KHÔNG khả thi:

**Pivot A — SaaS thuần (wichart clone khác biệt hoá):**
- Bỏ referral + broker integration
- Focus 100% vào subscription + research
- Pricing: 690k–1.290k/năm
- Revenue thấp hơn 40–50% nhưng khả thi

**Pivot B — Research-as-a-Service:**
- Bỏ app, focus newsletter + group Premium
- Học viên làm research partner, không bán tool
- Pricing: 199k/tháng (~2.4tr/năm)
- Chi phí thấp, revenue vừa phải

**Pivot C — B2B White-label:**
- Bán tool cho 1 CTCK nhỏ (SHS, VCI, BVS) hoặc 1 KOL lớn
- 1 khách × 20tr/tháng = 240tr/năm
- Cần sales + hợp đồng, không cần 700 Zalo

---

## 10. Tóm tắt 1 câu

> **GTM 90 ngày = (Phase 1, tuần 1–4) Verify blocker pháp lý + broker policy, setup landing + tease 700 Zalo để lấy 50 waitlist; (Phase 2, tuần 5–8) Build M0+M0.5 MVP (50 mã VN100 + AI Q&A), beta invite 30 user, thu feedback; (Phase 3, tuần 9–12) Launch Early Bird 490k/năm + lifetime 4.9tr (giới hạn 30) + tặng 3 tháng Premium cho user mở TK, setup referral program, outreach 3–5 KOL affiliate. Target: 200 user app, 50 mở TK, 30 trả phí, revenue 25tr, đủ cover chi phí 9.8tr và có vốn xoay vòng build M1.**
