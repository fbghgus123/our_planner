import 'package:flutter/material.dart';

import '../../model/todo.dart';
import '../../provider/daily/todo_provider.dart';

class TimeTableProvider extends ChangeNotifier {
  late Map<String, Todo>? todoList;
  late List<String?> _timetable;
  TimeTableProvider(this.todoList) {
    _timetable = List<String?>.generate(144, (index) => null);
    if (todoList != null) {
      todoList!.forEach((key, value) {
        print(value.id);
      });
      changeId(todoList!);
    }
  }

  List<String?> get timetable => _timetable;

  void changeId(Map<String, Todo> todoList) {
    _timetable = List<String?>.generate(144, (index) => null);
    todoList.forEach((key, todo) {
      for (var time = todo.start; time <= todo.end; time++) {
        if (todo.onTable) {
          _timetable[time] = todo.id;
        }
      }
    });
    print(_timetable);
    notifyListeners();
  }
}
