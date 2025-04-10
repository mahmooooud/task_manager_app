import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../../core/utils/hive_boxes.dart';
import '../../data/models/task_model.dart';

class TaskProvider extends ChangeNotifier {
  List<TaskModel> _tasks = [];
  bool _isDarkMode = false;
  String _searchQuery = '';
  // List<TaskModel> get tasks => _tasks;
  bool get isDarkMode => _isDarkMode;

  List<TaskModel> get tasks {
    if (_searchQuery.isEmpty) return _tasks;
    return _tasks.where((task) => task.title.toLowerCase().contains(_searchQuery.toLowerCase())).toList();
  }


  void loadTasks() {
    final box = Hive.box<TaskModel>(taskBox);
    _tasks = box.values.toList();
    notifyListeners();
  }

  void addTask(TaskModel task) {
    final box = Hive.box<TaskModel>(taskBox);
    box.add(task);
    loadTasks();
  }

  void updateTask(int index, TaskModel task) {
    final box = Hive.box<TaskModel>(taskBox);
    box.putAt(index, task);
    loadTasks();
  }

  void deleteTask(int index) {
    final box = Hive.box<TaskModel>(taskBox);
    box.deleteAt(index);
    loadTasks();
  }

  void toggleComplete(int index) {
    final box = Hive.box<TaskModel>(taskBox);
    final task = box.getAt(index);
    if (task != null) {
      task.isCompleted = !task.isCompleted;
      task.save();
      loadTasks();
    }
  }

  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}