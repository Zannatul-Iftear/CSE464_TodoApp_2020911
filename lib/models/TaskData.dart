import 'dart:collection';

import 'package:flutter/cupertino.dart';

import 'task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'Learn Flutter'),
    Task(name: 'Procrastinate on Assignments'),
    Task(name: 'Follow Ashif bhaiyar tutorials'),
    Task(name: 'Submit Assignments 1 and 2'),
  ];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  int get completedTasks {
    int counter=0;
    for(int i=0; i<_tasks.length; i++){
      if(_tasks[i].isDone == true) {counter++;}
    }
    return counter;
  }

  void addTask(String newTaskTitle) {
    final task = Task(name: newTaskTitle);
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
