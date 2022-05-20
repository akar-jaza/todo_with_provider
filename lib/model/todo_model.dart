// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_constructors_in_immutables, unused_local_variable, prefer_const_literals_to_create_immutables

class TodoModel {
  String todoTitle;
  bool completed;

  TodoModel({required this.todoTitle, this.completed = false});

  // to toggle the task
  void toggleCompleted() {
    completed = !completed;
  }
}
