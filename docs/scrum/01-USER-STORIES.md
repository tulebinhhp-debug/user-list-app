# 01 — USER STORIES

| | |
|---|---|
| **Bài tập** | KTS Week 2 — Day 2 · Bước 1/5 |
| **Product Owner** | Tú — *tác giả các User Story* |
| **Scrum Master** | Claude — *chuẩn hoá format, chất vấn INVEST, viết điều kiện nghiệm thu* |
| **Ngày lập** | 28/07/2026 |
| **Nguồn (BRS)** | `docs/urs_origin/URS-app-phan-tich-co-phieu-v1.0.md` + `docs/extension/*.md` |
| **Trạng thái** | ✅ **Hoàn tất 21 story** — đã rà soát INVEST và sửa xong 29/07/2026 |

---

## Persona

| Ký hiệu | Persona | Mô tả |
|---|---|---|
| **P1** | **Minh — NĐT F0** | Đầu tư < 2 năm, chưa đọc được BCTC, đang mua theo hội nhóm |
| **P2** | **Hà — NĐT có kinh nghiệm** | 5+ năm, tự đọc BCTC, dùng nhiều trường phái PTKT |
| **P3** | **Tú — PO / Môi giới / Admin** | Vận hành app, cắm ID sàn, soạn danh sách canh, quản lý hoa hồng |
| **P4** | **KOL Affiliate** | KOL tư vấn CK khác, có group Zalo riêng — *chưa dùng trong bản này, xem US-28* |

---

## Quy ước ngôn ngữ bắt buộc (áp cho MỌI story)

Ràng buộc gốc: `FR-COMP-01`, Tiêu chí chấp nhận #6 (URS), `BRK-V6`, `BM-R4`.

| ❌ Cấm tuyệt đối | ✅ Cách nói thay thế |
|---|---|
| "nên mua" / "nên bán" / "khuyến nghị mua-bán" | "đang ở giai đoạn …" · "x/4 trường phái đồng thuận tăng" |
| "VCB **sẽ** tăng" *(dự báo giá)* | "VCB **đang** tăng, đã vượt đỉnh 20 phiên với KL gấp 2.3× TB20" *(mô tả hiện trạng)* |
| "cơ hội vàng", "múc ngay" | "tín hiệu vượt mốc vừa xuất hiện lúc 10:32" |

> **Nguyên tắc:** app chỉ **mô tả hiện trạng có thể kiểm chứng**, không **dự báo** và không **ra lệnh hành động**. Người quyết định là user.

---

## Quyết định roadmap của PO (RM-D1 — chốt 28/07/2026)

**PO chọn: Cơ bản + Vĩ mô ra trước Kỹ thuật.** Lý do: *"kết hợp cơ bản và vĩ mô là điểm khác biệt với các phần mềm đang có trên thị trường"*.

Scrum Master đã tách **cảnh báo ngưỡng giá/pivot** ra khỏi **Lớp Kỹ thuật đầy đủ** — cảnh báo pivot chỉ cần dữ liệu giá (có sẵn từ M0), không cần động cơ 4 trường phái. Nhờ đó không phải đánh đổi.

| Mốc | Nội dung | Ghi chú |
|---|---|---|
| **M0** | Dữ liệu giá + pháp lý + đăng nhập | Nền móng |
| **M0.5** | **Bản giải thích viết sẵn (cơ bản + vĩ mô) cho 50 mã VN100** | Điểm khác biệt, ra sớm trong 3–4 tuần |
| **M1** | **Watchlist + pivot + cảnh báo + bộ lọc + mở TK + gói thuê bao** | Rẻ, và là lý do khách mở app mỗi ngày |
| **M2** | Chấm điểm cơ bản đầy đủ 5 trụ + bộ chỉ số theo ngành | Phần nặng của Lớp 1 |
| **M3** | Vĩ mô đầy đủ + giải thích mâu thuẫn giá–nền tảng | Hoàn chỉnh điểm khác biệt |
| **M4** | 4 trường phái PTKT + backtest + AI học pivot của PO | Phần nặng còn lại |

*Thay thế thứ tự M1/M2 trong URS gốc Phụ lục C và `URS_AMENDMENTS.md` 7.5.*

---

# EPIC 01 — Tra cứu và hiểu một cổ phiếu

> **Story gốc do PO viết:**
> *"Là 1 nhà đầu tư F0, tôi muốn khi đánh tên tìm kiếm một cổ phiếu, tôi muốn có đầy đủ thông tin về trạng thái cơ bản FA là bao nhiêu điểm, phân tích kỹ thuật báo mua hay bán, vĩ mô phải hiện lên các vấn đề liên quan đến lãi suất, GDP, lạm phát để người mới có thể dễ hiểu nhất."*

**Xử lý của Scrum Master:** ① *"báo mua hay bán"* → ngôn ngữ trung tính ✅ PO duyệt · ② tách 4 story vì trải 3 mốc ✅ PO duyệt · ③ bố cục **3 tab riêng** ✅ PO chốt · ④ *So that* = **"để tôi tự quyết định được"** ✅ PO chốt · ⑤ 🆕 phát hiện URS thiếu yêu cầu tìm kiếm → `FR-EXT-SEARCH-01`.

---

### US-01a — Tìm cổ phiếu và mở màn hình phân tích

> **As a** nhà đầu tư F0,
> **I want** gõ tên doanh nghiệp hoặc mã cổ phiếu để tìm ra mã đó và mở màn hình phân tích của nó,
> **So that** tôi vào được thông tin mình cần mà không phải nhớ chính xác mã chứng khoán.

| Persona | Mốc | Trace | Phụ thuộc |
|---|---|---|---|
| P1 | M0.5 | 🆕 `FR-EXT-SEARCH-01`, FR-WATCH-01 | Dữ liệu giá (M0) |

**Điều kiện nghiệm thu**
1. Gõ `vcb`, `VCB`, `vietcombank`, `ngoại thương` → đều ra **Vietcombank (VCB)**.
2. Gõ tiếng Việt **không dấu** vẫn ra đúng kết quả.
3. Kết quả hiện ra trong **≤ 1 giây** kể từ ký tự thứ 2.
4. Mỗi dòng kết quả hiện: mã · tên doanh nghiệp · sàn (HOSE/HNX/UPCOM) · giá hiện tại · % thay đổi.
5. Chạm vào kết quả → mở màn hình phân tích với **3 tab: Cơ bản · Kỹ thuật · Vĩ mô**.
6. Lưu và hiện lại **10 mã tìm gần nhất** khi user chưa gõ gì.
7. Mã ngoài HOSE/HNX/UPCOM → báo rõ *"Mã này không thuộc phạm vi ứng dụng"*, không trả kết quả rỗng im lặng.
8. Tab chưa tới mốc phát hành → hiện *"Sắp có"* kèm nút đăng ký nhận thông báo, **không hiện tab trống**.

---

### US-01b — Tab Cơ bản: doanh nghiệp này khoẻ bao nhiêu điểm

> **As a** nhà đầu tư F0,
> **I want** mở tab Cơ bản là thấy một điểm số 0–100 cho doanh nghiệp và biết điểm đó đến từ đâu,
> **So that** tôi tự đánh giá được doanh nghiệp mà không cần biết đọc báo cáo tài chính.

| Persona | Mốc | Trace | Phụ thuộc |
|---|---|---|---|
| P1 | M2 *(bản diễn giải rút gọn có sớm ở M0.5 qua US-05a)* | FR-FUND-01, 02, 06, 09, FR-UI-02 | US-01a, pipeline BCTC |

**Điều kiện nghiệm thu**
1. Hiện điểm tổng **0–100** và điểm của **5 trụ**: Sinh lời · Tăng trưởng · Sức khoẻ tài chính · Chất lượng lợi nhuận · Định giá.
2. Chạm vào 1 trụ → mở danh sách chỉ số cấu thành + giá trị cụ thể + giải thích 1 câu chỉ số đó nghĩa là gì.
3. Điểm số **do công thức tính**, chạy lại 2 lần trên cùng dữ liệu ra kết quả giống hệt (FR-FUND-06).
4. Mã thiếu dữ liệu → hiện **"Không đủ căn cứ chấm điểm"** kèm lý do, **tuyệt đối không chấm bừa** (FR-FUND-09).
5. Có nhãn thời điểm dữ liệu: *"Theo BCTC quý II/2026, công bố 28/07/2026"*.

---

### US-01c — Tab Vĩ mô: chuyện bên ngoài đang tác động thế nào

> **As a** nhà đầu tư F0,
> **I want** mở tab Vĩ mô là thấy lãi suất, GDP, lạm phát… đang tác động **thuận lợi hay bất lợi** cho riêng mã này,
> **So that** tôi tự hiểu được vì sao giá đang diễn biến như vậy, thay vì chỉ nghe đồn trong group.

| Persona | Mốc | Trace | Phụ thuộc |
|---|---|---|---|
| P1 | M3 | FR-MACRO-01..07, D16 | US-01a, US-01b |

**Điều kiện nghiệm thu**
1. Chia 2 cột rõ ràng: **Đang thuận lợi** / **Đang bất lợi**, mỗi yếu tố kèm mức độ tác động.
2. Bắt buộc có tối thiểu 4 nhóm: lãi suất · tỷ giá · lạm phát/CPI · GDP & tăng trưởng ngành.
3. Mỗi yếu tố nêu **con số thật + hướng thay đổi**, ví dụ *"Lãi suất điều hành 4.5%, giảm 0.5đ trong 6 tháng → thuận lợi cho ngân hàng"* — không nói chung chung.
4. Khi điểm Cơ bản cao mà giá đang giảm (hoặc ngược lại) → hiện mục **"Giải thích mâu thuẫn"** dựa trên dữ kiện vĩ mô (Tiêu chí chấp nhận #5 của URS).
5. Ngôn ngữ F0 hiểu được, mỗi thuật ngữ vĩ mô có chú giải khi chạm.

---

### US-01d — Tab Kỹ thuật: cổ phiếu đang tăng hay đang giảm

> **As a** nhà đầu tư F0,
> **I want** mở tab Kỹ thuật là thấy ngay cổ phiếu **đang** tăng hay **đang** giảm, đang ở giai đoạn nào, và mấy trường phái đang đồng thuận,
> **So that** tôi tự quyết định được thời điểm của mình, không phải hỏi trong group Zalo.

| Persona | Mốc | Trace | Phụ thuộc |
|---|---|---|---|
| P1 | M4 | FR-TECH-01..05, FR-COMP-01, FR-COMP-02, FR-UI-02/04 | US-01a, giá điều chỉnh |

**Điều kiện nghiệm thu**
1. Dòng đầu là kết luận 1 câu tiếng Việt thường: *"VCB đang trong giai đoạn tăng giá (Stage 2), 3/4 trường phái đồng thuận tăng."*
2. Hiện **thước Đồng thuận** `x/4`; trái chiều → cảnh báo *"Tín hiệu đang mâu thuẫn"*.
3. Hiện **giai đoạn hiện tại** kèm căn cứ (giá so với MA, KL so với trung bình, nền tích luỹ bao nhiêu phiên).
4. 🔴 Quét toàn bộ text màn hình → không chứa "nên mua", "nên bán", "khuyến nghị", "sẽ tăng", "sẽ giảm".
5. Mọi câu ở thì hiện tại/quá khứ (mô tả), không có câu dự báo giá tương lai.
6. Chạm thuật ngữ (Stage 2, MA50, breakout…) → chú giải ngay tại chỗ.
7. Cuối tab luôn có tuyên bố miễn trừ (FR-COMP-02).

---

# EPIC 02 — Danh sách canh và cảnh báo vượt mốc

> **Story gốc do PO viết:**
> *"Tôi là một nhà đầu tư F0, tôi muốn tạo ra một watchlist theo dõi những cổ phiếu từ ngày hôm trước, tôi muốn setup những cảnh báo điểm pivot, nếu cổ phiếu break tăng vượt qua điểm cảnh báo thì phải báo cho tôi."*
>
> **PO làm rõ thêm:** *"Anh có thói quen lọc mã, đánh dấu để mai canh. App sẽ cập nhật các mã này và nếu break lên thì **các khách hàng đều nhận được thông báo** trong phiên và quyết định. Điểm pivot là điểm anh sẽ xác định, sau 1 thời gian hệ thống sẽ ghi lại và học cách anh setup điểm pivot để có thể tự động làm theo. Thủng đáy thì nên cảnh báo. Báo cả 2 nhưng gắn nhãn phân biệt."*

**Xử lý của Scrum Master:**
- 🔴 Làm rõ này **đổi bản chất tính năng**: không phải watchlist cá nhân, mà là **kênh phát tín hiệu một-tới-nhiều từ môi giới tới khách hàng**. Rủi ro pháp lý cao nhất dự án → xem `LEGAL-01`.
- Tách **4 story**: PO soạn danh sách (P3) · khách nhận thông báo (P1) · user tự đặt cảnh báo riêng (P1) · AI học pivot (M4).
- Cảnh báo pivot **không phụ thuộc Lớp Kỹ thuật** → làm được sớm ở M1 dù PTKT đầy đủ ở M4.
- Ghi log bối cảnh pivot **ngay từ story đầu tiên**, nếu không thì M4 không có dữ liệu để học.

---

### US-02a — PO soạn danh sách canh và đặt điểm pivot sau giờ đóng cửa

> **As a** môi giới kiêm người vận hành ứng dụng,
> **I want** sau phiên chiều ngồi lọc mã, đưa vào danh sách canh cho ngày mai và tự tay đặt mức pivot cho từng mã,
> **So that** buổi tối tôi làm việc một lần, hôm sau hệ thống canh giúp toàn bộ khách hàng thay vì tôi phải ngồi nhìn bảng cả phiên.

| Persona | Mốc | Trace | Phụ thuộc |
|---|---|---|---|
| P3 | M1 | 🆕 `FR-EXT-SIGNAL-01..03`, FR-ALERT-02 | Dữ liệu giá (M0) |

**Điều kiện nghiệm thu**
1. Màn hình quản trị: thêm/xoá mã khỏi **Danh sách canh ngày mai**, có ghi chú riêng cho từng mã.
2. Với mỗi mã, PO nhập **mức pivot lên** và/hoặc **mức pivot xuống** (nhập số tuyệt đối).
3. Đặt được **hiệu lực**: chỉ phiên mai · tới khi huỷ · tự huỷ sau N phiên.
4. Xem lại lịch sử: mã nào đã đặt mức nào, ngày nào, đã kích hoạt chưa.
5. 🔴 **Ghi log bối cảnh tại thời điểm đặt** — bắt buộc từ story đầu tiên, phục vụ US-02d: giá, KL, MA20/50, vị trí so với đỉnh–đáy 20/50 phiên, ngành, ghi chú của PO.
6. 🔴 Ghi mốc thời gian đặt + mốc thời gian gửi thông báo, **không sửa được về sau** (append-only).
7. Thao tác soạn 20 mã hoàn tất trong **≤ 15 phút**.

---

### US-02b — Khách hàng nhận thông báo khi mã vượt mốc trong phiên

> **As a** nhà đầu tư đã mở tài khoản chứng khoán qua ứng dụng,
> **I want** nhận thông báo ngay trong phiên khi một mã trong danh sách canh vượt lên trên hoặc thủng xuống dưới mức đã đặt, kèm thông tin khối lượng có xác nhận hay không,
> **So that** tôi kịp tự đưa ra quyết định của mình mà không phải ngồi nhìn bảng điện cả ngày.

| Persona | Mốc | Trace | Phụ thuộc |
|---|---|---|---|
| P1 | M1 | FR-ALERT-06, 08, 09, 10, NFR-01, `FR-EXT-COMP-02/03` | US-02a, **US-04a/b** |

**Điều kiện nghiệm thu**

**A. Ai được nhận** *(PO chốt 29/07: chỉ khách đã mở TK qua ID của PO)*
1. 🔑 Chỉ gửi cho người dùng **đã được duyệt gắn broker_id của PO** ở US-04b. Người dùng khác **không nhận**.
2. Người chưa mở TK thấy màn giới thiệu: *"Thông báo theo dõi mức giá dành cho khách hàng đã mở tài khoản qua ứng dụng"* + nút dẫn sang US-04a — **không hé lộ nội dung tín hiệu**.
3. Người dùng gỡ liên kết broker_id → **ngừng nhận ngay từ phiên kế tiếp**.

**B. Nội dung và thời điểm**
4. Độ trễ ≤ **60 giây** từ lúc giá thoả điều kiện tới lúc push đến máy — đo trên **≥ 20 lần thử thực tế**.
5. Báo **cả hai chiều**: vượt lên trên mức trên · thủng xuống dưới mức dưới. *(PO chốt)*
6. 🏷️ **Gắn nhãn khối lượng** *(PO chốt phương án c)*:
   - KL ≥ 1.5× TB20 → *"Vượt 92.000 lúc 10:32 — khối lượng gấp 2.3× trung bình 20 phiên"*
   - KL < 1.5× TB20 → *"Vượt 92.000 lúc 10:32 — **khối lượng chưa xác nhận**"*
7. Nội dung nêu rõ **điều kiện nào đã kích hoạt** (FR-ALERT-08).
8. Không phát lại cùng tín hiệu, cùng mã, cùng phiên (FR-ALERT-09).
9. Mọi tính toán dùng **giá điều chỉnh** (D26) — mã vừa chia tách không được sinh tín hiệu giả.

**C. Ràng buộc pháp lý**
10. 🔴 Mọi thông báo mang nhãn cố định: *"Mức giá do [tên môi giới] theo dõi. Đây là thông tin, không phải khuyến nghị. Bạn tự quyết định."*
11. 🔴 Nội dung **không** chứa: mua/bán · số lượng · tỷ trọng · giá mục tiêu · thời hạn nắm giữ.
12. Từ thông báo **không có đường tắt đặt lệnh** (`FR-EXT-COMP-03`).
13. Lưu vết ai nhận, lúc nào — không sửa được, phục vụ đối chiếu pháp lý.

**D. Vận hành**
14. User bật/tắt được nguồn thông báo này và xem lại lịch sử đã nhận.
15. Fan-out tới **≥ 700 thiết bị** vẫn giữ được ngưỡng 60 giây.

---

### US-02c — Nhà đầu tư tự tạo danh sách và tự đặt cảnh báo riêng

> **As a** nhà đầu tư F0,
> **I want** tự tạo danh sách theo dõi của riêng mình và tự đặt mức giá muốn được báo,
> **So that** tôi theo dõi được cả những mã tôi quan tâm mà không có trong danh sách canh của anh Tú.

| Persona | Mốc | Trace | Phụ thuộc |
|---|---|---|---|
| P1 | M1 | FR-WATCH-01, 02, FR-ALERT-02, 05 | US-01a, **US-06b** *(giới hạn theo gói cần hệ thống gói)* |

**Điều kiện nghiệm thu**
1. Tạo / đổi tên / xoá danh sách; thêm–xoá mã.
2. Giới hạn theo gói: Free 1 danh sách × 5 mã · Pro 5 × 30 · Premium 20 × 100.
3. Đặt cảnh báo ngưỡng giá lên/xuống cho từng mã, số lượng cảnh báo theo gói (Free 3 · Pro 20 · Premium 100).
4. Đồng bộ theo tài khoản, đăng nhập máy khác thấy đúng dữ liệu trong ≤ 10 giây.
5. Phân biệt rõ trên giao diện: **cảnh báo của tôi** vs **danh sách canh của anh Tú**.

---

### US-02d — Hệ thống học cách PO đặt pivot

> **As a** môi giới kiêm người vận hành ứng dụng,
> **I want** hệ thống học từ lịch sử các mức pivot tôi từng đặt và kết quả thực tế của chúng, rồi tự gợi ý mức pivot cho những mã tương tự,
> **So that** kinh nghiệm của tôi được nhân bản, tôi không phải ngồi soạn tay mỗi tối khi số mã và số khách tăng lên.

| Persona | Mốc | Trace | Phụ thuộc |
|---|---|---|---|
| P3 | M4 | 🆕 `FR-EXT-SIGNAL-04..06`, FR-BT-03, D20 | **US-02a phải ghi log từ M1** |

**Điều kiện nghiệm thu**
1. Mỗi mức pivot đã đặt được **chấm điểm kết quả thực tế** sau 5/10/20 phiên (đúng hướng bao nhiêu %, biên độ trung bình).
2. Hệ thống chỉ bắt đầu gợi ý khi có **tối thiểu 200 mẫu** đã có kết quả — dưới ngưỡng thì nói rõ *"chưa đủ dữ liệu"*.
3. Gợi ý luôn ở dạng **đề xuất chờ PO duyệt**, không tự động phát ra cho khách hàng.
4. Mỗi gợi ý nêu căn cứ: *"Dựa trên 37 lần anh đặt pivot ở tình huống tương tự, tỷ lệ đúng 62%"*.
5. Công khai tỷ lệ đúng của **cả pivot do PO đặt và pivot do hệ thống gợi ý**, hiển thị cho người dùng (`FR-BT-03`).
6. PO tắt được hoàn toàn tính năng gợi ý.

---

# EPIC 03 — Bộ lọc cổ phiếu theo phong cách Minervini

> **Story gốc do PO viết:**
> *"Là một nhà đầu tư mới, anh cũng muốn có một watchlist với phong cách của Mark Minervini tìm ra các cổ phiếu mạnh mà đang có trạng thái tích luỹ cạn kiệt VCP trong vòng từ 2–4 tuần, dựa vào các chỉ số template của Minervini cho F0. Còn với những người có kinh nghiệm như anh hoặc người có nhiều kinh nghiệm thì sẽ có thể có watchlist riêng tự lọc cổ phiếu."*
>
> **PO làm rõ thêm:** *"RS Rating toàn bộ thị trường. Bình quân khối lượng tạo ra các bộ lọc phù hợp. Lần co cuối <10%, tối thiểu 2 lần co, tối đa 3–5 lần. Khối lượng linh động nhưng nhìn chung giảm dần, cạn kiệt <60% trung bình 20 phiên thì tốt. Để cho user tự chạy. Lọc xong user bấm vào phải ra được biểu đồ để họ hiểu vì sao mã này đẹp. Với anh Hà thì gõ bằng tiếng Việt cho AI dịch, kết hợp 10 bộ lọc dựng sẵn."*

**Xử lý của Scrum Master:**
- 🆕 `GAP-03`: URS **không có bộ lọc cổ phiếu**. `FR-TECH-01` chỉ phân tích *một mã đã chọn*, không có cơ chế **quét thị trường để tìm mã** → bổ sung `FR-EXT-SCREEN-01..06`.
- ✅ **Rủi ro pháp lý giảm mạnh**: PO chốt *user tự chạy bộ lọc* → công cụ, không phải danh sách gợi ý từ môi giới. `LEGAL-01` chỉ còn áp cho US-02b.
- ✅ PO đã cho **ngưỡng đo được** → VCP làm bằng **luật cứng**, không cần học máy, làm được ngay ở M1.
- Tách **3 story**: bộ lọc dựng sẵn (P1) · biểu đồ giải thích (P1) · tự dựng bộ lọc (P2).
- 🏗️ Ràng buộc kiến trúc: mỗi tiêu chí lọc là **một khối cắm-thêm-được**; thêm bộ lọc mới không được sửa khối cũ.
- Chuỗi vận hành: **US-03a lọc → US-03b xem biểu đồ → US-02a PO đặt pivot → US-02b khách nhận báo → US-02d máy học lại.**

---

### US-03a — Bộ lọc Minervini dựng sẵn cho người mới

> **As a** nhà đầu tư F0,
> **I want** bấm một nút để hệ thống quét toàn thị trường và trả về những cổ phiếu vừa mạnh vừa đang nén biên độ theo tiêu chuẩn Minervini,
> **So that** tôi tự tìm được cổ phiếu đáng chú ý mà không cần biết đọc đồ thị hay nhớ tám tiêu chí là gì.

| Persona | Mốc | Trace | Phụ thuộc |
|---|---|---|---|
| P1 | M1 | 🆕 `FR-EXT-SCREEN-01..03`, FR-TECH-01 | Dữ liệu giá + lịch sử ≥ 15 tháng (M0) |

**Điều kiện nghiệm thu**

**A. Trend Template — 8 tiêu chí (đạt đủ 8 mới vào kết quả)**
> 🔴 **Toàn bộ tính toán trong story này dùng giá điều chỉnh** (D26, FR-DATA-04). Tính trên giá thô thì mã vừa chia tách sẽ bị loại oan hoặc lọt oan.

1. Giá > MA150 và > MA200
2. MA150 > MA200
3. MA200 đi lên liên tục ≥ 1 tháng
4. MA50 > MA150 và > MA200
5. Giá > MA50
6. Giá cao hơn đáy 52 tuần ≥ 30%
7. Giá nằm trong phạm vi 25% so với đỉnh 52 tuần
8. **RS Rating ≥ 70**

**B. RS Rating** *(PO chốt: xếp hạng trên toàn thị trường)*
9. Tính theo tỷ suất sinh lời có trọng số `40%×3T + 20%×6T + 20%×9T + 20%×12T`, rồi xếp phần trăm trên **toàn bộ HOSE + HNX + UPCOM**.
10. Tính lại **mỗi ngày sau giờ đóng cửa**; mã chưa đủ 12 tháng lịch sử → loại và ghi rõ lý do.
11. Thanh khoản **không dùng để giới hạn tập xếp hạng**, mà là **một tiêu chí lọc riêng** user bật/tắt được (mặc định: GTGD bình quân 20 phiên ≥ 5 tỷ). *(PO chốt)*

**C. VCP — tích luỹ cạn kiệt 2–4 tuần** *(theo ngưỡng PO chốt)*
12. Nền giá trong **2–4 tuần** gần nhất có **tối thiểu 2, tối đa 5 lần co biên độ**.
13. Mỗi lần co **hẹp hơn lần liền trước**; lần co cuối cùng có biên độ **< 10%**.
14. Khối lượng **xu hướng giảm dần** qua các lần co.
15. Nếu KL trung bình 5 phiên cuối **< 60% KL trung bình 20 phiên** → gắn nhãn 🔥 **"Cạn kiệt"** *(điểm cộng, không phải điều kiện bắt buộc)*.
16. Hệ thống tính sẵn **điểm pivot đề xuất** = đỉnh của lần co cuối cùng → dùng lại được ở US-02a.

**D. Kết quả và vận hành** *(PO chốt 29/07: tính sẵn theo ngày, không quét theo lượt bấm)*
17. 🔑 Hệ thống **quét toàn thị trường một lần sau giờ đóng cửa** và lưu kết quả của ngày đó. Khách bấm là **đọc kết quả có sẵn**, trả về **≤ 1 giây**, không phụ thuộc bao nhiêu người cùng bấm.
18. Kết quả có **nhãn ngày**: *"Kết quả lọc phiên 28/07/2026"*. Trong phiên **không tính lại**; muốn xem cập nhật thì đợi sau giờ đóng cửa.
19. Quét toàn bộ ~1.700 mã hoàn tất trong **≤ 10 phút** ở tác vụ nền; kết quả kỳ vọng 10–50 mã.
20. Giữ **kết quả lọc của 90 ngày gần nhất** để xem lại và để chấm điểm độ chính xác sau này (nối sang US-02d).
21. Mỗi dòng kết quả: mã · tên · RS Rating · số lần co · biên độ lần co cuối · nhãn Cạn kiệt · pivot đề xuất.
22. Sắp xếp mặc định theo **RS Rating giảm dần**, đổi được cột sắp xếp.
23. Kết quả rỗng → nói rõ *"Hiện không có mã nào đạt đủ tiêu chí"* + gợi ý nới tiêu chí nào, **không hiển thị màn hình trống**.
24. Thêm cả rổ kết quả vào watchlist bằng một thao tác.
25. 🔴 Không có chữ nào thuộc danh sách cấm ở Quy ước ngôn ngữ; nhãn dùng là *"đạt tiêu chí"*, không phải *"nên mua"*.
26. 🏗️ Mỗi tiêu chí là một khối độc lập, bật/tắt được, thêm tiêu chí mới không phải sửa khối cũ.

---

### US-03b — Biểu đồ giải thích vì sao mã này lọt bộ lọc

> **As a** nhà đầu tư F0,
> **I want** bấm vào một mã trong kết quả lọc là thấy ngay biểu đồ có đánh dấu rõ các lần co biên độ, đường trung bình và mức pivot,
> **So that** tôi hiểu được vì sao mã này được coi là đẹp, và dần dần tự nhìn ra được mà không cần bộ lọc.

| Persona | Mốc | Trace | Phụ thuộc |
|---|---|---|---|
| P1 | M1 | 🆕 `FR-EXT-SCREEN-04`, FR-TECH-05, Tiêu chí chấp nhận #2 (URS) | US-03a |

**Điều kiện nghiệm thu**
1. Bấm 1 lần từ kết quả lọc → mở biểu đồ giá–khối lượng, không qua màn trung gian.
2. Trên biểu đồ **vẽ chú giải trực quan**: từng lần co được tô vùng và đánh số ①②③ kèm biên độ %; đường MA50/150/200; **mức pivot đề xuất** vẽ nét đứt ngang.
3. Khối lượng có dải tham chiếu TB20; phiên nào < 60% TB20 được tô khác màu.
4. Bên dưới biểu đồ là **bảng đối chiếu 8 tiêu chí Trend Template**, mỗi dòng ✅/❌ kèm **giá trị thật** (ví dụ *"Giá 92.3 > MA200 78.5 ✅"*).
5. Có một đoạn giải thích ≤ 3 câu bằng tiếng Việt thường, dựa trên số liệu đã tính — **không phải do AI bịa** (FR-FUND-06).
6. Chạm vào mọi thuật ngữ đều có chú giải tại chỗ (MA200, RS Rating, VCP, pivot).
7. Zoom, đổi khung thời gian, bật/tắt từng chú giải.
8. Từ biểu đồ thêm thẳng vào watchlist hoặc đặt cảnh báo tại mức pivot (nối sang US-02c).

---

### US-03c — Nhà đầu tư kinh nghiệm tự dựng bộ lọc

> **As a** nhà đầu tư có kinh nghiệm,
> **I want** gõ tiêu chí lọc của riêng tôi bằng tiếng Việt, hoặc bắt đầu từ một bộ lọc mẫu rồi sửa lại, và lưu để chạy lại mỗi ngày,
> **So that** tôi dùng được đúng cách đánh của mình chứ không bị bó vào một trường phái duy nhất.

| Persona | Mốc | Trace | Phụ thuộc |
|---|---|---|---|
| P2 | M3 | 🆕 `FR-EXT-SCREEN-05..06`, FR-EXT-BT-01, FR-UI-03 | US-03a |

**Điều kiện nghiệm thu**
1. Có **10 bộ lọc dựng sẵn** để chọn và sửa: Minervini Trend Template · CANSLIM · Wyckoff tích luỹ · Breakout khối lượng · Giá trị (P/E, P/B thấp) · Cổ tức cao · Tăng trưởng lợi nhuận · Sức mạnh giá tương đối · Vượt đỉnh 52 tuần · Quá bán RSI. *(PO chốt)*
2. Gõ tiếng Việt tự nhiên → AI dịch thành bộ điều kiện, ví dụ *"cổ phiếu ngân hàng có ROE trên 18% và giá vượt MA50 trong 5 phiên gần đây"*. *(PO chốt)*
3. 🔴 AI **hiển thị lại bộ điều kiện đã hiểu** để user xác nhận **trước khi chạy** — không tự chạy ngầm.
4. Điều kiện nào AI không dịch được → nói rõ *"chưa hỗ trợ tiêu chí này"*, không bỏ qua im lặng.
5. Lưu bộ lọc kèm tên, chạy lại bất cứ lúc nào, chỉnh sửa và nhân bản được.
6. Đặt lịch chạy tự động sau giờ đóng cửa và gửi kết quả qua thông báo.
7. Số bộ lọc lưu được giới hạn theo gói (Free 0 · Pro 3 · Premium 10 · Premium AI không giới hạn).

---

# EPIC 04 — Mở tài khoản chứng khoán qua app

> **PO đặt vấn đề:** *"Mở TK CK qua app thì tặng Premium là thế nào, story này có thể làm được hả em, nếu vậy thì cho anh cái này vào."*
>
> **PO chốt:** *"Anh tặng 1 tháng thôi. Anh tự đối soát được mã khách hàng, nếu khách điền đúng thì anh sẽ duyệt họ vào. Tài khoản của khách phải có tối thiểu 150tr mới oki."*

**Xử lý của Scrum Master:**
- Đây là **nguồn doanh thu chính (~55%)** của mô hình. Rẻ về kỹ thuật, khó ở khâu chính sách với sàn.
- ✅ PO chốt **đối soát thủ công** → bản đầu **không cần broker API**.
- ⚠️ **Sửa 29/07:** dời từ M0 sang **M1**. Lý do: không thể "mở khoá Premium" khi hệ thống gói (US-06b) chưa tồn tại.
- 🔒 App **không lưu số dư/NAV của khách** — PO đối soát trên cổng của sàn, app chỉ ghi kết quả duyệt. Giảm rủi ro dữ liệu cá nhân.
- ⚠️ Điều kiện 150tr **phải công bố trước** khi khách bấm mở TK.
- 💰 Kinh tế: 1 tháng Premium ≈ 40k chi phí · hoàn vốn sau ~1,5 lệnh cỡ 100tr.
- 📉 `BIZ-01`: tệp mục tiêu thu hẹp (người có ≥150tr, không phải F0 mới) → cần chỉnh lại dự báo doanh thu trong `BUSINESS_MODEL` và `PRICING_TIERS`.
- Tách **2 story**: khách mở TK và nhận thưởng (P1) · PO đối soát và duyệt (P3).

---

### US-04a — Mở tài khoản chứng khoán qua app và nhận Premium

> **As a** nhà đầu tư đang dùng bản miễn phí,
> **I want** mở tài khoản chứng khoán ngay từ trong app và được tặng 1 tháng Premium,
> **So that** tôi có chỗ giao dịch và dùng thử được đầy đủ tính năng mà không phải trả tiền trước khi biết app có hợp với mình không.

| Persona | Mốc | Trace | Phụ thuộc |
|---|---|---|---|
| P1 | **M1** | FR-EXT-REF-01..07, FR-EXT-PRICING-01, FR-EXT-COMP-02, FR-EXT-BRK-01..03 | US-06a, US-06b, `BRK-V5` (sàn cho phép mã giới thiệu từ app ngoài) |

**Điều kiện nghiệm thu**
1. Nút *"Mở tài khoản chứng khoán — nhận 1 tháng Premium"* hiện ở onboarding và ở màn hình chính của bản Free.
2. Chọn sàn từ danh sách sàn PO đang cắm ID; **danh sách này cấu hình được**, thêm/bớt sàn không phải phát hành lại app (FR-EXT-BRK-01).
3. 🔴 **Trước khi bấm mở TK**, hiển thị và bắt xác nhận 2 điều:
   - *"Chủ ứng dụng nhận hoa hồng khi bạn giao dịch qua ID này"* (FR-EXT-COMP-02)
   - *"Điều kiện nhận Premium: tài khoản có tối thiểu 150 triệu"* — **nói trước, không nói sau khi từ chối**
4. Bấm xác nhận → mở link sang trang mở TK của sàn, có gắn mã giới thiệu của PO. App **không thu thập** giấy tờ hay thông tin định danh của khách.
5. Quay lại app có ô nhập **số tài khoản + sàn** để gửi yêu cầu xác nhận.
6. Trạng thái luôn rõ ràng: *Đang chờ duyệt* · *Đã duyệt* · *Bị từ chối kèm lý do*.
7. Được duyệt → tự động bật Premium **1 tháng**, hiện thông báo kèm **ngày hết hạn cụ thể**.
8. Nhắc trước khi hết hạn **7 ngày và 1 ngày**.
9. Hết hạn → tự về Free, **không tự động trừ tiền**, **không xoá** watchlist/danh mục đã tạo.
10. Bị từ chối vì chưa đủ điều kiện → thông báo lịch sự, nêu rõ thiếu gì, và **cho phép nộp lại sau**.
11. Trong Cài đặt luôn xem được tài khoản đang gắn ID nào, và **gỡ liên kết được**.

---

### US-04b — PO đối soát và duyệt yêu cầu

> **As a** môi giới kiêm người vận hành ứng dụng,
> **I want** xem danh sách yêu cầu đang chờ, đối chiếu với sổ khách hàng của tôi trên cổng của sàn, rồi bấm duyệt hoặc từ chối kèm lý do,
> **So that** chỉ khách thật sự mở tài khoản dưới ID của tôi mới được nhận ưu đãi, và tôi không bị lạm dụng.

| Persona | Mốc | Trace | Phụ thuộc |
|---|---|---|---|
| P3 | **M1** | FR-EXT-REF-05, 06, FR-EXT-BRK-03, FR-EXT-COM-05, FR-EXT-COMP-05 | US-04a |

**Điều kiện nghiệm thu**
1. Màn hình quản trị: danh sách yêu cầu chờ duyệt, mỗi dòng gồm người dùng · số TK · sàn · thời điểm gửi · số ngày đã chờ.
2. 🔒 App **không lưu và không hiển thị số dư/NAV** của khách. PO đối soát ngoài app; app chỉ ghi **kết quả**.
3. Thao tác: **Duyệt** / **Từ chối** kèm lý do chuẩn hoá — *số TK không khớp* · *TK không thuộc ID của tôi* · *chưa đạt mức tối thiểu 150tr* · *số TK đã dùng rồi*.
4. Duyệt xong hệ thống **tự động** bật Premium 1 tháng và gửi thông báo cho khách — PO không phải thao tác thêm.
5. Chống gian lận: **một số tài khoản chỉ được dùng một lần** trên toàn hệ thống.
6. 🔴 Nhật ký **không sửa được** (append-only): ai duyệt, lúc nào, lý do gì — phục vụ đối chiếu pháp lý (FR-EXT-COMP-05).
7. Thống kê cho PO: số yêu cầu · tỷ lệ duyệt · số TK đã gắn, chia theo sàn và theo tháng.
8. Mục tiêu xử lý **≤ 24 giờ làm việc**; yêu cầu quá hạn được đánh dấu nổi bật.
9. Xử lý hàng loạt: duyệt nhiều yêu cầu cùng lúc sau khi đã đối soát.

---

# EPIC 05 — Bản giải thích viết sẵn cho từng mã

> **PO đặt vấn đề:** *"Chi phí này thì anh thấy nó hơi bị nhiều. Nếu mình cho vào mà giới hạn câu hỏi thì người ta sẽ không happy đâu."*
>
> **PO chốt (AI-D1):** *"Làm bản chat giải thích viết sẵn."*

**Quyết định `AI-D1` — chốt 28/07/2026:** **Bỏ chat hỏi–đáp mở. Thay bằng bản giải thích do AI viết sẵn, mỗi mã một lần mỗi ngày, dùng chung cho mọi người dùng.**

| | Chat mở *(phương án bị loại)* | Viết sẵn *(phương án chốt)* |
|---|---|---|
| Chi phí | Tăng theo số khách × số câu hỏi | **Cố định** ~250–400k/tháng cho 50 mã |
| Giới hạn với khách | Phải chặn 3–100 câu/ngày tuỳ gói | **Không giới hạn** — đọc bao nhiêu lần cũng được |
| Rủi ro AI nói bậy | Mỗi câu trả lời là một lần rủi ro mới | Quét được **trước khi phát**, gỡ được |

**Hệ quả cần xử lý:**
- `FR-EXT-AI-01, 05, 06, 08, 09, 10` (chat, ngữ cảnh, lịch sử, hạn mức, giọng nói) → **Won't**.
- `FR-EXT-AI-02, 03, 04, 07` (trích dẫn, số do code tính, miễn trừ, rào chắn) → **giữ nguyên**, áp cho bản viết sẵn.
- 📉 `BIZ-02`: gói **Premium AI 3.590k/năm** mất lý do tồn tại → `PRICING_TIERS` còn 3 gói, cần chỉnh lại.
- 📉 `BIZ-03`: `GTM_PLAN` §1.2 quảng cáo *"Hỏi AI bất kỳ câu nào"* → viết lại thành *"Mỗi cổ phiếu đều có phần giải thích bằng tiếng Việt, kèm nguồn trích dẫn"*.

---

### US-05a — Đọc phần giải thích của một cổ phiếu

> **As a** nhà đầu tư F0,
> **I want** mở một mã ra là có sẵn đoạn giải thích bằng tiếng Việt nói doanh nghiệp đang thế nào và vì sao giá đang diễn biến như vậy, đọc bao nhiêu lần cũng được,
> **So that** tôi hiểu được tình hình mà không cần biết đọc báo cáo tài chính, và không bị chặn lại vì hết lượt.

| Persona | Mốc | Trace | Phụ thuộc |
|---|---|---|---|
| P1 | M0.5 | `FR-EXT-AI-02/03/04`, FR-FUND-05, FR-FUND-06, FR-COMP-01/02 | US-01a, US-05b |

**Điều kiện nghiệm thu**
1. Mở màn hình phân tích của mã → phần giải thích hiện ngay ở trên cùng, **≤ 200 từ**, tiếng Việt thường, không thuật ngữ khó.
2. Nội dung gồm 3 phần: **doanh nghiệp đang thế nào** · **giá đang diễn biến ra sao** · **dữ kiện nào có thể liên quan** (vĩ mô, ngành, khối ngoại).
3. Khi điểm cơ bản tốt mà giá giảm (hoặc ngược lại) → có riêng một đoạn **giải thích mâu thuẫn** dựa trên dữ kiện.
4. 🔴 **Mọi con số trong bài do code tính** — đối chiếu 20 bản mẫu với giá trị trong kho dữ liệu, phải khớp 100% (FR-FUND-06).
5. Cuối bài có **danh sách nguồn** kèm số trang: *"BCTC Q2/2026 tr.12 · Thống kê khối ngoại HOSE 01–28/07"*; bấm vào mở đúng trang PDF gốc (FR-FUND-05).
6. Có **nhãn thời điểm**: *"Cập nhật 07:15 ngày 28/07/2026"*.
7. **Không giới hạn số lần đọc, không phân biệt gói** — Free cũng đọc được đầy đủ. *(PO chốt)*
8. Mã chưa có bản giải thích → nói rõ *"Mã này chưa có trong phạm vi phân tích"*, **không hiện bản cũ như bản mới** (NFR-10), không để trống.
9. Chạm vào thuật ngữ bất kỳ → chú giải tại chỗ.
10. Cuối bài luôn có tuyên bố miễn trừ (FR-COMP-02).

---

### US-05b — Hệ thống viết và kiểm duyệt bản giải thích hằng ngày

> **As a** người vận hành ứng dụng,
> **I want** hệ thống tự viết lại phần giải thích cho từng mã khi có dữ liệu mới, tự chặn những câu vi phạm trước khi phát, và cho tôi gỡ bất kỳ bản nào chỉ bằng một thao tác,
> **So that** chi phí AI của tôi cố định và tôi không bao giờ để lọt một câu có thể bị coi là khuyến nghị đầu tư.

| Persona | Mốc | Trace | Phụ thuộc |
|---|---|---|---|
| P3 | M0.5 | `FR-EXT-AI-07`, `FR-EXT-COMP-05`, FR-FUND-04/05/06, NFR-11 | Dữ liệu BCTC 50 mã VN100 |

**Điều kiện nghiệm thu**

**A. Phạm vi và chi phí**
1. Bản đầu phủ **50 mã VN100**; danh sách mã cấu hình được, mở rộng dần không phải sửa code.
2. 💰 **Chỉ viết lại khi có lý do**, tối đa **1 lần/ngày/mã**:
   - có BCTC/BCTN mới · hoặc giá biến động ≥ 5% một phiên hoặc ≥ 10% trong 5 phiên · hoặc có sự kiện vĩ mô ảnh hưởng ngành · hoặc đã quá 5 phiên chưa cập nhật
3. Áp dụng **cache khung hướng dẫn** và **gọi theo lô** (Phụ lục B URS) — chi phí thực tế **≤ 400.000đ/tháng**, đo và báo cáo hằng tháng.
4. Chi phí **không tăng theo số người dùng** — 300 hay 3.000 khách vẫn như nhau.

**B. Rào chắn — chạy tự động trước khi phát**
5. 🔴 Quét từ cấm, **chặn phát nếu dính**: "nên mua", "nên bán", "khuyến nghị", "sẽ tăng", "sẽ giảm", "mục tiêu giá", "cắt lỗ tại", "múc", "gom".
6. 🔴 **Đối chiếu số**: mọi con số trong bài phải khớp với giá trị trong kho; lệch một con số → **chặn phát**, ghi lỗi, giữ bản cũ kèm nhãn thời điểm cũ.
7. Câu nào không truy được về nguồn → cắt bỏ, không phát.
8. Bản bị chặn được đưa vào hàng chờ để PO xem, **không tự động phát lại**.

**C. Quyền kiểm soát của PO**
9. PO xem được toàn bộ bản sắp phát và bản đang phát, **gỡ bất kỳ bản nào bằng một thao tác** — gỡ xong khách thấy bản trước đó hoặc thông báo "đang cập nhật".
10. Có **công tắc tổng** tắt toàn bộ tính năng nếu có sự cố.

**D. Lưu vết**
11. 🔴 Lưu **90 ngày** mọi bản đã phát: nội dung, dữ liệu đầu vào, thời điểm, ai gỡ — không sửa được (`FR-EXT-COMP-05`).
12. Bảng theo dõi cho PO: số bản đã viết · số bản bị chặn và vì sao · chi phí luỹ kế tháng này.

---

# EPIC 06 — Tài khoản và gói thuê bao

> **Story gốc do PO viết:**
> *"Là nhà đầu tư thì tôi muốn có thể đăng nhập một cách dễ dàng, và quét mã QR thanh toán qua SePay, các gói thì đã có sẵn rồi."*
>
> **PO chốt (29/07/2026):** *"Anh giữ nguyên giá như vậy nhé. Còn vấn đề quét mã QR thanh toán hay như thế nào thì chắc mình tính sau. Anh thì đang nghiêng về Google thôi."*

**Xử lý của Scrum Master:**
- ✅ `AUTH-D1`: **đăng nhập bằng Google**, không dùng OTP SMS *(OTP tốn 300–800đ/tin, là chi phí chạy suốt đời sản phẩm)*.
- ✅ `PRICE-D1`: còn **3 gói** — Free · Pro · Premium, mỗi gói có **3 thời hạn: 3 tháng · 6 tháng · 1 năm**. Giá 1 năm: Pro 690k, Premium 1.290k. Early bird 490k trong 90 ngày đầu. Gói *Premium AI 3.590k* bỏ theo `BIZ-02`.
- ✅ `PAY-D1` **chốt 29/07: SePay**, bán theo gói thời hạn **3 tháng · 6 tháng · 1 năm**, không có trừ tiền tự động.
- 🔴 `PAY-R1`: Apple bắt buộc dùng In-App Purchase cho nội dung số (ăn 15–30%). **Đặt QR chuyển khoản trong app iOS sẽ bị từ chối khi duyệt.** Ba hướng: bán trên website / IAP cho iOS + SePay cho Android / chỉ ra Android trước.
- 🟡 `PAY-R2`: SePay là chuyển khoản → **không tự động gia hạn**. Mỗi kỳ khách phải chủ động chuyển lại — mỗi lần như vậy là một lần có thể mất khách.

---

### US-06a — Vào app: xem thử trước, đăng nhập sau

> **As a** nhà đầu tư,
> **I want** xem thử nội dung app trước đã, và khi cần lưu gì đó thì đăng nhập bằng Google hoặc Apple chỉ với một chạm,
> **So that** tôi biết app có đáng dùng không trước khi phải giao tài khoản của mình.

| Persona | Mốc | Trace | Phụ thuộc | Điểm |
|---|---|---|---|---|
| P1, P2 | M0 | FR-AUTH-01, FR-COMP-03, NFR-06 | — | **11** |

> **Cập nhật 29/07 theo gợi ý của thầy (Week 2 Day 3):**
> - ✅ `AUTH-D2` — **thêm Sign in with Apple**. Quy định App Store 4.8: app cho đăng nhập bằng Google thì bắt buộc phải có Sign in with Apple trên iOS, không có là bị từ chối khi duyệt.
> - ✅ `AUTH-D3` — **thêm Guest Mode**. Vẽ hành trình của Minh ở `04-USER-JOURNEYS.md` §B1 cho thấy màn hình bắt đăng nhập là chỗ rơi rụng lớn nhất.
> - Điểm tăng **5 → 11**. Phải tách làm hai khi lập Sprint.

**Điều kiện nghiệm thu**

**A. Chế độ khách vãng lai** *(`AUTH-D3`)*
1. Mở app lần đầu **không bị chặn bởi màn hình đăng nhập**.
2. Khách vãng lai **làm được**: tra mã · đọc bản giải thích đầy đủ · xem **5 dòng đầu** kết quả bộ lọc.
3. Khách vãng lai **không làm được**: lưu watchlist · đặt cảnh báo · nhận thông báo · mở tài khoản chứng khoán. Chạm vào thì hiện lời mời đăng nhập **nêu rõ được thêm gì**, không chỉ nói "cần đăng nhập".
4. Đăng nhập xong → **lịch sử tra cứu ở chế độ khách được chuyển sang tài khoản**, không mất.

**B. Đăng nhập**
5. Hỗ trợ **Google** (iOS + Android) và **Sign in with Apple** (bắt buộc trên iOS — `AUTH-D2`).
6. Hoàn tất trong **≤ 3 chạm** kể từ lúc bấm nút đăng nhập.
7. Lần đầu đăng nhập tự tạo tài khoản — **không có màn hình đăng ký riêng**.
3. 🔴 Ngay lần đầu, bắt buộc xác nhận đã đọc **tuyên bố miễn trừ trách nhiệm** trước khi vào app (FR-COMP-03); lưu lại thời điểm xác nhận.
4. Cùng lúc hiển thị thông tin minh bạch: *"Chủ ứng dụng là môi giới chứng khoán và nhận hoa hồng khi bạn giao dịch qua ID trong app"* (`FR-EXT-COMP-02`).
5. Hỏi chọn **chế độ hiển thị** ở bước onboarding — chi tiết ở **US-08**; trước khi US-08 sẵn sàng thì mặc định chế độ Đơn giản.
6. Đăng nhập máy thứ hai thấy nguyên watchlist, danh mục, trạng thái gói.
7. Phiên đăng nhập có hạn và tự gia hạn khi còn dùng; đăng xuất từ xa được (NFR-06).
8. Trong Cài đặt hiển thị rõ **đang dùng tài khoản Google nào**.
9. Mất quyền truy cập Google → có đường liên hệ hỗ trợ để PO chuyển tài khoản thủ công *(xem `AUTH-R1`)*.
10. Xoá tài khoản được, kèm cảnh báo rõ dữ liệu nào sẽ mất.

---

### US-06b — Mua gói và được bật quyền

> **As a** nhà đầu tư đang dùng bản miễn phí,
> **I want** chọn gói, trả tiền, và được mở khoá tính năng ngay mà không phải chờ ai duyệt,
> **So that** tôi dùng được cái mình vừa trả tiền ngay lúc đang có nhu cầu, không phải đợi tới hôm sau.

| Persona | Mốc | Trace | Phụ thuộc |
|---|---|---|---|
| P1, P2 | M1 | FR-AUTH-02, FR-EXT-PRICING-05..09 | US-06a, `PAY-D1` |

**Điều kiện nghiệm thu**
1. Bảng giá hiển thị **3 gói × 3 thời hạn**, nêu rõ mỗi gói có gì và **không có gì**:

   | | 3 tháng | 6 tháng | 1 năm |
   |---|---|---|---|
   | **Free** | 0đ | 0đ | 0đ |
   | **Pro** | *đề xuất 210.000đ* | *đề xuất 390.000đ* | **690.000đ** ✅ |
   | **Premium** | *đề xuất 390.000đ* | *đề xuất 720.000đ* | **1.290.000đ** ✅ |

   *Giá 3 và 6 tháng đang là đề xuất của SM (thời hạn càng dài, giá mỗi tháng càng rẻ) — chờ PO chốt ở `PAY-D2`.*
2. Hỗ trợ **mã giảm giá**: early bird 490k · mua nhóm từ 5 người −15% · giới thiệu bạn bè (FR-EXT-PRICING-05).
3. **Thanh toán bằng mã QR chuyển khoản qua SePay** *(PO chốt `PAY-D1`)*:
   - Mỗi lần trả tiền sinh **mã đơn duy nhất**, đặt vào **nội dung chuyển khoản**
   - Hiện mã QR có sẵn **số tài khoản + đúng số tiền + nội dung** — khách chỉ mở app ngân hàng quét
   - SePay báo về → khớp mã đơn và số tiền → **tự động bật quyền, không cần người duyệt**
   - Quá **5 phút** chưa nhận được xác nhận → hiện nút *"Tôi đã chuyển tiền rồi"*, đưa vào hàng chờ PO đối soát tay
   - 🔒 Tín hiệu từ SePay phải **kiểm chứng được chữ ký/khoá bí mật** — không để ai giả mạo mà bật gói miễn phí
   - 🔴 **Không đặt mã QR trong app iOS** — xem `PAY-R1`. Cần chốt: bán trên website, hay chỉ phát hành Android trước
4. Xử lý được các tình huống lệch: chuyển thiếu tiền · chuyển thừa · chuyển hai lần · sai nội dung → **không tự bật gói**, đẩy sang PO xử lý, và báo cho khách biết đang xử lý.
5. Bật quyền xong: hiện gói đang dùng + **ngày hết hạn cụ thể**, gửi biên nhận qua email.
6. Nâng cấp giữa kỳ → **trừ phần giá trị còn lại** của gói cũ.
7. Hoàn tiền trong **7 ngày** đầu (FR-EXT-PRICING-08).
8. Hạ gói hoặc hết hạn → **không xoá dữ liệu** của khách, chỉ khoá tính năng; nâng lại là thấy nguyên vẹn.

---

### US-06c — Gia hạn và nhắc hạn

> **As a** nhà đầu tư đang trả phí,
> **I want** được nhắc trước khi gói hết hạn và gia hạn được ngay từ chính thông báo đó,
> **So that** tôi không bị mất tính năng giữa lúc đang cần dùng chỉ vì quên ngày.

| Persona | Mốc | Trace | Phụ thuộc |
|---|---|---|---|
| P1, P2 | M1 | FR-EXT-PRICING-07, FR-AUTH-02 | US-06b |

> ⬆️ **Nâng lên Must (29/07):** không có trừ tiền tự động, gói 3 tháng nghĩa là khách phải chủ động chuyển lại 4 lần/năm. Nhắc hạn không còn là tiện ích mà là thứ giữ doanh thu.

**Điều kiện nghiệm thu**
1. Nhắc trước **7 ngày** và **1 ngày** qua thông báo đẩy + email.
2. 🔑 Thông báo nhắc **kèm sẵn mã QR đúng số tiền và đúng nội dung** — khách mở app ngân hàng quét là xong, không phải vào lại app tìm. *(Bù cho việc không có trừ tiền tự động — `PAY-R2`)*
3. Gia hạn trước hạn → **cộng dồn** vào ngày hết hạn cũ, không mất ngày nào.
4. Hết hạn → tự về Free, hiện rõ *"Gói đã hết hạn ngày dd/mm"*, **không tự trừ tiền lần nào**.
5. Khách tắt được nhắc hạn nếu không muốn nhận.
6. PO xem được bảng: ai sắp hết hạn trong 7 ngày · ai vừa hết hạn · tỷ lệ gia hạn theo tháng.
7. Khách đang được tặng Premium do mở TK (US-04a) cũng được nhắc, kèm lời mời chuyển sang gói trả phí.

---

# EPIC 07 — Bản tin sáng và cảnh báo doanh nghiệp

> **Story gốc do PO viết:**
> *"Anh nghĩ bản tin sáng 7:30 khá tốt. Sẽ tổng hợp lại thông tin và lý do họ sẽ vào thường ngày. Người dùng cũng nên có báo cáo tài chính mới ra để cập nhật ngay kết quả kinh doanh hay những giao dịch nội bộ cũng rất hay."*

**Xử lý của Scrum Master:**
- Tách **2 story**: bản tin sáng định kỳ (P1) · cảnh báo sự kiện doanh nghiệp khi phát sinh (P1).
- 💰 **Áp lại nguyên tắc `AI-D1`**: viết sẵn từng khối một lần/ngày rồi **ghép bằng code** theo watchlist từng người — bản tin cảm giác riêng cho từng người nhưng **chi phí không tăng theo số khách**.
- 🟢 Cảnh báo sự kiện doanh nghiệp **rủi ro pháp lý thấp** — đây là công bố thông tin chính thức, app chỉ chuyển tiếp và tóm tắt, luôn kèm link công bố gốc.
- ⚠️ Mùa báo cáo (tháng 1, 4, 7, 10) sẽ có hàng trăm công bố cùng lúc → bắt buộc gom nhóm, không bắn liên tiếp.

---

### US-07a — Bản tin sáng 7:30 theo danh sách của tôi

> **As a** nhà đầu tư,
> **I want** mỗi sáng phiên giao dịch nhận một bản tin ngắn chỉ nói về những mã tôi đang theo dõi và bối cảnh thị trường,
> **So that** tôi nắm được tình hình trong vài phút trước giờ mở cửa mà không phải đọc hàng chục tin không liên quan.

| Persona | Mốc | Trace | Phụ thuộc |
|---|---|---|---|
| P1, P2 | M1 | FR-EXT-BRIEF-01..06, FR-COMP-01/02 | US-02c (watchlist), US-05b (bộ sinh nội dung) |

**Điều kiện nghiệm thu**

**A. Gửi và thời điểm**
1. Gửi lúc **07:30** các ngày có phiên giao dịch; **không gửi** cuối tuần và ngày nghỉ lễ theo lịch của sở giao dịch.
2. Kênh: thông báo đẩy + email. *(Zalo OA có phí và cần xác minh doanh nghiệp — để giai đoạn sau, ghi ở `BRIEF-D1`.)*
3. Toàn bộ nội dung phải sẵn sàng trước **07:15**; chưa xong thì **hoãn, không gửi bản thiếu**.

**B. Nội dung — 4 phần**
4. **(a) Danh sách của tôi hôm qua**: các mã trong watchlist, biến động giá và khối lượng.
5. **(b) Tín hiệu mới**: mã nào vượt hoặc thủng mốc trong phiên trước, mã nào mới lọt bộ lọc.
6. **(c) Bối cảnh vĩ mô và ngành** có liên quan tới các mã tôi theo dõi.
7. **(d) Thị trường chung**: VN-Index, thanh khoản, khối ngoại mua bán ròng, mã biến động mạnh nhất.
8. 🔑 **Chỉ đưa tin liên quan tới mã tôi theo dõi** — không nhồi tin của mã tôi không quan tâm (FR-EXT-BRIEF-03).
9. Watchlist rỗng → gửi bản thị trường chung kèm gợi ý thêm mã vào theo dõi.
10. Phiên trước không có gì đáng chú ý → gửi bản **rất ngắn**, nói thẳng *"Hôm qua không có biến động đáng kể trong danh sách của bạn"* — **không bịa nội dung cho dài**.

**C. Chi phí và cách sinh nội dung**
11. 💰 Sinh **theo khối, mỗi khối một lần/ngày**: khối thị trường (1) · khối vĩ mô (1) · khối theo mã (chỉ mã có sự kiện). Ghép cho từng người **bằng code**, không gọi AI riêng cho từng người.
12. Chi phí **không tăng theo số người dùng**; đo và báo cáo hằng tháng cùng US-05b.
13. Mọi con số trong bản tin do code tính; áp đủ bộ kiểm tra của US-05b (quét từ cấm + đối chiếu số) **trước khi gửi**.

**D. Người dùng kiểm soát**
14. Bật/tắt bản tin; đổi giờ gửi; chọn độ dài **ngắn / vừa / đầy đủ** (FR-EXT-BRIEF-05).
15. Xem lại **30 bản tin gần nhất** trong app.
16. 🔴 Ngôn ngữ trung tính, kèm tuyên bố miễn trừ; **không** suy ra hành động mua bán (FR-EXT-BRIEF-04).
17. Bản tin **Chủ nhật** hằng tuần: tóm tắt tuần qua và lịch sự kiện tuần tới (FR-EXT-BRIEF-06).

---

### US-07b — Cảnh báo khi doanh nghiệp công bố thông tin mới

> **As a** nhà đầu tư,
> **I want** được báo ngay khi một mã tôi theo dõi ra báo cáo tài chính mới hoặc có cổ đông nội bộ đăng ký mua bán, kèm những con số chính,
> **So that** tôi biết ngay kết quả kinh doanh và động thái của người trong doanh nghiệp, thay vì đọc lại sau vài ngày khi giá đã phản ánh xong.

| Persona | Mốc | Trace | Phụ thuộc |
|---|---|---|---|
| P1, P2 | M2 | FR-ALERT-03, 05, 07, 08, FR-DATA-02, FR-DATA-06/07 | US-02c, thu thập công bố thông tin |

**Điều kiện nghiệm thu**

**A. Loại sự kiện theo dõi**
1. **Báo cáo tài chính mới** (quý, năm, soát xét, kiểm toán).
2. **Giao dịch cổ đông nội bộ và người liên quan** — đăng ký mua/bán và kết quả thực hiện.
3. **Phát hành thêm cổ phiếu**, chia cổ tức, chia tách, cổ phiếu thưởng.
4. **Thay đổi ban lãnh đạo**.
5. Người dùng bật/tắt **từng loại riêng biệt** (FR-ALERT-05).

**B. Nội dung cảnh báo**
6. Với **BCTC mới**: nêu ngay số chính — doanh thu, lợi nhuận sau thuế, **so với cùng kỳ theo %** và so với quý liền trước.
7. Với **giao dịch nội bộ**: ai · chức vụ · mua hay bán · số lượng · tỷ lệ trên số đang nắm giữ · thời gian dự kiến.
8. 🔗 Mọi cảnh báo **kèm link tới bản công bố gốc** trên trang sở giao dịch hoặc doanh nghiệp.
9. Lưu bản gốc PDF để đối chiếu và không phải thu thập lại (FR-DATA-07).
10. 🔴 Chỉ **trình bày dữ kiện**, không kèm bình luận đánh giá, không suy ra hành động.
11. Số liệu bị điều chỉnh hồi tố → gửi cảnh báo bổ sung nêu rõ **số cũ và số mới** (FR-DATA-06, D27).

**C. Kịp thời và chống nhiễu**
12. Gửi **trong ngày** kể từ khi công bố; không yêu cầu thời gian thực (FR-ALERT-07).
13. ⚠️ Mùa báo cáo: **gom nhóm** thành một thông báo *"5 mã trong danh sách của bạn vừa ra BCTC quý"* — không bắn 5 thông báo liên tiếp.
14. Trần thông báo loại này: **tối đa 3 lần/ngày/người**; phần còn lại dồn vào bản tin sáng hôm sau.
15. Không phát trùng cùng một công bố (FR-ALERT-09).
16. Xem lại lịch sử cảnh báo đã nhận (FR-ALERT-10).

---

# EPIC 08 — Hai chế độ hiển thị

> **Bối cảnh:** Trong lúc rà soát, Scrum Master phát hiện US-06a có điều kiện nghiệm thu *"chọn chế độ hiển thị khi onboarding"* nhưng **không story nào phụ trách tính năng này**.
>
> **PO chốt (29/07):** *"Anh em hãy thêm story vào chứ, có nhất thiết là mặc định 20 stories đâu."* → nâng tổng số lên **21 story**.

**Xử lý của Scrum Master:** Chế độ hiển thị là nền tảng của toàn bộ định vị *"một lõi dữ liệu, hai chế độ hiển thị"* (URS mục 2). Thiếu nó thì hoặc F0 bị ngợp, hoặc người có kinh nghiệm thấy app quá nông. Đặt ở **M1** cùng lúc với các màn hình đầu tiên có dữ liệu thật.

---

### US-08 — Chuyển giữa chế độ Đơn giản và Chuyên sâu

> **As a** nhà đầu tư,
> **I want** chọn xem app ở chế độ Đơn giản hay Chuyên sâu và đổi lại bất cứ lúc nào,
> **So that** người mới như tôi không bị ngợp bởi màn hình đầy chỉ số, còn người có kinh nghiệm không phải nhìn một app quá nông so với nhu cầu của họ.

| Persona | Mốc | Trace | Phụ thuộc |
|---|---|---|---|
| P1, P2 | M1 | FR-UI-01..04, A4, D2 | US-06a |

**Điều kiện nghiệm thu**
1. Onboarding hỏi **một câu duy nhất** để chọn chế độ, có mô tả ngắn mỗi chế độ dành cho ai; bỏ qua được và mặc định là **Đơn giản**.
2. Đổi chế độ trong Cài đặt **bất cứ lúc nào**, có hiệu lực ngay, không phải khởi động lại app.
3. **Chế độ Đơn giản**: mỗi màn hình mở ra là kết luận trước, số liệu sau; ẩn tham số nâng cao; hạn chế thuật ngữ; mọi thuật ngữ còn lại đều có chú giải khi chạm (FR-UI-02, FR-UI-04).
4. **Chế độ Chuyên sâu**: hiện đầy đủ số liệu thô, chỉ số cấu thành, và cho chỉnh tham số — ví dụ đổi ngưỡng RS Rating, đổi chu kỳ MA, đổi ngưỡng khối lượng cạn kiệt (FR-UI-03).
5. 🔑 **Cùng một lõi dữ liệu** — hai chế độ chỉ khác cách trình bày, **không được ra kết luận khác nhau** cho cùng một mã. Kiểm chứng: lấy 10 mã, so kết luận ở hai chế độ, phải trùng khớp.
6. Chế độ áp dụng nhất quán trên mọi màn hình đã có: tra cứu, bộ lọc, biểu đồ, bản giải thích, bản tin sáng.
7. Chế độ đồng bộ theo tài khoản, đăng nhập máy khác giữ nguyên lựa chọn.
8. Màn hình nào chưa có bản Chuyên sâu → hiện bản Đơn giản, **không để trống**.

---

## Phụ lục — Đã nhận diện nhưng chưa đưa vào bản này

Giữ lại để không mất dấu; sẽ đưa vào Product Backlog ở nhóm chưa refine.

| ID tạm | Story rút gọn | Mốc | Trace |
|---|---|---|---|
| US-21 | Là NĐT, tôi muốn nhập danh mục và xem lãi/lỗ đã thực hiện và chưa thực hiện | M2 | FR-EXT-PORT-01..07 |
| US-22 | Là NĐT, tôi muốn kết nối tài khoản sàn để tự đồng bộ danh mục | M3 | FR-EXT-BRKAPI-01..07 |
| US-24 | Là PO, tôi muốn import báo cáo hoa hồng từ sàn và xem doanh thu theo user/sàn | M2 | FR-EXT-COM-01..05 |
| US-25 | Là NĐT, tôi muốn xem tỷ lệ đúng trong quá khứ của từng loại tín hiệu | M4 | FR-BT-01..03 |
| US-26 | Là NĐT có kinh nghiệm, tôi muốn tự backtest quy tắc của mình | M4 | FR-EXT-BT-01..06 |
| US-27 | Là NĐT, tôi muốn xem bao nhiêu % người dùng đang giữ một mã | M4 | FR-EXT-CROWD-01..06 |
| US-28 | Là KOL affiliate, tôi muốn dashboard theo dõi user và hoa hồng của mình | M4 | FR-EXT-COM-06..08 |

### ⚙️ Hạng mục nền móng — không phải user story nhưng bắt buộc có trong Backlog

| ID | Nội dung | Mốc | Trace |
|---|---|---|---|
| EN-01 | 🔴 **Ý kiến pháp lý của luật sư chứng khoán** — chặn `LEGAL-01`, `LEGAL-02`, `BRK-V6` | M0 | FR-EXT-COMP-01 |
| EN-02 | **Lớp trừu tượng nguồn dữ liệu** + thu thập giá/KL thời gian thực từ API CTCK | M0 | FR-DATA-01, 03, 09 |
| EN-03 | **Giá điều chỉnh** (cổ tức, thưởng, chia tách) dùng cho mọi tính toán; giữ song song giá thô | M0 | FR-DATA-04, 05, D26 |
| EN-04 | Thu thập **BCTC/BCTN và công bố thông tin** (giao dịch nội bộ, phát hành thêm, thay đổi lãnh đạo) + lưu bản gốc PDF + giữ cả hai phiên bản số liệu | M0–M2 | FR-DATA-02, 06, 07, D27, FR-ALERT-03 |
| EN-05 | **Tính RS Rating toàn thị trường** hằng ngày *(chưa có trong URS)* | M1 | 🆕 `FR-EXT-SCREEN-02` |
| EN-06 | Hạ tầng thông báo đẩy + hàng đợi gửi hàng loạt giữ được ngưỡng 60 giây | M1 | NFR-01, FR-ALERT-06 |

---

## 📌 Việc phát sinh cần theo dõi

| ID | Nội dung | Người quyết | Mức |
|---|---|---|---|
| 🔴 **LEGAL-01** | **Phát thông báo đồng loạt tới khách hàng tại mức giá do môi giới đặt** — cần luật sư trả lời có cấu thành tư vấn đầu tư theo Luật CK 2019 không, và điều kiện để hợp pháp. **Đây là câu hỏi số 1 của `BRK-V6`, phải hỏi trước khi code US-02a/b.** | Luật sư → PO | Chặn |
| 🔴 LEGAL-02 | PO có bị hạn chế tự giao dịch trước thời điểm phát thông báo không (front-running)? | Luật sư → PO | Chặn |
| GAP-01 | URS thiếu yêu cầu **tìm kiếm cổ phiếu** → bổ sung `FR-EXT-SEARCH-01` | PO | Thường |
| GAP-02 | URS thiếu toàn bộ nhóm **danh sách canh + phát tín hiệu của môi giới** → bổ sung `FR-EXT-SIGNAL-01..06` | PO | Cao |
| GAP-03 | URS thiếu **bộ lọc cổ phiếu toàn thị trường** → bổ sung `FR-EXT-SCREEN-01..06`. Kèm enabler: tính **RS Rating** hằng ngày cho toàn thị trường (chưa có trong URS) | PO | Cao |
| ARCH-01 | Bộ lọc phải thiết kế **cắm-thêm-được** — mỗi tiêu chí một khối độc lập, thêm mới không sửa cũ | SM | Thường |
| 🔴 BRK-V5 | **Sàn có chấp nhận mã giới thiệu đến từ app bên ngoài không?** Không có thì US-04a vô nghĩa | PO hỏi sàn | Chặn |
| ❓ Q-02 | **PO đang cắm ID ở những sàn nào?** Quyết định danh sách sàn hiện trong app | PO | Cần sớm |
| ❓ Q-03 | Khách **đã có TK sẵn** ở sàn đó từ trước thì xử lý sao — cho chuyển ID môi giới rồi tặng, hay không tặng? | PO | Cần sớm |
| BRIEF-D1 | Gửi bản tin qua **Zalo OA** — có phí và cần xác minh doanh nghiệp. Giai đoạn đầu dùng push + email | PO | Thường |
| ✅ PAY-D1 | **Chốt 29/07: dùng SePay**, bán theo gói thời hạn **3 tháng · 6 tháng · 1 năm**. Không có trừ tiền tự động vì chưa tìm được nhà cung cấp phù hợp | PO | Xong |
| ❓ PAY-D2 | **Chốt giá cho gói 3 tháng và 6 tháng** — hiện mới có giá 1 năm | PO | Cần sớm |
| 🔴 PAY-R1 | **Apple cấm bán nội dung số ngoài In-App Purchase.** Đặt QR chuyển khoản trong app iOS sẽ bị từ chối khi duyệt | PO | Cao |
| 🟡 PAY-R2 | **Không có trừ tiền tự động.** Gói 3 tháng nghĩa là khách phải chủ động chuyển tiền lại **4 lần/năm** — mỗi lần là một cơ hội mất khách. Vì vậy **US-06c nâng từ Should lên Must** | SM | Cao |
| 🟡 PAY-R3 | Đối soát tay: 30 khách × 4 lần/năm = 120 lượt/năm — làm được. **Tới ~300 khách là 1.200 lượt/năm (~100/tháng)** → lúc đó bắt buộc phải tự động hoá | SM | Theo dõi |
| AUTH-R1 | Chỉ đăng nhập Google → khách mất quyền truy cập Gmail là mất tài khoản. Cần quy trình hỗ trợ chuyển tay | PO | Thường |
| ✅ AUTH-D1 | **Đăng nhập bằng Google**, không dùng OTP SMS | PO | Xong |
| ✅ AUTH-D2 | **Thêm Sign in with Apple** — quy định App Store 4.8, không có là bị từ chối khi duyệt iOS | PO | Xong 29/07 |
| ✅ AUTH-D3 | **Thêm Guest Mode** — cho xem trước, chỉ chặn ở chỗ cần lưu dữ liệu | PO | Xong 29/07 |
| ❌ SURV-D1 | Khảo sát 700 người — **PO quyết định không làm**, chọn theo phán đoán của người trong nghề | PO | Đóng 29/07 |
| ✅ PRICE-D1 | **3 gói**: Free · Pro 690k · Premium 1.290k · early bird 490k | PO | Xong |
| ✅ AI-D1 | **Bỏ chat hỏi–đáp mở, làm bản giải thích viết sẵn** — chi phí cố định, không giới hạn lượt đọc | PO | Xong |
| BIZ-02 | Gói **Premium AI 3.590k/năm** mất lý do tồn tại → `PRICING_TIERS` rút còn 3 gói | PO | Thường |
| BIZ-03 | `GTM_PLAN` §1.2 quảng cáo *"Hỏi AI bất kỳ câu nào"* → viết lại lời hứa trên landing page | PO | Thường |
| BIZ-01 | Điều kiện **≥150tr** thu hẹp tệp mục tiêu → chỉnh lại dự báo doanh thu và tỷ lệ chuyển đổi trong `BUSINESS_MODEL` §2.2 và `PRICING_TIERS` §3 (đang ghi *tặng 3 tháng, không điều kiện*) | PO | Thường |
| ✅ Q-01 | Tab chưa tới mốc hiển thị gì → **chốt: khoá kèm "Sắp có" + đăng ký nhận thông báo** | PO | Xong |
| ✅ RM-D1 | Thứ tự roadmap → **chốt: Cơ bản + Vĩ mô trước Kỹ thuật; cảnh báo pivot tách riêng ra M1** | PO | Xong |

---

*Hết bước 1/5 — **21 story**, đã rà soát INVEST. Bước tiếp theo: `02-MOSCOW.md`*
