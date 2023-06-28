class TaskModel {
  final String title;
  final String taskDateTime;
  bool isDone;

  TaskModel(
      {required this.title, required this.taskDateTime, this.isDone = false});

  static List<TaskModel> myTaskList = [
    TaskModel(
      title: "ทำการบ้าน",
      taskDateTime: "อังคาร 27 มิถุนายน 14:26",
    ),
    TaskModel(title: "ทำงานกลุ่ม", taskDateTime: "อังคาร 27 มิถุนายน 16:26"),
    TaskModel(
        title: "ทำความสะอาดห้อง", taskDateTime: "อังคาร 27 มิถุนายน 19:00"),
  ];
}
