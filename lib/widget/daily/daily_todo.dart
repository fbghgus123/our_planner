import 'package:flutter/material.dart';
import 'package:our_planner/provider/daily/todo_provider.dart';
import 'package:provider/provider.dart';

import '../../model/schedule.dart';
import 'daily_todo_schedule.dart';

class Todo extends StatefulWidget {
  const Todo({Key? key}) : super(key: key);

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  late TodoProvider _todoProvider;

  @override
  void initState() {
    super.initState();
    _todoProvider = Provider.of<TodoProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _content = _todoProvider.todoList.entries
        .map((e) => TodoSchedule(todoData: e.value)).toList();

    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: Color(0xffbfbfbf),
            )),
        child: Column(
          children: _content,
        ));
  }
}
