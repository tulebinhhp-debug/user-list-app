# USER REQUIREMENTS SPECIFICATION (URS)
## Ứng dụng phân tích cổ phiếu Việt Nam

| | |
|---|---|
| **Sản phẩm** | Ứng dụng phân tích cổ phiếu Việt Nam *(tên chưa đặt)* |
| **Phiên bản tài liệu** | 1.0 — draft chờ PO duyệt |
| **Ngày lập** | 27/07/2026 |
| **Product Owner** | Tú |
| **Business Analyst** | Claude |
| **Trạng thái** | Các mục A1–A3 (mục 9) đang là giả định của BA, chờ PO xác nhận |

---

## Lịch sử phiên bản

| Phiên bản | Ngày | Người sửa | Nội dung |
|---|---|---|---|
| 0.1 | 27/07/2026 | BA | Tổng hợp 6 vòng elicitation, chốt D1–D25 |
| 1.0 | 27/07/2026 | BA | Bổ sung D26 (giá điều chỉnh), D27 (BCTC hồi tố). Hoàn chỉnh URS |

---

## Mục lục

1. [Mục đích](#1-mục-đích)
2. [Đối tượng người dùng](#2-đối-tượng-người-dùng)
3. [Phạm vi](#3-phạm-vi)
4. [Yêu cầu chức năng](#4-yêu-cầu-chức-năng)
5. [Yêu cầu dữ liệu](#5-yêu-cầu-dữ-liệu)
6. [Yêu cầu phi chức năng](#6-yêu-cầu-phi-chức-năng)
7. [Ràng buộc](#7-ràng-buộc)
8. [Tiêu chí chấp nhận](#8-tiêu-chí-chấp-nhận)
9. [Giả định & việc còn treo](#9-giả-định--việc-còn-treo)
- [Phụ lục A — Nhật ký quyết định (D1–D27)](#phụ-lục-a--nhật-ký-quyết-định)
- [Phụ lục B — Kiến trúc hệ thống](#phụ-lục-b--kiến-trúc-hệ-thống)
- [Phụ lục C — Lộ trình bàn giao](#phụ-lục-c--lộ-trình-bàn-giao)
- [Phụ lục D — Dự toán chi phí vận hành](#phụ-lục-d--dự-toán-chi-phí-vận-hành)
- [Phụ lục E — Đăng ký rủi ro](#phụ-lục-e--đăng-ký-rủi-ro)

---

## 1. Mục đích

Xây dựng ứng dụng di động giúp nhà đầu tư cá nhân Việt Nam **hiểu một doanh nghiệp thực sự tốt hay không**, **cổ phiếu đang ở giai đoạn nào**, và **vì sao giá đang đi ngược lại với nền tảng** — bằng cách kết hợp ba lớp phân tích trên cùng một nền dữ liệu.

### 1.1 Vấn đề đang tồn tại

Các công cụ hiện có tại Việt Nam hoặc chỉ cung cấp số liệu thô (người dùng tự diễn giải), hoặc chỉ cung cấp tín hiệu kỹ thuật (không biết doanh nghiệp có tốt không). Gần như không công cụ nào **giải thích được mâu thuẫn** giữa nền tảng tốt và giá cổ phiếu giảm.

### 1.2 Tuyên bố giá trị

> *"Không chỉ nói cổ phiếu này tốt hay xấu, mà giải thích được vì sao thị trường đang định giá nó như vậy."*

### 1.3 Ba lớp phân tích

| Lớp | Nội dung | Câu hỏi trả lời |
|---|---|---|
| **1. Cơ bản** | BCTC, BCTN → chất lượng DN, mô hình kinh doanh, cơ cấu lợi nhuận, lợi thế cạnh tranh | *Doanh nghiệp này có tốt không?* |
| **2. Kỹ thuật** | Giá + khối lượng → giai đoạn, điểm mua/bán, cảnh báo breakout | *Cổ phiếu đang ở đâu trong chu kỳ?* |
| **3. Vĩ mô & ngành** | Lãi suất, tỷ giá, giá hàng hoá → ngành hưởng lợi hay chịu thiệt | *Vì sao giá đi ngược với nền tảng?* |

Lớp 3 là cầu nối giải thích mâu thuẫn giữa Lớp 1 và Lớp 2 — đây là điểm khác biệt cốt lõi của sản phẩm.

---

## 2. Đối tượng người dùng

| Persona | Mô tả | Nhu cầu chính |
|---|---|---|
| **P1 — Minh, F0** | Mới đầu tư dưới 2 năm, chưa đọc được BCTC, đang mua theo hội nhóm | Kết luận đơn giản, có căn cứ, và **được giải thích** để dần tự hiểu |
| **P2 — Hà, có kinh nghiệm** | Đầu tư 5+ năm, tự đọc BCTC, dùng nhiều trường phái phân tích kỹ thuật | Công cụ **tiết kiệm thời gian**: số liệu đầy đủ, so sánh ngành, tuỳ biến bộ lọc, không bị "làm hộ" phần suy nghĩ |

Thiết kế: **một lõi dữ liệu, hai chế độ hiển thị** — *Đơn giản* (P1) và *Chuyên sâu* (P2).

---

## 3. Phạm vi

### 3.1 Trong phạm vi

- Cổ phiếu niêm yết trên HOSE, HNX, UPCOM
- Phân tích cơ bản, kỹ thuật, vĩ mô
- Cảnh báo thời gian thực
- Danh sách theo dõi (watchlist)
- Backtest công khai độ tin cậy tín hiệu
- Tài khoản người dùng và thuê bao

### 3.2 Ngoài phạm vi (bản 1.0)

- Đặt lệnh / giao dịch
- Quản lý danh mục có giá vốn và tính lãi/lỗ
- Phái sinh, chứng quyền, trái phiếu, quỹ mở
- Thị trường nước ngoài
- Mạng xã hội / diễn đàn trong ứng dụng
- Tư vấn đầu tư cá nhân hoá

---

## 4. Yêu cầu chức năng

**Ký hiệu ưu tiên:** `M` = bắt buộc (Must) · `S` = nên có (Should) · `C` = có thì tốt (Could)
**Cột Mốc:** tham chiếu lộ trình M0–M4 tại Phụ lục C

### 4.1 Thu thập & quản trị dữ liệu

| ID | Yêu cầu | Ưu tiên | Mốc |
|---|---|---|---|
| FR-DATA-01 | Hệ thống thu thập giá và khối lượng thời gian thực từ API công ty chứng khoán (VPS), độ trễ ≤ 60 giây trong phiên | M | M0 |
| FR-DATA-02 | Hệ thống thu thập BCTC, BCTN, chỉ số vĩ mô từ nguồn dữ liệu cơ bản, tối thiểu 1 lần/ngày | M | M0 |
| FR-DATA-03 | Toàn bộ logic phân tích truy cập dữ liệu qua một lớp trừu tượng duy nhất, cho phép thay nguồn mà không sửa logic phân tích | M | M0 |
| FR-DATA-04 | Hệ thống lưu **giá điều chỉnh** (đã xử lý cổ tức tiền mặt, cổ phiếu thưởng, chia tách) và dùng nó cho mọi tính toán kỹ thuật | M | M0 |
| FR-DATA-05 | Hệ thống lưu giá thô song song, chỉ dùng khi hiển thị lịch sử khớp lệnh thực tế | M | M0 |
| FR-DATA-06 | Hệ thống lưu **cả hai phiên bản BCTC**: số công bố ban đầu và số sau điều chỉnh/kiểm toán | M | M2 |
| FR-DATA-07 | Hệ thống lưu bản gốc (PDF) của mọi BCTC/BCTN đã thu thập, phục vụ đối chiếu và tránh phải thu thập lại | M | M0 |
| FR-DATA-08 | Độ sâu dữ liệu: giá/KL toàn bộ lịch sử · BCTC 10 năm · vĩ mô toàn bộ lịch sử | M | M0–M3 |
| FR-DATA-09 | Hệ thống ghi nhật ký nguồn và thời điểm của mọi dữ liệu, cho phép truy vết khi số liệu sai | S | M0 |

### 4.2 Phân tích cơ bản (Lớp 1)

| ID | Yêu cầu | Ưu tiên | Mốc |
|---|---|---|---|
| FR-FUND-01 | Hệ thống chấm điểm sức khoẻ doanh nghiệp theo thang **0–100**, chia **5 trụ**: Sinh lời · Tăng trưởng · Sức khoẻ tài chính · Chất lượng lợi nhuận · Định giá | M | M2 |
| FR-FUND-02 | Mỗi trụ có điểm riêng; người dùng xem được các chỉ số cấu thành và giá trị cụ thể | M | M2 |
| FR-FUND-03 | Hệ thống áp dụng **bộ chỉ số riêng theo nhóm ngành**; nhóm tài chính (ngân hàng, chứng khoán, bảo hiểm) dùng bộ chỉ số đặc thù, không dùng bộ chung | M | M2 |
| FR-FUND-04 | Hệ thống dùng AI đọc phần thuyết minh BCTC và báo cáo thường niên để rút ra: mô hình kinh doanh, cơ cấu nguồn lợi nhuận, lợi thế cạnh tranh, rủi ro trọng yếu | M | M2 |
| FR-FUND-05 | **Mọi nhận định do AI rút ra phải kèm trích dẫn nguồn** (tên báo cáo + số trang) để người dùng đối chiếu | M | M2 |
| FR-FUND-06 | Mọi con số, tỷ lệ, điểm số phải do công thức tính ra — **không được sinh bởi AI** | M | M2 |
| FR-FUND-07 | Hệ thống hiển thị **Chỉ số Chất lượng Công bố Thông tin**: số lần bị điều chỉnh hồi tố, biên độ chênh lệch, độ trễ công bố so với hạn quy định | S | M2 |
| FR-FUND-08 | Hệ thống so sánh doanh nghiệp với trung vị ngành trên từng chỉ số | S | M2 |
| FR-FUND-09 | Hệ thống phân tầng mã theo chất lượng dữ liệu; mã không đủ dữ liệu **phải hiển thị rõ "không đủ căn cứ chấm điểm"** thay vì chấm bừa | M | M2 |
| FR-FUND-10 | Mã UPCOM đạt tiêu chí (BCTC kiểm toán ≥ 3 năm liên tiếp, công bố đúng hạn, thanh khoản và vốn hoá đạt ngưỡng, không bị cảnh báo/hạn chế giao dịch) được **tự động nâng lên nhóm phân tích đầy đủ**; đánh giá lại hàng quý | S | M2 |

### 4.3 Phân tích kỹ thuật (Lớp 2)

| ID | Yêu cầu | Ưu tiên | Mốc |
|---|---|---|---|
| FR-TECH-01 | Hệ thống phân tích theo **4 trường phái**: Wyckoff (giá–khối lượng), Stage Analysis, CANSLIM/Minervini (nền giá và breakout), chỉ báo cổ điển (MA, RSI, MACD, Bollinger) | M | M1 |
| FR-TECH-02 | Hệ thống hiển thị **song song** kết luận của từng trường phái, không gộp thành một kết luận duy nhất | M | M1 |
| FR-TECH-03 | Hệ thống hiển thị **thước Đồng thuận** (ví dụ "3/4 đồng thuận tăng") và cảnh báo rõ khi tín hiệu trái chiều | M | M1 |
| FR-TECH-04 | Hệ thống xác định **giai đoạn hiện tại** của cổ phiếu và giải thích căn cứ | M | M1 |
| FR-TECH-05 | Biểu đồ giá–khối lượng có thể phóng to, đổi khung thời gian, bật/tắt từng chỉ báo | M | M1 |
| FR-TECH-06 | Mọi tính toán kỹ thuật sử dụng giá điều chỉnh theo FR-DATA-04 | M | M1 |

### 4.4 Phân tích vĩ mô & ngành (Lớp 3)

| ID | Yêu cầu | Ưu tiên | Mốc |
|---|---|---|---|
| FR-MACRO-01 | Hệ thống theo dõi **lãi suất và tiền tệ**: lãi suất điều hành, huy động, cho vay, lợi suất trái phiếu chính phủ, tăng trưởng tín dụng | M | M3 |
| FR-MACRO-02 | Hệ thống theo dõi **giá hàng hoá** đầu vào/đầu ra liên quan tới các ngành trong phạm vi | M | M3 |
| FR-MACRO-03 | Hệ thống theo dõi **tỷ giá và xuất nhập khẩu** | M | M3 |
| FR-MACRO-04 | Hệ thống theo dõi **vĩ mô tổng thể và dòng tiền thị trường**: GDP, CPI, PMI, FDI, bán lẻ, đầu tư công, giao dịch khối ngoại, tự doanh, thanh khoản toàn thị trường | M | M3 |
| FR-MACRO-05 | Hệ thống duy trì **bản đồ Ngành ↔ Yếu tố vĩ mô**, xác định mỗi ngành hưởng lợi hay chịu thiệt khi từng yếu tố biến động | M | M3 |
| FR-MACRO-06 | Với mỗi cổ phiếu, hệ thống hiển thị các yếu tố vĩ mô đang **thuận lợi** và **bất lợi**, kèm mức độ tác động | M | M3 |
| FR-MACRO-07 | Khi điểm cơ bản cao nhưng giá giảm (hoặc ngược lại), hệ thống hiển thị **mục giải thích mâu thuẫn** dựa trên dữ kiện vĩ mô và ngành | M | M3 |

### 4.5 Cảnh báo

| ID | Yêu cầu | Ưu tiên | Mốc |
|---|---|---|---|
| FR-ALERT-01 | Cảnh báo **kỹ thuật tự động**: vượt đỉnh/thủng đáy, break nền tích luỹ, cắt đường trung bình quan trọng, khối lượng đột biến, phân kỳ | M | M1 |
| FR-ALERT-02 | Cảnh báo **ngưỡng giá thủ công** do người dùng tự đặt | M | M1 |
| FR-ALERT-03 | Cảnh báo **cơ bản**: doanh nghiệp công bố BCTC mới, lợi nhuận biến động mạnh, thay đổi ban lãnh đạo, giao dịch cổ đông nội bộ, phát hành thêm | M | M2 |
| FR-ALERT-04 | Cảnh báo **vĩ mô/ngành** ảnh hưởng tới mã trong danh sách theo dõi | M | M3 |
| FR-ALERT-05 | Người dùng **bật/tắt độc lập từng loại cảnh báo** | M | M1 |
| FR-ALERT-06 | Cảnh báo kỹ thuật và ngưỡng giá gửi trong phiên, độ trễ ≤ 60 giây | M | M1 |
| FR-ALERT-07 | Cảnh báo cơ bản và vĩ mô gửi trong ngày, không yêu cầu thời gian thực | M | M2 |
| FR-ALERT-08 | Mỗi cảnh báo nêu rõ **điều kiện nào đã kích hoạt nó** | M | M1 |
| FR-ALERT-09 | Hệ thống chống trùng lặp: không phát lại cùng một tín hiệu trên cùng một mã trong cùng phiên | M | M1 |
| FR-ALERT-10 | Người dùng xem được lịch sử cảnh báo đã nhận | S | M1 |

### 4.6 Danh sách theo dõi & hiển thị

| ID | Yêu cầu | Ưu tiên | Mốc |
|---|---|---|---|
| FR-WATCH-01 | Người dùng thêm/xoá mã vào danh sách theo dõi; tạo được nhiều danh sách | M | M1 |
| FR-WATCH-02 | Danh sách theo dõi đồng bộ theo tài khoản, dùng được trên nhiều thiết bị | M | M4 |
| FR-UI-01 | Ứng dụng có **chế độ Đơn giản** và **chế độ Chuyên sâu**; người dùng chọn khi onboarding và đổi được trong cài đặt | M | M1 |
| FR-UI-02 | Chế độ Đơn giản ưu tiên kết luận trực quan, hạn chế thuật ngữ, có giải thích khi chạm vào | M | M2 |
| FR-UI-03 | Chế độ Chuyên sâu hiển thị đầy đủ số liệu thô, chỉ số cấu thành, tham số tuỳ biến | M | M2 |
| FR-UI-04 | Mọi thuật ngữ chuyên môn có chú giải truy cập được ngay tại chỗ | S | M2 |

### 4.7 Backtest & minh bạch

| ID | Yêu cầu | Ưu tiên | Mốc |
|---|---|---|---|
| FR-BT-01 | Mỗi loại tín hiệu kỹ thuật hiển thị thống kê lịch sử: số lần xuất hiện, tỷ lệ đúng, mức lãi/lỗ trung bình sau N phiên | M | M4 |
| FR-BT-02 | Thống kê nêu rõ khoảng thời gian và tập mã dùng để kiểm chứng | M | M4 |
| FR-BT-03 | Hệ thống ghi nhận **mọi cảnh báo đã phát ra** và tự chấm điểm kết quả thực tế theo thời gian | S | M4 |

### 4.8 Tài khoản, thuê bao & tuân thủ

| ID | Yêu cầu | Ưu tiên | Mốc |
|---|---|---|---|
| FR-AUTH-01 | Người dùng đăng ký, đăng nhập, khôi phục mật khẩu | M | M4 |
| FR-AUTH-02 | Hệ thống quản lý trạng thái thuê bao và mở/khoá tính năng theo gói | M | M4 |
| FR-AUTH-03 | Người dùng có thời gian dùng thử trước khi trả phí | S | M4 |
| FR-COMP-01 | Mọi kết luận sử dụng **ngôn ngữ tín hiệu trung tính**; **cấm** dùng chữ "nên mua", "nên bán", "khuyến nghị mua/bán" | M | M1 |
| FR-COMP-02 | Mọi màn hình phân tích hiển thị tuyên bố miễn trừ: đây là công cụ thông tin, không phải tư vấn đầu tư; người dùng tự chịu trách nhiệm với quyết định của mình | M | M1 |
| FR-COMP-03 | Người dùng xác nhận đã đọc và hiểu tuyên bố miễn trừ khi đăng ký tài khoản | M | M4 |
| FR-COMP-04 | Toàn bộ nội dung phân tích được luật sư chứng khoán rà soát **trước** khi phát hành công khai | M | M4 |

---

## 5. Yêu cầu dữ liệu

| Nhóm dữ liệu | Nội dung | Tần suất cập nhật |
|---|---|---|
| Giá & khối lượng | OHLCV, giá điều chỉnh, hệ số điều chỉnh, sự kiện quyền | Thời gian thực trong phiên |
| Báo cáo tài chính | Bảng cân đối kế toán, kết quả kinh doanh, lưu chuyển tiền tệ, thuyết minh — cả bản công bố đầu và bản điều chỉnh | Theo quý |
| Báo cáo thường niên | Toàn văn + kết quả trích xuất AI + trích dẫn số trang | Theo năm |
| Hồ sơ doanh nghiệp | Ngành nghề, vốn hoá, cơ cấu sở hữu, ban lãnh đạo, lịch sự kiện | Theo tháng |
| Vĩ mô | 4 nhóm theo FR-MACRO-01 đến FR-MACRO-04 | Theo tháng/tuần tuỳ chỉ số |
| Hàng hoá | Giá đầu vào/đầu ra theo ngành | Hàng ngày |

---

## 6. Yêu cầu phi chức năng

> ⚠️ Toàn bộ chỉ tiêu trong mục này hiện là **giả định của BA**, chờ PO xác nhận (xem A3 tại mục 9).

| ID | Yêu cầu | Chỉ tiêu |
|---|---|---|
| NFR-01 | Độ trễ cảnh báo kỹ thuật | ≤ 60 giây kể từ khi điều kiện thoả mãn |
| NFR-02 | Thời gian mở màn hình phân tích một mã | ≤ 2 giây |
| NFR-03 | Số người dùng đồng thời hỗ trợ ở bản đầu | 500 |
| NFR-04 | Uptime trong giờ giao dịch | ≥ 99% |
| NFR-05 | Hoạt động khi mất mạng | Hiển thị dữ liệu đã tải gần nhất, kèm nhãn thời điểm |
| NFR-06 | Bảo mật tài khoản | Mật khẩu băm, phiên đăng nhập có hạn; 2FA là *nên có* |
| NFR-07 | Nền tảng | iOS 14+ / Android 8+ |
| NFR-08 | Ngôn ngữ | Tiếng Việt |
| NFR-09 | Chi phí vận hành | ≤ 6.000.000đ/tháng |
| NFR-10 | Xử lý lỗi nguồn dữ liệu | Hiển thị trạng thái rõ ràng; **không hiển thị số liệu cũ như thể là mới** |

---

## 7. Ràng buộc

| # | Ràng buộc |
|---|---|
| C1 | Nguồn dữ liệu cơ bản là bên thứ ba, có rủi ro gián đoạn — bắt buộc thiết kế lớp trừu tượng theo FR-DATA-03 |
| C2 | Nguồn giá thời gian thực phụ thuộc điều khoản của công ty chứng khoán; cần xác minh quyền sử dụng lại dữ liệu trong sản phẩm thu phí |
| C3 | Ngân sách vận hành 5–6 triệu đồng/tháng |
| C4 | Nguồn lực phát triển: 1 người, làm ngoài giờ |
| C5 | Ràng buộc pháp lý về hoạt động tư vấn đầu tư chứng khoán tại Việt Nam (Luật Chứng khoán 2019) |

---

## 8. Tiêu chí chấp nhận

Sản phẩm được coi là đạt yêu cầu khi:

1. Với một mã bất kỳ thuộc nhóm phân tích đầy đủ, người dùng xem được **đủ cả 3 lớp** trên cùng một màn hình.
2. Mỗi kết luận đều **truy vết được về căn cứ**: chỉ số nào, báo cáo nào, trang bao nhiêu.
3. Cảnh báo breakout đến điện thoại **trong vòng 60 giây** kể từ khi điều kiện thoả mãn, đo trên tối thiểu 20 lần thử thực tế.
4. Khi một cổ phiếu có sự kiện chia tách/chia thưởng, **không có cảnh báo sai nào** được phát ra do biến động giá mang tính kỹ thuật.
5. Với một mã có điểm cơ bản cao nhưng giá giảm, ứng dụng **đưa ra được lời giải thích dựa trên dữ kiện**, không phải câu chữ chung chung.
6. Không có bất kỳ màn hình nào chứa chữ "nên mua" hoặc "nên bán".

---

## 9. Giả định & việc còn treo

| ID | Nội dung | Trạng thái |
|---|---|---|
| A1 | **Gói thuê bao & phân quyền tính năng** — URS hiện giả định có 1 gói trả phí và 1 giai đoạn dùng thử. Cần PO chốt: có gói miễn phí vĩnh viễn không? Tính năng nào bị khoá? Mức giá? | ⏳ Chờ PO |
| A2 | **Danh sách nhóm ngành ở bản đầu** — URS giả định phủ toàn bộ ngành, bao gồm nhóm tài chính. Cần PO chốt số nhóm cụ thể | ⏳ Chờ PO |
| A3 | **Yêu cầu phi chức năng** (mục 6) — toàn bộ chỉ tiêu là giả định của BA | ⏳ Chờ PO |
| A4 | Chế độ hiển thị do người dùng tự chọn khi onboarding | Giả định BA |
| A5 | Tên sản phẩm chưa đặt | Chưa quyết |
| A6 | Điều khoản API của VPS chưa xác minh: (a) có API công khai có tài liệu không, (b) điều kiện sử dụng và giới hạn số lần gọi, (c) độ trễ thực tế, (d) có cho phép dùng dữ liệu trong sản phẩm thu phí không | ⏳ Cần khảo sát |

---

# PHỤ LỤC

## Phụ lục A — Nhật ký quyết định

| # | Hạng mục | Quyết định |
|---|---|---|
| D1 | Thị trường | HOSE / HNX / UPCOM |
| D2 | Người dùng | NĐT cá nhân F0 + có kinh nghiệm (2 chế độ hiển thị) |
| D3 | Nguồn dữ liệu | Tham chiếu wichart.vn |
| D4 | Vai trò AI | Hybrid — chỉ số và tín hiệu theo rule; AI đọc BCTC/BCTN để rút điểm quan trọng |
| D5 | Hướng dữ liệu | Crawl wichart.vn *(PO đã cân nhắc rủi ro và quyết định)* |
| D6 | Phạm vi | Cả 3 lớp, mức sâu |
| D7 | Nền tảng | Mobile Flutter (iOS + Android); backend xử lý toàn bộ phần nặng |
| D8 | Cảnh báo | 4 nhóm, bật/tắt từng loại |
| D9 | Khung chấm cơ bản | Điểm 0–100 theo 5 trụ |
| D10 | Đặc thù ngành | Mỗi nhóm ngành một bộ chỉ số riêng |
| D11 | Trường phái PTKT | Wyckoff + Stage Analysis + CANSLIM/Minervini + chỉ báo cổ điển |
| D12 | Độ sâu lịch sử | Giá/KL toàn bộ · BCTC 10 năm · vĩ mô toàn bộ |
| D13 | Xung đột tín hiệu | Hiển thị song song + thước Đồng thuận |
| D14 | Độ trễ cảnh báo | Thời gian thực, dưới 1 phút |
| D15 | Ngôn ngữ kết luận | Trung tính theo tín hiệu + tuyên bố miễn trừ |
| D16 | Lớp vĩ mô | 4 nhóm: lãi suất & tiền tệ, giá hàng hoá, tỷ giá & XNK, vĩ mô tổng thể & dòng tiền |
| D17 | Gỡ xung đột D5↔D14 | Tách nguồn: giá/KL thời gian thực từ API CTCK; BCTC + vĩ mô từ wichart |
| D18 | Danh mục người dùng | Chỉ danh sách theo dõi (chưa quản lý giá vốn, lãi/lỗ) |
| D19 | Mô hình kinh doanh | Thuê bao toàn phần |
| D20 | Độ tin cậy tín hiệu | Backtest công khai |
| D21 | Độ phủ mã | Phân tầng theo chất lượng dữ liệu; UPCOM đủ chuẩn được tự động nâng hạng |
| D22 | Nguồn lực | 1 người (PO kiêm dev), có nền tài chính–chứng khoán, làm ngoài giờ |
| D23 | Ngân sách vận hành | 5–6 triệu đồng/tháng |
| D24 | Thời gian | Chưa ấn định |
| D25 | Nguồn giá thời gian thực | API của Chứng khoán VPS |
| D26 | Chuỗi giá | Giá điều chỉnh cho mọi phân tích kỹ thuật; giá thô chỉ dùng khi hiển thị lịch sử khớp lệnh |
| D27 | BCTC hồi tố | Giữ cả hai phiên bản — số công bố ban đầu và số sau điều chỉnh |

---

## Phụ lục B — Kiến trúc hệ thống

```
┌─ NGUỒN DỮ LIỆU ────────────────────────────────────────┐
│  API CTCK VPS (realtime)     │  Crawler wichart.vn     │
│  giá / khối lượng            │  BCTC, BCTN, vĩ mô      │
└────────────┬──────────────────────────┬────────────────┘
             ▼                          ▼
      ┌──────────── DataSourceAdapter ─────────────────────┐
      │  Lớp trừu tượng — logic phân tích KHÔNG biết       │
      │  dữ liệu đến từ đâu. Đổi nguồn = thay 1 module.    │
      └────────────┬───────────────────────────────────────┘
                   ▼
      ┌──────── KHO DỮ LIỆU (PostgreSQL + TimescaleDB) ────┐
      │  Giá/KL (time-series)  │  BCTC chuẩn hoá (2 bản)   │
      │  Vĩ mô & hàng hoá      │  Kết quả AI đọc BCTN      │
      └────────────┬───────────────────────────────────────┘
                   ▼
   ┌──────── ĐỘNG CƠ PHÂN TÍCH (backend, chạy nền) ────────┐
   │  L1 Cơ bản: 5 trụ × bộ chỉ số theo ngành → điểm 0–100 │
   │  L2 Kỹ thuật: Wyckoff│Stage│CANSLIM│Chỉ báo → Đồng thuận│
   │  L3 Vĩ mô: bản đồ Ngành ↔ Hàng hoá ↔ Lãi suất ↔ Tỷ giá│
   │  ─────────────────────────────────────────────────────│
   │  Bộ quét cảnh báo (thời gian thực trong phiên)        │
   │  Bộ backtest (chấm điểm lịch sử từng loại tín hiệu)   │
   └────────────┬──────────────────────────────────────────┘
                ▼
   ┌──────── API + PUSH (Firebase Cloud Messaging) ───────┐
                ▼
   ┌──────── APP FLUTTER (thin client) ───────────────────┐
   │  Chế độ Đơn giản (F0)  │  Chế độ Chuyên sâu          │
   │  Watchlist · Biểu đồ · Cảnh báo · Tài khoản/Thuê bao │
   └───────────────────────────────────────────────────────┘
```

### Nguyên tắc kiến trúc bắt buộc

> **Con số do code tính — chữ nghĩa do AI đọc.**
> Mọi chỉ số tài chính, điểm số, tín hiệu kỹ thuật đều tính bằng công thức, kiểm chứng và tái lập được.
> AI chỉ đọc phần văn bản (thuyết minh BCTC, báo cáo thường niên) để rút insight, và **mọi insight phải kèm trích dẫn số trang** để người dùng đối chiếu được.

### Chiến lược AI phân tầng theo độ khó

| Việc | Model | Cách tối ưu chi phí |
|---|---|---|
| Bóc tách BCTC/BCTN hàng loạt | Sonnet 5 | Batch API (giảm 50%) + prompt caching |
| Tổng hợp lợi thế cạnh tranh / mô hình kinh doanh | Opus 5 | Chỉ chạy cho nhóm 1 và chỉ khi có BCTN mới |
| Diễn giải kết quả cho người dùng F0 | Haiku 4.5 | Chạy trên kết quả đã tính sẵn |

Ba kỹ thuật bắt buộc để giữ chi phí thấp:
1. **Prompt caching** — bộ khung hướng dẫn phân tích được cache, đọc từ cache chỉ tốn khoảng 10% giá gốc
2. **Batch API** — giảm 50% cho toàn bộ việc chạy nền
3. **Chỉ chạy lại khi có dữ liệu mới** — BCTC ra theo quý, không chạy lại mỗi ngày

**Lưu ý kỹ thuật:** API không cho phép dùng đồng thời *trích dẫn nguồn* và *định dạng JSON có ràng buộc schema* trong cùng một request. Vì FR-FUND-05 yêu cầu trích dẫn, cần tách 2 lượt gọi: lượt 1 lấy insight kèm trích dẫn trang, lượt 2 chuẩn hoá thành JSON.

---

## Phụ lục C — Lộ trình bàn giao

| Mốc | Nội dung | Ước lượng | Kết quả bàn giao |
|---|---|---|---|
| **M0 — Nền móng** | DataSourceAdapter · cơ sở dữ liệu · crawler · kết nối API VPS · backfill giá điều chỉnh | 6–8 tuần | Dữ liệu chạy vào kho, xem được bằng script |
| **M1 — Lớp Kỹ thuật + Cảnh báo** | 4 trường phái PTKT · thước Đồng thuận · bộ quét thời gian thực · app Flutter + watchlist + push | 10–14 tuần | **Ứng dụng chạy được.** Cảnh báo đến điện thoại |
| **M2 — Lớp Cơ bản** | Pipeline AI đọc BCTC/BCTN · 5 trụ · bộ chỉ số theo ngành · điểm 0–100 · phân tầng và nâng hạng UPCOM | 14–18 tuần | Điểm sức khoẻ DN + insight có trích dẫn |
| **M3 — Lớp Vĩ mô** | 4 nhóm dữ liệu · bản đồ Ngành↔Vĩ mô · giải thích mâu thuẫn giá–nền tảng | 8–12 tuần | **Điểm khác biệt cốt lõi hoàn chỉnh** |
| **M4 — Thương mại hoá** | Backtest công khai · tài khoản & thuê bao · rà soát pháp lý · phát hành lên store | 8–10 tuần | Sản phẩm sẵn sàng bán |

**Tổng ước lượng:** 2.500–3.500 giờ công. Với 15–20 giờ/tuần tương đương **12–18 tháng**.

**Nguyên tắc khi phải đánh đổi:** giữ nguyên phạm vi, giãn thời gian, **không giảm độ sâu phân tích** — vì độ sâu chính là lý do sản phẩm tồn tại.

---

## Phụ lục D — Dự toán chi phí vận hành

### Chi phí thường xuyên hàng tháng

| Hạng mục | Chi phí |
|---|---|
| Máy chủ VPS (backend + crawler + bộ quét) | 1.200.000đ |
| PostgreSQL + TimescaleDB (chung máy chủ giai đoạn đầu) | 0đ |
| API giá thời gian thực từ CTCK | 0đ *(cần xác minh — mục A6)* |
| AI đọc BCTC định kỳ (~130 báo cáo/tháng, Batch + cache) | ~400.000đ |
| AI tổng hợp chuyên sâu (chạy theo mùa báo cáo thường niên) | ~300.000đ |
| Push notification (Firebase Cloud Messaging) | 0đ |
| Lưu trữ file BCTC gốc | ~200.000đ |
| **Tổng** | **~2.100.000đ/tháng** |

✅ Nằm trong ngân sách 5–6 triệu, còn dư khoảng 3–4 triệu cho tăng trưởng người dùng.

### Chi phí một lần

| Hạng mục | Chi phí |
|---|---|
| Backfill lịch sử BCTC (VN100, 3 năm gần nhất, qua Batch API) | 4.000.000 – 6.000.000đ |

Đề xuất chia nhỏ theo từng đợt để dòng tiền dễ chịu, mở rộng dần theo nhu cầu thực tế.

---

## Phụ lục E — Đăng ký rủi ro

| # | Rủi ro | Mức | Biện pháp giảm thiểu |
|---|---|---|---|
| R1 | Nguồn dữ liệu cơ bản chặn crawler | **Cao** | DataSourceAdapter cho phép đổi nguồn nhanh; crawl chậm 1 lần/ngày; lưu bản gốc để không phải thu thập lại |
| R2 | Rủi ro pháp lý — thuê bao + phân tích có bị coi là tư vấn đầu tư | **Cao** | FR-COMP-01/02 ngôn ngữ trung tính; thuê luật sư chứng khoán rà soát trước M4 |
| R3 | Kiệt sức — 1 người, 12–18 tháng làm ngoài giờ | **Cao** | Chia mốc ngắn, mỗi mốc có thành phẩm chạy được; ưu tiên M1 để sớm thấy kết quả |
| R4 | AI đọc sai BCTC dẫn tới mất uy tín | Trung bình | Bắt buộc trích dẫn số trang (FR-FUND-05); con số luôn do code tính (FR-FUND-06) |
| R5 | Backtest cho kết quả kém | Trung bình | Phát hiện sớm là có lợi — loại bỏ tín hiệu kém trước khi có người dùng thật |
| R6 | Điều khoản API VPS không cho phép dùng trong sản phẩm thu phí | Trung bình | Xác minh sớm (A6); DataSourceAdapter cho phép chuyển sang CTCK khác |

---

*Hết tài liệu — URS v1.0*
