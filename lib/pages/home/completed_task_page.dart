import 'package:flutter/material.dart';
import 'package:todo_app/pages/home/todo_page.dart';

class CompletedTaskPage extends StatefulWidget {
  const CompletedTaskPage({super.key});

  @override
  State<CompletedTaskPage> createState() => _CompletedTaskPageState();
}

class _CompletedTaskPageState extends State<CompletedTaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TodoPage(),
              ),
            );
          },
          icon: const Icon(Icons.chevron_left),
        ),
        title: Text("กิจกรรมที่เสร็จเเล้ว"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: ListView(
          children: [],
        ),
      ),
    );
  }
}
