import 'package:flutter/material.dart';

class TimeTableProvider extends ChangeNotifier {
  List<List<Color?>> _timetable = List<List<Color?>>.generate(
      24, (index) => List<Color?>.generate(6, (index) => null));

  List<List<Color?>> get timetable => _timetable;

  void changeColor(int i, int j, Color? color) {
    _timetable[i][j] = color;
    notifyListeners();
  }
}
