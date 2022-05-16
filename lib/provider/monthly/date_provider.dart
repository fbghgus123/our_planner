import 'package:flutter/material.dart';

class MonthlyDateProvider extends ChangeNotifier {
  late DateTime _selectDate;
  late DateTime _selectMonth;

  MonthlyDateProvider({DateTime? selectDate}) {
    _selectDate = selectDate ??
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    _selectMonth = DateTime(_selectDate.year, _selectDate.month, 1);
  }

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
