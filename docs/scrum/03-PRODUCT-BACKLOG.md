# 03 — PRODUCT BACKLOG

| | |
|---|---|
| **Bài tập** | KTS Week 2 — Day 2 · Bước 3/5 |
| **Product Owner** | Tú — *người sở hữu và sắp xếp thứ tự ưu tiên* |
| **Scrum Master** | Claude — *dựng backlog, ước lượng, quản lý phụ thuộc* |
| **Đầu vào** | `01-USER-STORIES.md` (21 story + 6 nền móng) · `02-MOSCOW.md` |
| **Ngày lập** | 29/07/2026 |
| **Trạng thái** | ✅ `BL-D1` đã duyệt 29/07 — còn `BL-D2`, `BL-D3` treo |

---

## 1. Cách đọc tài liệu này

Product Backlog là **một danh sách duy nhất, xếp theo thứ tự làm trước–làm sau**. Không phải danh sách theo nhóm chức năng, mà theo **thứ tự thực thi**.

Nguyên tắc xếp thứ tự, áp theo đúng thứ tự này khi hai hạng mục ngang nhau:

1. **Chặn hay không chặn** — thứ mà nhiều hạng mục khác phải chờ thì làm trước
2. **Rủi ro cao làm sớm** — sai lầm phát hiện ở tuần 5 rẻ hơn ở tuần 18 rất nhiều
3. **Mức MoSCoW** — Must trước Should
4. **Sớm có thứ cho người dùng chạm vào** — để có phản hồi thật ở tuần 12

| Ký hiệu | Nghĩa |
|---|---|
| **#** | Thứ tự thực thi. Số nhỏ làm trước |
| **Điểm** | 1 điểm ≈ 2–2,5 giờ làm thật |
| **Luỹ kế** | Tổng điểm tính tới hạng mục đó |
| **Tuần** | Tuần dự kiến hoàn tất, tính từ tuần bắt đầu viết code |

**Giả định năng suất:** 15–20 giờ/tuần → **8 điểm/tuần**. Bắt đầu viết code từ **tuần 5** (tuần 1–4 dành cho việc xác minh, xem mục 6).

---

## 2. Bối cảnh đã chốt

| Quyết định | Nội dung |
|---|---|
| `MSC-D1` | **Một bản phát hành duy nhất**, không chia R0/R1 |
| `MSC-D2` | Hoãn xây SePay — đợt khách đầu thu tiền bằng chuyển khoản, bật quyền thủ công |
| `MSC-D4` | Giữ nguyên **Must 82%** — chấp nhận không còn biên an toàn về phạm vi |
| `MSC-D5` | **Mở dùng thử miễn phí cho 20–30 người ở tuần 12** |
| `MSC-D6` | PO tự lo 10–14 triệu chi phí vận hành trong giai đoạn chưa có doanh thu |
| `RM-D1` | Cơ bản + Vĩ mô ra trước Kỹ thuật |
| `AI-D1` | Bản giải thích viết sẵn, không có chat hỏi–đáp mở |
| `AUTH-D1` | Đăng nhập bằng Google |
| `PAY-D1` | SePay, gói 3 / 6 / 12 tháng, không trừ tiền tự động |

---

## 3. PRODUCT BACKLOG — Bản 1

> **Cập nhật 29/07 — ba thay đổi:**
> - `BL-D1` — PO kéo **US-04a/b (mở tài khoản)** từ tuần 21 lên **tuần 13–14**, để hoa hồng bắt đầu chảy sớm 8 tuần
> - `AUTH-D2` + `AUTH-D3` — thêm **Sign in with Apple** và **Guest Mode** → `US-06a` tăng **5 → 11 điểm**
> - `BL-D2` — PO chốt mốc dùng thử **phải có cả bộ lọc và cảnh báo** → xem hệ quả ở §3.6

### 3.1 Nền móng → mốc dùng thử đợt 1

| # | ID | Hạng mục | MoSCoW | Điểm | Luỹ kế | Tuần | Phụ thuộc |
|---|---|---|---|---|---|---|---|
| 1 | **EN-02** | Lớp trừu tượng nguồn dữ liệu + giá/KL thời gian thực | M | 13 | 13 | 6 | `A6` |
| 2 | **US-06a** | Guest Mode + đăng nhập Google/Apple + miễn trừ trách nhiệm | M | **11** | 24 | 7 | — |
| 3 | **EN-04′** | Thu thập BCTC 50 mã VN100 + lưu bản gốc PDF | M | 13 | 37 | 9 | EN-02 |
| 4 | **US-01a** | Tìm cổ phiếu + màn hình phân tích 3 tab | M | 8 | 45 | 10 | EN-02, US-06a |
| 5 | **US-05b** | Bộ sinh và kiểm duyệt bản giải thích | M | 13 | 58 | 12 | EN-04′ |
| 6 | **US-05a** | Đọc bản giải thích, không giới hạn lượt | M | 5 | 63 | **12** | US-05b, US-01a |

> ### 🎯 MỐC 1 — Tuần 12: Bản đọc được
> Khách vãng lai mở app, tra bất kỳ mã nào trong 50 mã VN100, đọc bản giải thích cơ bản + vĩ mô có trích dẫn nguồn. Chưa cần đăng nhập.
> **Chưa có:** bộ lọc · cảnh báo · watchlist · thu tiền.

### 3.2 Mở tài khoản chứng khoán

| # | ID | Hạng mục | MoSCoW | Điểm | Luỹ kế | Tuần | Phụ thuộc |
|---|---|---|---|---|---|---|---|
| 7 | **US-04a** | Mở tài khoản chứng khoán qua app, nhận 1 tháng Premium | M | 5 | 68 | 13 | 🔴 `BRK-V5`, US-06a |
| 8 | **US-04b** | PO đối soát sổ khách hàng và duyệt | M | 5 | 73 | **14** | US-04a |

> ### 🎯 MỐC 1.5 — Tuần 14: Bắt đầu chảy hoa hồng
> ⚠️ **`BRK-V5` phải có câu trả lời trước tuần 12.** Chưa có thì đẩy US-04a/b về sau US-02b.

### 3.3 Bộ lọc

| # | ID | Hạng mục | MoSCoW | Điểm | Luỹ kế | Tuần | Phụ thuộc |
|---|---|---|---|---|---|---|---|
| 9 | **EN-03** | Giá điều chỉnh — cổ tức, thưởng, chia tách | M | 8 | 81 | 15 | EN-02 |
| 10 | **EN-05** | Tính RS Rating toàn thị trường hằng ngày | M | 5 | 86 | 15 | EN-03 |
| 11 | **US-03a** | Bộ lọc Minervini — 8 tiêu chí + VCP, tính sẵn theo ngày | M | 13 | 99 | 17 | EN-03, EN-05 |
| 12 | **US-03b** | Biểu đồ chú giải "vì sao mã này lọt bộ lọc" | M | 13 | 112 | **18** | US-03a |

> ### 🎯 MỐC 2 — Tuần 18: PO dùng được để làm việc
> Thay vì lọc tay mỗi tối, PO bấm một nút ra 20–40 ứng viên đã xếp hạng. **Đây là lúc app bắt đầu trả công cho chính PO.**

### 3.4 Cảnh báo

| # | ID | Hạng mục | MoSCoW | Điểm | Luỹ kế | Tuần | Phụ thuộc |
|---|---|---|---|---|---|---|---|
| 13 | **EN-06** | Hạ tầng thông báo đẩy, giữ ngưỡng 60 giây | M | 8 | 120 | 19 | EN-02 |
| 14 | **US-02a** | PO soạn danh sách canh + đặt pivot + ghi log bối cảnh | M | 8 | 128 | 20 | US-03a |
| 15 | **US-02b** | Khách nhận thông báo vượt/thủng mốc, có nhãn khối lượng | M | 8 | 136 | **21** | US-02a, EN-06, US-04b, 🔴 `EN-01` |

> ### 🎯 MỐC 3 — Tuần 21: Đủ Must
> Vòng vận hành khép kín: lọc → PO duyệt và đặt pivot → khách nhận thông báo trong phiên.

### 3.5 Hoàn thiện

| # | ID | Hạng mục | MoSCoW | Điểm | Luỹ kế | Tuần | Phụ thuộc |
|---|---|---|---|---|---|---|---|
| 16 | **US-02c** | Watchlist và cảnh báo ngưỡng giá riêng của khách | S | 8 | 144 | 22 | US-01a, EN-06 |
| 17 | **US-08** | Hai chế độ hiển thị Đơn giản / Chuyên sâu | S | 8 | 152 | 23 | US-06a |
| 18 | **US-07a** | Bản tin sáng 7:30 cá nhân hoá | S | 13 | 165 | **25** | US-02c, US-05b |

> ### 🎯 MỐC 4 — Tuần 25: Hoàn tất Bản 1

### 3.6 ⚠️ Hệ quả của `BL-D2`

PO chốt: **mốc dùng thử phải có cả bộ lọc và cảnh báo.** Nhìn bảng trên thì cảnh báo hoàn tất ở **tuần 21**.

Nghĩa là **mốc dùng thử trùng với mốc mở bán** — không còn giai đoạn dùng thử sớm nữa:

| | Trước `BL-D2` | Sau `BL-D2` |
|---|---|---|
| Mốc dùng thử | Tuần 12 | **Tuần 21** |
| Mốc mở bán | Tuần 21 | Tuần 21 |
| Thời gian sửa theo phản hồi thật | 9 tuần | **0 tuần** |

**Ba cách xử lý, PO chọn:**

| | Cách | Đánh đổi |
|---|---|---|
| **①** | Chấp nhận — dùng thử và mở bán cùng tuần 21 | Đơn giản nhất, nhưng không còn cơ hội đổi hướng nếu phản hồi xấu |
| **②** | **Mở dùng thử hai đợt**: tuần 12 cho 10 người thân nhất *(chỉ có bản giải thích)*, tuần 21 mở đủ | Không tốn thêm giờ công nào. **SM khuyến nghị** |
| **③** | Rút gọn để có đủ ba thứ sớm hơn: bỏ VCP và biểu đồ chú giải, cảnh báo bản tối giản → khoảng **tuần 17** | Bộ lọc yếu đi, mất đúng phần khác biệt với wichart |

### 3.7 Tổng kết Bản 1

| | Điểm | Tuần hoàn tất |
|---|---|---|
| Must (15 hạng mục) | 136 | **21** |
| Should (3 hạng mục) | 29 | **25** |
| **Tổng** | **165** | |

*Tăng 6 điểm so với bản trước do `AUTH-D2` + `AUTH-D3`. Mốc 1, 2, 3 giữ nguyên; Mốc 1.5 và Mốc 4 lùi 1 tuần.*

---

## 4. Sơ đồ phụ thuộc

```
                        ┌─ EN-01 Pháp lý ─┐  ⚠️ CHẶN TOÀN BỘ
                        │  (tuần 1–4)     │
                        └────────┬────────┘
                                 ▼
                        ┌─ EN-02 Lớp dữ liệu + giá ─┐
                        └──┬────────┬────────┬──────┘
              ┌────────────┘        │        └────────────┐
              ▼                     ▼                     ▼
      ┌─ EN-04′ BCTC ─┐    ┌─ EN-03 Giá đ/chỉnh ─┐  ┌─ EN-06 Push ─┐
              │                     ▼                     │
              │             ┌─ EN-05 RS Rating ─┐          │
              │                     ▼                     │
              │             ┌─ US-03a Bộ lọc ───┐          │
              │                ├────────┐       │          │
              │                ▼        ▼       │          │
              │        US-03b Biểu đồ   US-02a Pivot       │
              │                                  └────┬────┘
              ▼                                       ▼
      ┌─ US-05b Bộ sinh ─┐                    ┌─ US-02b Thông báo ─┐
              ▼                                       ▲
      ┌─ US-05a Đọc ─────┐                            │
                                              US-04a ─┴─ US-04b
   US-06a Đăng nhập ──► US-01a Tìm mã ──► US-02c ──► US-07a Bản tin
                                    └──► US-08 Hai chế độ
```

**Đường găng:** `EN-01 → EN-02 → EN-03 → EN-05 → US-03a → US-02a → US-02b`
Chậm bất kỳ mắt xích nào trong chuỗi này là chậm toàn bộ. Các nhánh khác có thể xê dịch.

---

## 5. Nhóm chưa refine — Bản 2 trở đi

Nằm trong backlog nhưng **chưa cần chi tiết hoá**. Sẽ refine khi Bản 1 gần xong.

| ID | Hạng mục | Điểm | Ghi chú |
|---|---|---|---|
| US-06b | Mua gói và bật quyền tự động qua SePay | 13 | Xây khi vượt ~100 khách (`PAY-R3`) |
| US-06c | Gia hạn và nhắc hạn | 5 | Bắt buộc có cùng lúc với US-06b |
| US-01b | Tab Cơ bản — điểm 0–100 theo 5 trụ | 21 | Lớp 1 đầy đủ |
| US-07b | Cảnh báo công bố thông tin doanh nghiệp | 13 | |
| US-01c | Tab Vĩ mô đầy đủ | 21 | Lớp 3 đầy đủ |
| US-03c | Người có kinh nghiệm tự dựng bộ lọc | 13 | |
| US-01d | Tab Kỹ thuật — 4 trường phái | 21 | |
| US-02d | Hệ thống học cách PO đặt pivot | 21 | Cần 1–2 năm log từ US-02a |
| US-21…28 | Danh mục · đồng bộ sàn · hoa hồng · backtest · crowd · affiliate | — | `01-USER-STORIES.md` phụ lục |

---

## 6. Việc phải xong TRƯỚC khi viết dòng code đầu tiên

Không tốn điểm nhưng chặn tất cả. Làm song song trong **tuần 1–4**.

| # | Việc | Hạn | Nếu thất bại |
|---|---|---|---|
| 🔴 **EN-01** | Ý kiến pháp lý của luật sư chứng khoán, trả lời cụ thể `LEGAL-01` *(phát thông báo pivot đồng loạt tới khách hàng)* và `LEGAL-02` *(PO tự giao dịch trước khi phát)* | Tuần 2 | **Dừng toàn bộ.** Chuyển sang Plan B ở `GTM_PLAN` §9 |
| 🔴 **BRK-V5** | Hỏi sàn: có chấp nhận mã giới thiệu từ ứng dụng bên ngoài không. ⚠️ **Hạn cứng tuần 11** sau khi kéo US-04a/b lên tuần 13 | Tuần 2 | US-04a/b lùi lại vị trí cũ (sau US-02b, tuần 21) |
| 🔴 **A6** | Xác minh điều khoản API giá của CTCK: có được dùng trong sản phẩm thu phí không | Tuần 1 | Đổi nguồn giá, EN-02 làm lại |
| ❓ **Q-02** | PO đang cắm ID ở những sàn nào | Tuần 2 | Không chốt được danh sách sàn trong app |
| ❓ **Q-03** | Khách đã có tài khoản sẵn ở sàn thì xử lý ra sao | Tuần 3 | Thiếu một nhánh của US-04a |
| ❓ **PAY-D2** | Giá gói 3 tháng và 6 tháng | Tuần 8 | Chưa chặn — thu tiền thủ công ở Bản 1 |
| 🔴 **PAY-R1** | Chốt cách bán không vi phạm chính sách Apple | Trước khi có US-06b | Ứng dụng bị từ chối khi duyệt |

---

## 7. Định nghĩa Sẵn sàng — Definition of Ready

Một hạng mục **chỉ được đưa vào Sprint** khi đủ cả 6 điều:

1. Có điều kiện nghiệm thu viết rõ, **kiểm chứng được bằng thao tác cụ thể**
2. Đã ước lượng điểm và **≤ 8 điểm** — lớn hơn thì phải tách trước
3. Mọi phụ thuộc đã hoàn tất hoặc đã có cách đi vòng
4. Không còn câu hỏi treo nào cần PO trả lời
5. Đã rõ nguồn dữ liệu và nguồn đó **đã xác minh là dùng được**
6. Nếu chạm tới nội dung hiển thị cho khách: đã đối chiếu **Quy ước ngôn ngữ bắt buộc**

> ⚠️ **US-05b, US-03a, US-03b, US-07a đang là 13 điểm — vượt ngưỡng.** Phải tách ở bước Sprint Planning.

## 8. Định nghĩa Hoàn thành — Definition of Done

Một hạng mục **chỉ được coi là xong** khi đủ cả 7 điều:

1. Toàn bộ điều kiện nghiệm thu đã kiểm chứng thủ công, có ghi lại kết quả
2. Chạy được trên **máy thật**, không chỉ trên máy giả lập
3. Xử lý được trường hợp lỗi: mất mạng · nguồn dữ liệu hỏng · dữ liệu rỗng — và **không hiển thị số cũ như số mới** (`NFR-10`)
4. 🔴 Nếu hiển thị nội dung cho khách: đã quét từ cấm, **không dính từ nào**
5. 🔴 Nếu có con số: đã đối chiếu với kho dữ liệu, **khớp 100%**
6. Đã đẩy lên Git kèm ghi chú thay đổi
7. Tài liệu liên quan đã cập nhật nếu có thay đổi so với thiết kế ban đầu

---

## 9. Rủi ro của Backlog này

| # | Rủi ro | Mức | Cách giảm |
|---|---|---|---|
| B-R1 | **Must 82%, không còn biên an toàn** *(`MSC-D4`)*. Chậm là chỉ còn cách lùi ngày | **Cao** | Theo dõi tốc độ thực từ Sprint 3; lệch quá 20% thì họp lại với PO |
| B-R2 | Năng suất 8 điểm/tuần là **giả định chưa kiểm chứng**. `URS_AMENDMENTS` cảnh báo người vừa học vừa làm có thể chậm 1,5–2 lần | **Cao** | Đo tốc độ thật sau 3 sprint rồi tính lại toàn bộ mốc |
| B-R3 | `EN-01` pháp lý chưa có kết quả mà vẫn bắt đầu code | **Cao** | Tuần 5–9 chỉ làm hạng mục **không phụ thuộc kết luận pháp lý** (EN-02, US-06a, EN-04′). US-02a/b để sau tuần 19 — còn thời gian xoay |
| B-R4 | 20 tuần không doanh thu | Trung bình | Mốc dùng thử tuần 12 để có phản hồi sớm *(`MSC-D5`)* |
| B-R5 | Bốn hạng mục 13 điểm chưa tách | Trung bình | Tách ở Sprint Planning theo Định nghĩa Sẵn sàng |

---

## 10. Việc cần PO chốt

| ID | Câu hỏi |
|---|---|
| ✅ **BL-D1** | **PO duyệt 29/07** — và yêu cầu kéo US-04a/b lên tuần 13 |
| **BL-D2** | Xác nhận mốc dùng thử **tuần 12** chỉ có: đăng nhập · tra mã · đọc bản giải thích 50 mã. Không có bộ lọc, không có cảnh báo |
| **BL-D3** | Duyệt Định nghĩa Sẵn sàng và Định nghĩa Hoàn thành ở mục 7–8? |
| `MSC-D3` | *(còn treo)* Xác nhận thu tiền thủ công tới hết Bản 1 |
| `MSC-D7` | *(còn treo)* Chậm tiến độ thì lùi ngày hay cắt phạm vi — SM khuyến nghị **lùi ngày** |

---

*Hết bước 3/5 → tiếp tục `04-SPRINT-1.md`*
