import 'package:flutter/material.dart';

class MonthlyDateProvider extends ChangeNotifier {
  DateTime _selectDate =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  DateTime _selectMonth =
      DateTime(DateTime.now().year, DateTime.now().month, 1);

  DateTime get selectDate => _selectDate;
  DateTime get selectMonth => _selectMonth;

  void changeDate(DateTime date) {
    _selectDate = date;
    notifyListeners();
  }

  void changeMonth(DateTime date) {
    _selectMonth = date;
    notifyListeners();
  }

  void changeNextMonth() {
    _selectMonth = DateTime(_selectMonth.year, _selectMonth.month + 1);
    notifyListeners();
  }

  void changePrevMonth() {
    _selectMonth = DateTime(_selectMonth.year, _selectMonth.month - 1);
    notifyListeners();
  }
}
