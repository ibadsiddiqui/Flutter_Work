import 'dart:collection';

import 'package:todos/model/task.dart';

class TodosModel {
  final List<TaskModel> _tasks = List();

  UnmodifiableListView<TaskModel> get allTask => UnmodifiableListView(_tasks);
  UnmodifiableListView<TaskModel> get incompleteTasks =>
      UnmodifiableListView(_tasks.where((todo) => !todo.completed));
  UnmodifiableListView<TaskModel> get completedTask =>
      UnmodifiableListView(_tasks.where((todo) => todo.completed));

  void addTodo(TaskModel task) {
    _tasks.add(task);
    // notifyListeners();
  }

  void toggleTodo(TaskModel task) {
    final taskIndex = _tasks.indexOf(task);
    _tasks[taskIndex].toggleCompleted();
    // notifyListeners();
  }

  void deleteTodo(TaskModel task) {
    _tasks.remove(task);
    // notifyListeners();
  }
}
