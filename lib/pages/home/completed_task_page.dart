import 'package:flutter/material.dart';
import 'package:todo_app/pages/home/todo_page.dart';

import '../../models/task_model.dart';

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
          children: [
            ...TaskModel.myTaskList.where(
              (element) {
                return element.isDone == true;
              },
            ).map((task) => Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Material(
                    elevation: 3,
                    borderRadius: BorderRadius.circular(10),
                    child: ListTile(
                      leading: Checkbox(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            5,
                          ),
                        ),
                        value: task.isDone,
                        activeColor: Colors.green,
                        checkColor: Colors.white,
                        onChanged: (value) {
                          setState(() {
                            task.isDone = value!;
                          });
                        },
                      ),
                      title: Text(task.title),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(task.taskDateTime),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          setState(() {
                            TaskModel.myTaskList.remove(task);
                          });
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
