class TodoModel {
  String title;
  String task;
  DateTime dateTime;
  TodoModel({
    required this.title,
    required this.task,
    required this.dateTime,
  });

  Map<String, dynamic> tojson() => {
        'title': title,
        'task': task,
        'date': dateTime,
        'status': 'pending',
      };
}
