import 'package:flutter/material.dart';
import 'package:todo_app/models/task_model.dart';

class TaskBox extends StatefulWidget {
  final TaskModel task;
  final VoidCallback onDelete;
  final Function(bool? value) onCheckDone;
  const TaskBox(
      {super.key,
      required this.task,
      required this.onDelete,
      required this.onCheckDone});

  @override
  State<TaskBox> createState() => _TaskBoxState();
}

class _TaskBoxState extends State<TaskBox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
            value: widget.task.isDone,
            activeColor: Colors.green,
            checkColor: Colors.white,
            onChanged: widget.onCheckDone,
          ),
          title: Text(widget.task.title),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(widget.task.taskDateTime),
          ),
          trailing: IconButton(
            onPressed: widget.onDelete,
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
