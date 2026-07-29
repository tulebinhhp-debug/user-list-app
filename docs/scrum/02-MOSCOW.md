# 02 — PHÂN LOẠI MoSCoW

| | |
|---|---|
| **Bài tập** | KTS Week 2 — Day 2 · Bước 2/5 |
| **Vai thực hiện** | Scrum Master (AI) |
| **Đầu vào** | `01-USER-STORIES.md` — 21 story + 6 hạng mục nền móng |
| **Đầu ra** | Thứ tự ưu tiên để dựng Product Backlog |
| **Ngày lập** | 29/07/2026 |
| **Trạng thái** | ✅ PO đã duyệt 29/07/2026 — còn `MSC-D3`, `MSC-D7`, `PAY-D2` treo |

---

## 1. Định nghĩa 4 mức — chốt trước khi phân loại

Không định nghĩa trước thì mọi thứ đều thành Must. Đây là định nghĩa dùng riêng cho dự án này:

| Mức | Nghĩa là gì trong dự án này | Câu hỏi kiểm tra |
|---|---|---|
| **M — Must** | Không có nó thì **bản phát hành không ra được**: hoặc phạm luật, hoặc sản phẩm mất lý do tồn tại, hoặc thứ khác không chạy được | *"Phát hành mà thiếu cái này thì có coi là thất bại không?"* |
| **S — Should** | Quan trọng, thiếu thì đau, nhưng **có đường vòng tạm thời** | *"Có làm tay được trong 1–2 tháng đầu không?"* |
| **C — Could** | Tăng giá trị, làm nếu còn thời gian, **bỏ thì không ai phàn nàn nhiều** | *"Bỏ đi có mất khách nào không?"* |
| **W — Won't (bản này)** | Công nhận là có giá trị nhưng **cố ý hoãn sang bản sau** — không phải "không bao giờ làm" | *"Hoãn 6 tháng có chết không?"* |

**Quy tắc kỷ luật (DSDM):** Must **không nên vượt 60% khối lượng** của một bản phát hành. Phần còn lại là biên an toàn. Với dự án một người làm ngoài giờ, biên an toàn chính là thứ giữ dự án sống (`R3` — kiệt sức).

---

## 2. Phát hiện quan trọng trước khi phân loại

Em ước lượng toàn bộ 21 story + 6 hạng mục nền móng, quy đổi ra thời gian thực:

> **Đơn vị:** 1 điểm ≈ 2–2,5 giờ làm thật. Với 15–20 giờ/tuần → **năng suất khoảng 8 điểm/tuần**.

| Nhóm | Điểm | Quy ra thời gian |
|---|---|---|
| Nền móng (EN-01→06) | 50 | ~6 tuần |
| Story thuộc M0 + M0.5 + M1 | 130 | ~16 tuần |
| **Tổng "Bản 1" theo roadmap hiện tại** | **180** | **≈ 22 tuần (5,5 tháng)** |

**Nhưng `GTM_PLAN` yêu cầu thu được tiền từ tuần 9.**

Đây là mâu thuẫn thật, không phải lỗi ước lượng: kế hoạch bán hàng chạy nhanh gấp đôi kế hoạch xây dựng. Cách xử lý đúng không phải làm nhanh hơn, mà là **chia làm hai bản phát hành**:

| Bản | Thời gian | Mục tiêu | Ai dùng |
|---|---|---|---|
| **R0 — Bản bán được** | Tuần 5–12 | Đủ để 30 người trả tiền và thấy xứng đáng | 30 khách early bird từ nhóm Zalo |
| **R1 — Bản đủ dùng** | Tuần 13–26 | Hoàn chỉnh vòng vận hành hằng ngày | Mở rộng ra 200 người |

MoSCoW dưới đây làm **hai lớp**: một cho toàn sản phẩm, một cho R0 — vì R0 mới là thứ nạp thẳng vào Sprint 1.

---

## 3. Bảng ước lượng chi tiết

### 3.1 Hạng mục nền móng

| ID | Nội dung | Điểm |
|---|---|---|
| EN-01 | Ý kiến pháp lý của luật sư chứng khoán | 3 |
| EN-02 | Lớp trừu tượng nguồn dữ liệu + giá/KL thời gian thực | 13 |
| EN-03 | Giá điều chỉnh (cổ tức, thưởng, chia tách) | 8 |
| EN-04 | Thu thập BCTC/BCTN + công bố thông tin + lưu bản gốc | 13 |
| EN-05 | Tính RS Rating toàn thị trường hằng ngày | 5 |
| EN-06 | Hạ tầng thông báo đẩy + gửi hàng loạt giữ ngưỡng 60 giây | 8 |
| | **Tổng** | **50** |

### 3.2 User story

| ID | Story | Mốc | Điểm |
|---|---|---|---|
| US-01a | Tìm cổ phiếu + màn hình 3 tab | M0.5 | 8 |
| US-01b | Tab Cơ bản — điểm 0–100 theo 5 trụ | M2 | 21 |
| US-01c | Tab Vĩ mô | M3 | 21 |
| US-01d | Tab Kỹ thuật — 4 trường phái | M4 | 21 |
| US-02a | PO soạn danh sách canh + đặt pivot | M1 | 8 |
| US-02b | Khách nhận thông báo vượt mốc | M1 | 8 |
| US-02c | Watchlist và cảnh báo riêng của khách | M1 | 8 |
| US-02d | Hệ thống học cách PO đặt pivot | M4 | 21 |
| US-03a | Bộ lọc Minervini dựng sẵn | M1 | 13 |
| US-03b | Biểu đồ giải thích vì sao mã lọt bộ lọc | M1 | 13 |
| US-03c | Người có kinh nghiệm tự dựng bộ lọc | M3 | 13 |
| US-04a | Mở tài khoản chứng khoán qua app | M1 | 5 |
| US-04b | PO đối soát và duyệt | M1 | 5 |
| US-05a | Đọc bản giải thích của một mã | M0.5 | 5 |
| US-05b | Hệ thống viết và kiểm duyệt bản giải thích | M0.5 | 13 |
| US-06a | Đăng nhập bằng Google | M0 | 5 |
| US-06b | Mua gói và được bật quyền | M1 | 13 |
| US-06c | Gia hạn và nhắc hạn | M1 | 5 |
| US-07a | Bản tin sáng 7:30 | M1 | 13 |
| US-07b | Cảnh báo công bố thông tin doanh nghiệp | M2 | 13 |
| US-08 | Hai chế độ hiển thị | M1 | 8 |
| | **Tổng** | | **240** |

**Toàn sản phẩm: 290 điểm ≈ 36 tuần làm việc thực** — chưa tính thời gian học công nghệ mới. `URS_AMENDMENTS` đã cảnh báo con số thực tế có thể gấp 1,5–2 lần với người vừa học vừa làm.

---

## 4. MoSCoW lớp sản phẩm

| ID | Story | **Mức** | Lý do |
|---|---|---|---|
| EN-01 | Ý kiến pháp lý | **M** | Binary blocker. Luật sư nói không thì cả mô hình sụp |
| EN-02 | Lớp dữ liệu + giá thời gian thực | **M** | 19/21 story phụ thuộc |
| EN-03 | Giá điều chỉnh | **M** | Thiếu là cảnh báo sai và bộ lọc sai hàng loạt. Sửa sau tốn gấp năm |
| EN-04 | Thu thập BCTC + công bố thông tin | **M** | Không có thì không có Lớp Cơ bản |
| EN-05 | RS Rating | **M** | Tiêu chí thứ 8 của Minervini, không có thì bộ lọc sai chuẩn |
| EN-06 | Hạ tầng thông báo | **M** | Toàn bộ giá trị của US-02b nằm ở chỗ tin đến kịp |
| US-01a | Tìm cổ phiếu | **M** | Cửa vào của mọi màn hình khác |
| US-01b | Tab Cơ bản 0–100 | **M** | Lớp 1 — một nửa điểm khác biệt PO đã chọn |
| US-01c | Tab Vĩ mô | **M** | Lớp 3 — nửa còn lại. URS mục 1.3 gọi đây là lý do sản phẩm tồn tại |
| US-01d | Tab Kỹ thuật 4 trường phái | **C** | Cảnh báo pivot đã phủ phần lớn nhu cầu thời điểm. 4 trường phái là chiều sâu, không phải nền |
| US-02a | PO soạn pivot | **M** | Xương sống vận hành hằng ngày |
| US-02b | Khách nhận thông báo | **M** | Thứ khách cảm nhận được mỗi phiên |
| US-02c | Watchlist riêng của khách | **S** | Có US-02a/b rồi thì khách vẫn dùng được app. Nhưng thiếu lâu sẽ thấy app "của anh Tú" chứ không phải "của tôi" |
| US-02d | Học cách đặt pivot | **C** | Moat dài hạn, nhưng cần 1–2 năm dữ liệu mới chạy được |
| US-03a | Bộ lọc Minervini | **M** | Nguồn đầu vào cho US-02a. Không có thì PO vẫn phải lọc tay như cũ |
| US-03b | Biểu đồ giải thích | **M** | Tiêu chí chấp nhận #2 của URS: mọi kết luận phải truy vết được |
| US-03c | Tự dựng bộ lọc | **C** | Phục vụ nhóm P2, nhóm nhỏ hơn |
| US-04a | Mở tài khoản qua app | **M** | Nguồn doanh thu chính của mô hình |
| US-04b | PO đối soát duyệt | **M** | Không có thì US-04a không hoàn tất được |
| US-05a | Đọc bản giải thích | **M** | Cách duy nhất để F0 hiểu được Lớp 1 và 3 |
| US-05b | Bộ sinh và kiểm duyệt nội dung | **M** | Không có bộ chặn thì mỗi bản viết ra là một rủi ro pháp lý |
| US-06a | Đăng nhập Google | **M** | Không có danh tính thì không có watchlist, không có gói, không gắn được broker_id |
| US-06b | Mua gói | **M** | Không có thì không thu được tiền từ người không mở tài khoản |
| US-06c | Gia hạn và nhắc hạn | **M** ⬆️ | **Nâng từ Should lên Must 29/07**: chốt SePay không có trừ tiền tự động, gói 3 tháng nghĩa là khách phải chủ động chuyển lại 4 lần/năm. Quên nhắc là mất doanh thu |
| US-07a | Bản tin sáng | **S** | Lý do mở app mỗi ngày — nhưng PO đang tự làm việc này trong nhóm Zalo rồi |
| US-07b | Cảnh báo công bố thông tin | **S** | Có giá trị rõ, nhưng khách vẫn theo dõi được qua kênh khác |
| US-08 | Hai chế độ hiển thị | **S** | Bản đầu để mặc định chế độ Đơn giản là chạy được |

### Thống kê lớp sản phẩm

| Mức | Số hạng mục | Điểm | % khối lượng |
|---|---|---|---|
| **Must** | 17 | 175 | **60,3%** |
| Should | 5 | 44 | 15,2% |
| Could | 4 | 68 | 23,4% |
| Won't | 0 | 0 | 0% |
| | **26** | **287** | |

✅ **Must = 60,3% — vừa đúng trần.** Nhưng đây là con số cho **cả 36 tuần**. Nó không giúp gì cho việc quyết định 8 tuần tới, nên mới cần lớp thứ hai.

---

## 5. Quyết định của PO — một bản phát hành duy nhất

**`MSC-D1` — PO chọn phương án (b) ngày 29/07/2026: giữ **một bản phát hành lớn**, không chia R0/R1.**
**`MSC-D2` — PO chốt: hoãn xây SePay, đợt khách đầu tiên thu tiền bằng chuyển khoản và bật quyền thủ công.**

Phạm vi **Bản 1** sau khi áp hai quyết định trên:

| | Điểm |
|---|---|
| Toàn bộ M0 + M0.5 + M1 | 180 |
| − US-06b (hệ thống thanh toán, hoãn) | −13 |
| − US-06c (nhắc hạn, phụ thuộc US-06b) | −5 |
| **Bản 1** | **162 điểm ≈ 20 tuần** |

Mở bán ở **tuần 20–22**, chậm hơn `GTM_PLAN` khoảng 10–13 tuần.

---

## 6. MoSCoW cho Bản 1

| ID | Hạng mục | Điểm | **Mức** | Lý do |
|---|---|---|---|---|
| EN-01 | Ý kiến pháp lý | 3 | **M** | Binary blocker |
| EN-02 | Lớp dữ liệu + giá thời gian thực | 13 | **M** | Mọi thứ phía sau phụ thuộc |
| EN-03 | Giá điều chỉnh | 8 | **M** | Thiếu là bộ lọc và cảnh báo sai hàng loạt |
| EN-04 | Thu thập BCTC + công bố thông tin | 13 | **M** | Nguyên liệu của bản giải thích |
| EN-05 | RS Rating toàn thị trường | 5 | **M** | Tiêu chí thứ 8 của Minervini |
| EN-06 | Hạ tầng thông báo đẩy | 8 | **M** | Giá trị của US-02b nằm ở chỗ tin đến kịp |
| US-01a | Tìm cổ phiếu + màn hình | 8 | **M** | Cửa vào |
| US-02a | PO soạn danh sách canh + pivot | 8 | **M** | Xương sống vận hành |
| US-02b | Khách nhận thông báo vượt mốc | 8 | **M** | Thứ khách cảm nhận mỗi phiên |
| US-02c | Watchlist riêng của khách | 8 | **S** | Có US-02a/b là dùng được rồi |
| US-03a | Bộ lọc Minervini | 13 | **M** | Nguồn đầu vào cho US-02a |
| US-03b | Biểu đồ giải thích | 13 | **M** | Tiêu chí chấp nhận #2 của URS |
| US-04a | Mở tài khoản qua app | 5 | **M** | Nguồn doanh thu chính |
| US-04b | PO đối soát duyệt | 5 | **M** | Không có thì US-04a dở dang |
| US-05a | Đọc bản giải thích | 5 | **M** | Điểm khác biệt PO đã chọn |
| US-05b | Bộ sinh và kiểm duyệt nội dung | 13 | **M** | Không có bộ chặn là rủi ro pháp lý mỗi ngày |
| US-06a | Đăng nhập Google | 5 | **M** | Không có danh tính thì không có gì cả |
| US-07a | Bản tin sáng 7:30 | 13 | **S** | PO đang tự viết trong nhóm Zalo |
| US-08 | Hai chế độ hiển thị | 8 | **S** | Mặc định Đơn giản là chạy được |

### Thống kê

| Mức | Điểm | % |
|---|---|---|
| **Must** | 133 | **82%** |
| Should | 29 | 18% |
| **Tổng** | **162** | |

---

## 7. ⚠️ Cảnh báo của Scrum Master

### 7.1 Must = 82%, vượt xa trần 60%

Đây **không phải lỗi phân loại**. Khi một bản phát hành được định nghĩa là *"tất cả mọi thứ"* thì MoSCoW không còn chỗ để cắt — gần như mọi hạng mục đều thật sự cần thiết.

Hệ quả: **không còn biên an toàn về phạm vi.** Nếu chậm tiến độ thì chỉ còn một lựa chọn là lùi ngày, không cắt được gì.

Hai cách hạ Must về ngưỡng an toàn nếu PO muốn:

| Cách | Hạ cái gì xuống Should | Tiết kiệm | Must còn |
|---|---|---|---|
| **A** | US-04a/b (mở tài khoản qua app) — PO **vẫn đang dẫn khách mở tài khoản thủ công qua Zalo mỗi ngày**, giữ nguyên cách đó | 10 điểm | 76% |
| **B** | A + tách US-03a: chỉ làm Trend Template (8 điểm, Must), phần nhận diện VCP (5 điểm) để Should | 5 điểm | 73% |
| **C** | B + US-03b làm bản rút gọn: chỉ bảng đối chiếu 8 tiêu chí, chưa vẽ chú giải lên biểu đồ | 8 điểm | 68% |

### 7.2 🔴 Rủi ro lớn nhất: 20 tuần không có doanh thu và không có người dùng thật

Đây là điều em lo nhất về phương án (b), và là thứ `URS` đã ghi thành rủi ro `R3` — **kiệt sức**:

| | |
|---|---|
| Tiền phải tự bỏ ra trong 20 tuần | Máy chủ 1,2tr/tháng × 5 tháng + chi phí AI + tài khoản nhà phát triển ≈ **10–14 triệu** |
| Phản hồi từ người dùng thật | **Không có** cho tới tuần 20 |
| Nguy cơ xây sai | Cao — 20 tuần xây theo giả định, tới lúc ra mới biết khách có cần không |
| Động lực cá nhân | `GTM_PLAN` đặt mốc bán sớm chính là để **thấy tiền vào**. Bỏ mốc đó thì 5 tháng làm việc không có mốc thắng nào |

### 7.3 💡 Cách giữ nguyên quyết định của PO mà vẫn gỡ được rủi ro

**Tách hai chuyện đang bị gộp làm một: *phát hành cho người dùng* và *thu tiền*.**

Chọn (b) nghĩa là **thu tiền một lần ở tuần 20**. Nhưng nó **không bắt buộc** phải im lặng 20 tuần:

| Tuần | Việc | Thu tiền? |
|---|---|---|
| **~12** | Mời **20–30 người** trong nhóm Zalo dùng **miễn phí** phần bản giải thích 50 mã VN100 | Không |
| 12–20 | Thu phản hồi hằng tuần, sửa theo phản hồi thật thay vì theo giả định | Không |
| **~20** | Mở bán bản đầy đủ. Nhóm dùng thử 8 tuần trở thành **những người mua đầu tiên và sẵn sàng giới thiệu** | **Có** |

Không thêm một giờ công nào — phần dùng ở tuần 12 vốn đã phải xây. Chỉ là **mở cửa cho người dùng vào sớm hơn 8 tuần**.

Đúng tinh thần `GTM_PLAN` Phase 2 (beta 30 người ở tuần 7–8), chỉ dời sang tuần 12 cho khớp tiến độ thực.

---

## 8. Việc cần PO chốt

| ID | Câu hỏi | Trạng thái |
|---|---|---|
| ✅ **MSC-D1** | Một bản phát hành lớn thay vì chia R0/R1 | **PO chọn (b) — 29/07** |
| ✅ **MSC-D2** | Hoãn xây SePay, đợt đầu thu tiền thủ công | **PO chốt — 29/07** |
| ❓ **MSC-D3** | Hiểu đúng chưa: tới tuần 20 vẫn **thu tiền bằng chuyển khoản thủ công**, xây SePay khi vượt ~100 khách? | Chờ PO |
| ✅ **MSC-D4** | **PO chọn giữ nguyên Must 82%** — không hạ hạng mục nào xuống Should. ⚠️ Đồng nghĩa: chậm tiến độ thì **chỉ còn cách lùi ngày**, không cắt được phạm vi | **Chốt 29/07** |
| ✅ **MSC-D5** | **Có mở dùng thử miễn phí cho 20–30 người ở tuần 12** | **Chốt 29/07** |
| ✅ **MSC-D6** | PO **tự lo được** 10–14 triệu chi phí vận hành trong 20 tuần chưa có doanh thu | **Chốt 29/07** |
| ❓ **MSC-D7** | Nếu tuần 20 chưa xong thì **lùi ngày** hay **cắt phạm vi**? SM khuyến nghị lùi ngày | Chờ PO |
| ❓ **PAY-D2** | Chốt giá gói 3 tháng và 6 tháng | Chờ PO |

---

## 9. Ảnh hưởng tới các tài liệu khác

| Tài liệu | Cần sửa gì |
|---|---|
| `GTM_PLAN.md` | Phase 3 (tuần 9–12 mở bán early bird, doanh thu 25tr) **không còn đúng** — dời sang tuần 20–22 |
| `GTM_PLAN.md` §6 | Ngân sách 9,8tr tính cho 90 ngày; nay cần **~14tr cho 20 tuần** |
| `BUSINESS_MODEL.md` §2.2 | Bảng doanh thu 12 tháng bắt đầu từ tháng 1 — nay bắt đầu từ **tháng 5** |

---

*Hết bước 2/5 → tiếp tục `03-PRODUCT-BACKLOG.md`*
