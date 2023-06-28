import 'package:flutter/material.dart';
import 'package:todo_app/widgets/slide_bottom_sheet.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  String? formatTime;
  String? formatDate;
  String? taskTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: ListView(
                children: [],
              ),
            ),
          ),
          SlideBottomSheet(
            formatTime: formatTime,
            formatDate: formatDate,
            setDate: (date) {},
            setTime: (time) {},
            onTextChange: (title) {},
            onCreateTask: () {},
          )
        ],
      ),
    );
  }
}
