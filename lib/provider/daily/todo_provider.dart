import 'package:flutter/material.dart';
import 'package:our_planner/widget/daily/daily_timetable.dart';
import '../../model/todo.dart';
import '../../provider/daily/timetable_provider.dart';
import '../../firebase/todo.dart';

class TodoProvider extends ChangeNotifier {
  late String userid;
  late DateTime date;
  late TodoDB _todoDB;

  TodoProvider(this.userid, this.date) {
    _todoDB = TodoDB(userid, date, setTodoList);
    _todoDB.getTodos();
  }

  Map<String, Todo> _todoList = {};
  List<List<int>> _todoOrder = [
    [1, 2, 3]
  ];

  Map<String, Todo> get todoList => _todoList;
  List<List<int>> get todoOrder => _todoOrder;

  void changeOnTable(String id, bool value, int start, int end) {
    _todoDB.updateTodoTime(id, value, start, end);
  }

  void setTodoList(Map<String, Todo> newTodoList) {
    _todoList = newTodoList;
    notifyListeners();
  }

  void addTodo() {
    _todoDB.addTodo();
  }
}
