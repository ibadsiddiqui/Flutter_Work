import 'package:flutter/material.dart';
import 'package:todos/model/task.dart';
import 'package:todos/widgets/task_ist_item.dart';

class TaskList extends StatelessWidget {
  final List<TaskModel> tasks;

  const TaskList({Key key, this.tasks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(children: getChildrenTasks());
  }

  List<Widget> getChildrenTasks() {
    return tasks.map((todo) => TaskListItem(task: todo)).toList();
  }
}
