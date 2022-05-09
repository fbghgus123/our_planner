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
    2: Schedule(
      id: 2,
      title: "물리",
      content: "양자역학 부수기",
      color: Color(0xffFBE079),
      date: "2022-02-22",
    ),
    3: Schedule(
      id: 3,
      title: "컴퓨터",
      content: "파이썬 알고리즘",
      color: Color(0xffAAD993),
      date: "2022-02-22",
    ),
  };

  List<List<int>> _todoOrder = [
    [1, 2, 3]
  ];

  Map<int, Schedule> get todoList => _todoList;
  List<List<int>> get todoOrder => _todoOrder;

  void changeOnTable(int? id, bool value, int start, int end) {
    _todoList[id]!.onTable = value;
    _todoList[id]!.start = start;
    _todoList[id]!.end = end;
    notifyListeners();
  }
}
