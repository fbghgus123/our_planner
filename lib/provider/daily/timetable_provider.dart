import 'package:flutter/material.dart';
import '../../model/schedule.dart';

class TimeTableProvider extends ChangeNotifier {
  List<int?> _timetable = List<int?>.generate(144, (index) => null);

  List<int?> get timetable => _timetable;

  void changeId(Map<int, Schedule> todoList) {
    _timetable = List<int?>.generate(144, (index) => null);
    todoList.forEach((key, todo) {
      for (var time = todo.start; time <= todo.end; time++) {
        _timetable[time] = todo.id;
      }
    });
    notifyListeners();
  }
}
