import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/pages/home/completed_task_page.dart';
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
      appBar: AppBar(
        title: Text("กิจกรรม"),
        leading: SizedBox(),
        titleSpacing: 0,
        leadingWidth: 10,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CompletedTaskPage(),
                ),
              );
            },
            icon: Icon(Icons.task),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: ListView(
                children: [
                  ...TaskModel.myTaskList.where(
                    (element) {
                      return element.isDone == false;
                    },
                  ).map(
                    (task) => Padding(
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
                    ),
                  ),
                ],
              ),
            ),
          ),
          SlideBottomSheet(
            formatTime: formatTime,
            formatDate: formatDate,
            setDate: (date) {
              setState(() {
                formatDate = DateFormat('dd MMMM yyyy').format(date.value);
              });
            },
            setTime: (time) {
              setState(() {
                formatTime = time.format(context);
              });
            },
            onTextChange: (title) {
              taskTitle = title;
            },
            onCreateTask: () {
              if (taskTitle != null &&
                  taskTitle != '' &&
                  formatDate != null &&
                  formatDate != '' &&
                  formatTime != null &&
                  formatTime != '') {
                setState(
                  () {
                    TaskModel.myTaskList.add(TaskModel(
                        title: taskTitle!,
                        taskDateTime: "$formatDate $formatTime"));
                  },
                );
              }
              taskTitle = '';
              formatDate = '';
              formatTime = '';
            },
          )
        ],
      ),
    );
  }
}
