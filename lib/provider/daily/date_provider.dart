import 'package:flutter/material.dart';

class DateProvider extends ChangeNotifier {
  late DateTime _selectDate;
  
  DateProvider ({ DateTime? selectDate }) {
    _selectDate = selectDate ?? DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  }

  DateTime get selectDate => _selectDate;

  void changeDate(DateTime date) {
    _selectDate = date;
    notifyListeners();
  }

  void changeNextDay() {
    _selectDate =
        DateTime(_selectDate.year, _selectDate.month, _selectDate.day + 1);
    notifyListeners();
  }

  void changePrevDay() {
    _selectDate =
        DateTime(_selectDate.year, _selectDate.month, _selectDate.day - 1);
    notifyListeners();
  }
}
