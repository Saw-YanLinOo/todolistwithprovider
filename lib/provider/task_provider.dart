import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todolistwithprovider/model/task.dart';

class TaskProvider extends ChangeNotifier{

  final List<Task> _taskList = [
    Task(id: '1', title: 'today is free', description: 'Nothing',time: DateTime.now()),
    Task(id: '2', title: 'task2', description: 'show',time: DateTime.now()),
    Task(id: '3', title: 'task3', description: 'playing',time: DateTime.now()),
  ];

  UnmodifiableListView<Task> get taskList => UnmodifiableListView(_taskList);

  int get length => _taskList.length;

  void updateIsDone(Task task){
    task.toggleDone();
    notifyListeners();
  }

  void delete(Task task){
    _taskList.remove(task);
    notifyListeners();
  }

  void addTask(Task task){
    _taskList.add(task);
    notifyListeners();
  }

  void filterList({required DateTime date}){
    _taskList
        .where((element) => element.time == date)
        .forEach((e) {
          _taskList.add(e);
    });
    notifyListeners();
  }
}