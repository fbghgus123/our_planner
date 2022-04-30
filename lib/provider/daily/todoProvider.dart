import 'package:flutter/material.dart';
import '../../model/schedule.dart';
import '../../provider/daily/timetable_provider.dart';

class TodoProvider extends ChangeNotifier {
  Map<int, Schedule> _todoList = {
    1: Schedule(
      id: 1,
      title: "물리",
      content: "슈뢰딩거의 우리 학습",
      color: Color(0xfff08f92),
      date: "2022-02-22",
    ),
  };

  Map<int, Schedule> get todoList => _todoList;

  void changeOnTable(
      int? id, bool value, int start, int end) {
    _todoList[id]!.onTable = value;
    _todoList[id]!.start = start;
    _todoList[id]!.end = end;
    notifyListeners();
  }
}
