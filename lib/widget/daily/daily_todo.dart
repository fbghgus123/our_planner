import 'package:flutter/material.dart';
import 'package:our_planner/provider/daily/timetable_provider.dart';
import 'package:our_planner/provider/daily/todo_provider.dart';
import 'package:provider/provider.dart';

import '../../widget/daily/daily_addTodoButton.dart';
import '../../model/todo.dart';
import '../../firebase/todo.dart';
import '../../provider/daily/date_provider.dart';
import '../../provider/daily/timetable_provider.dart';
import 'daily_todo_schedule.dart';

class Todo extends StatefulWidget {
  Todo({Key? key}) : super(key: key);

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  late TodoProvider _todoProvider;
  late DateProvider _dateProvider;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _todoProvider = Provider.of<TodoProvider>(context, listen: true);
    _dateProvider = Provider.of<DateProvider>(context);

    List<Widget> _content = _todoProvider.todoList.entries
        .map((e) => TodoSchedule(todoData: e.value))
        .toList();

    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: Color(0xffbfbfbf),
            )),
        child: Column(children: [
          ..._content,
          AddTodoButton(),
        ]));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
