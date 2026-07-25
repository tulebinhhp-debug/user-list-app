import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Danh mục CP', home: const StockPage());
  }
}

// Khuôn mẫu 1 cổ phiếu: có mã, giá, số lượng
class CoPhieu {
  String ma;
  double gia;
  int soLuong;
  CoPhieu(this.ma, this.gia, this.soLuong);
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
    appBar: AppBar(title: Text('Danh mục — Tổng ${(tongVon/1000).toStringAsFixed(2)} triệu')),
      body: ListView.builder(
        itemCount: danhMuc.length,
        itemBuilder: (_, i) {
          final cp = danhMuc[i];
          return ListTile(
            leading: const Icon(Icons.show_chart),
            title: Text(cp.ma),
            subtitle: Text('Giá ${cp.gia} | SL ${cp.soLuong} | Von ${(cp.gia * cp.soLuong / 1000).toStringAsFixed(2)} triệu',
            style: TextStyle(
    color: (cp.gia * cp.soLuong / 1000) >= 100 ? Colors.red : Colors.green,),),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(icon: const Icon(Icons.edit), onPressed: () => _showForm(index: i)),
                IconButton(icon: const Icon(Icons.delete), onPressed: () => setState(() => danhMuc.removeAt(i))),
              ],
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
