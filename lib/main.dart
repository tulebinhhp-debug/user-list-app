import 'dart:convert';                                          // (1) để đóng/mở gói JSON
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';    // (2) thư viện lưu vào máy

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
  title: 'Danh mục CP',
  theme: ThemeData(
    colorSchemeSeed: Colors.indigo,   // đổi màu chủ đạo (thử green, teal, deepPurple...)
    useMaterial3: true,
  ),
  home: const StockPage(),
);
  }
}

// Khuôn mẫu 1 cổ phiếu
class CoPhieu {
  String ma;
  double gia;
  int soLuong;
  CoPhieu(this.ma, this.gia, this.soLuong);

  // (3) đóng gói 1 cổ phiếu -> Map (để chuyển sang JSON)
  Map<String, dynamic> toMap() => {'ma': ma, 'gia': gia, 'soLuong': soLuong};

  // (4) mở gói Map -> tạo lại 1 cổ phiếu
  factory CoPhieu.fromMap(Map<String, dynamic> m) =>
      CoPhieu(m['ma'], (m['gia'] as num).toDouble(), (m['soLuong'] as num).toInt());
}

class StockPage extends StatefulWidget {
  const StockPage({super.key});
  @override
  State<StockPage> createState() => _StockPageState();
}

class _StockPageState extends State<StockPage> {
  List<CoPhieu> danhMuc = [
    CoPhieu('GEX', 40.55, 5000),
    CoPhieu('DHC', 35.20, 2000),
  ];

  // (5) chạy TỰ ĐỘNG khi mở app -> đọc data đã lưu
  @override
  void initState() {
    super.initState();
    _docDanhMuc();
  }

  // (6) LƯU danh mục vào máy
  Future<void> _luuDanhMuc() async {
    final prefs = await SharedPreferences.getInstance();
    final chuoi = jsonEncode(danhMuc.map((cp) => cp.toMap()).toList());
    await prefs.setString('danhMuc', chuoi);
  }

  // (7) ĐỌC danh mục từ máy ra
  Future<void> _docDanhMuc() async {
    final prefs = await SharedPreferences.getInstance();
    final chuoi = prefs.getString('danhMuc');
    if (chuoi != null) {
      final list = jsonDecode(chuoi) as List;
      setState(() {
        danhMuc = list.map((e) => CoPhieu.fromMap(e)).toList();
      });
    }
  }

  void _showForm({int? index}) {
    final maCtrl = TextEditingController(text: index != null ? danhMuc[index].ma : '');
    final giaCtrl = TextEditingController(text: index != null ? '${danhMuc[index].gia}' : '');
    final slCtrl = TextEditingController(text: index != null ? '${danhMuc[index].soLuong}' : '');
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(index == null ? 'Thêm mã CP' : 'Sửa mã CP'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: maCtrl, decoration: const InputDecoration(labelText: 'Mã CP')),
            TextField(controller: giaCtrl, decoration: const InputDecoration(labelText: 'Giá mua'), keyboardType: TextInputType.number),
            TextField(controller: slCtrl, decoration: const InputDecoration(labelText: 'Số lượng'), keyboardType: TextInputType.number),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Hủy')),
          TextButton(
            onPressed: () {
              setState(() {
                final cp = CoPhieu(
                  maCtrl.text,
                  double.tryParse(giaCtrl.text) ?? 0,
                  int.tryParse(slCtrl.text) ?? 0,
                );
                if (index == null) {
                  danhMuc.add(cp);
                } else {
                  danhMuc[index] = cp;
                }
              });
              _luuDanhMuc();          // (8) LƯU sau khi thêm/sửa
              Navigator.pop(context);
            },
            child: const Text('Lưu'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double tongVon = 0;
    for (var cp in danhMuc) {
      tongVon = tongVon + cp.gia * cp.soLuong;
    }
    return Scaffold(
      appBar: AppBar(title: Text('Danh mục — Tổng ${(tongVon / 1000).toStringAsFixed(2)} triệu')),
      body: ListView.builder(
        itemCount: danhMuc.length,
        itemBuilder: (_, i) {
          final cp = danhMuc[i];

          return Card(
  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
  child: ListTile(
            leading: const Icon(Icons.show_chart),
            title: Text(cp.ma),
            subtitle: Text(
              'Giá ${cp.gia} | SL ${cp.soLuong} | Vốn ${(cp.gia * cp.soLuong / 1000).toStringAsFixed(2)} triệu',
              style: TextStyle(
                color: (cp.gia * cp.soLuong / 1000) >= 100 ? Colors.red : Colors.green,
              ),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(icon: const Icon(Icons.edit), onPressed: () => _showForm(index: i)),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    setState(() => danhMuc.removeAt(i));
                    _luuDanhMuc();     // (9) LƯU sau khi z
                  },
                ),
              ],
            ),
            ),
        );
      },
),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showForm(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
