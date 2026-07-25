import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User List',
      home: const UserListPage(),
    );
  }
}

class UserListPage extends StatefulWidget {
  const UserListPage({super.key});
  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  // Danh sách user (dữ liệu nằm trong bộ nhớ)
  List<String> users = ['Nguyễn Văn A', 'Trần Thị B'];

  // Hộp thoại thêm/sửa user
  void _showForm({int? index}) {
    final controller = TextEditingController(
      text: index != null ? users[index] : '',
    );
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(index == null ? 'Thêm user' : 'Sửa user'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(hintText: 'Nhập tên'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Hủy'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                if (index == null) {
                  users.add(controller.text);        // CREATE
                } else {
                  users[index] = controller.text;    // UPDATE
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
    return Scaffold(
      appBar: AppBar(title: const Text('Quản lý User')),
      body: ListView.builder(              // READ - hiện danh sách
        itemCount: users.length,
        itemBuilder: (_, i) => ListTile(
          leading: const Icon(Icons.person),
          title: Text(users[i]),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () => _showForm(index: i),   // sửa
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () => setState(() => users.removeAt(i)), // DELETE
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showForm(),       // thêm
        child: const Icon(Icons.add),
      ),
    );
  }
}
