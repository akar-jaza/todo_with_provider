// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_constructors_in_immutables, unused_local_variable, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'todo_model.dart';
//import dart:collection for UnmodifiableListView class
import 'dart:collection';

class TodoProvider with ChangeNotifier {
  List<TodoModel> _tasks = [];

  //to get all the tasks, It is an unmodifiable view because we don't
  //want a random widget to put the cart into a bad state. https://cutt.ly/NHSpRBq
  UnmodifiableListView<TodoModel> get allTasks => UnmodifiableListView(_tasks);

  //all new added task must be uncompleted
  void addTask(String task) {
    _tasks.add(TodoModel(todoTitle: task, completed: false));
    notifyListeners();
  }

  /*we are not working with task id that why we are working with every
  tasks index number to modify.
  indexOf: Returns the first index of the first element in the list that equals to a given element.
  Returns -1 if nothing found. */

  void toggleTask(TodoModel task) {
    final taskIndex = _tasks.indexOf(task);
    _tasks[taskIndex].toggleCompleted();
    notifyListeners();
  }

  void deleteTask(TodoModel task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
