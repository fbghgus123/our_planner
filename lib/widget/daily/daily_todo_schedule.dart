import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../model/todo.dart';

TextStyle _titleTextStyle = GoogleFonts.poppins(
  fontSize: 16,
  fontWeight: FontWeight.w600,
  color: Color(0xff57636C),
);

TextStyle _subTitleTextStyle = GoogleFonts.poppins(
  fontSize: 20,
  fontWeight: FontWeight.w300,
  color: Color(0xff57636C),
);

class TodoSchedule extends StatefulWidget {
  final Todo todoData;
  TodoSchedule({Key? key, required Todo this.todoData}) : super(key: key);

  @override
  State<TodoSchedule> createState() => _TodoScheduleState(todoData);
}

class _TodoScheduleState extends State<TodoSchedule> {
  final Todo todoData;
  _TodoScheduleState(Todo this.todoData);

  bool _check = false;
  @override
  Widget build(BuildContext context) {
    return Draggable<List<dynamic?>>(
      data: [todoData.id, 0],
      feedback: Opacity(
        opacity: 0.4,
        child: Container(
          width: 300,
          child: Row(children: [
            Container(
              alignment: Alignment.center,
              width: 30,
              height: 80,
              decoration: new BoxDecoration(
                color: Color(todoData.color ?? 0xff9e9e9e),
                shape: BoxShape.circle,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(todoData.title, style: _titleTextStyle),
                  Text(todoData.content, style: _subTitleTextStyle)
                ],
              ),
            )
          ]),
        ),
      ),
      child: SizedBox(
        height: 80,
        child: Expanded(
          child: CheckboxListTile(
              title: Text(
                todoData.title,
                style: _titleTextStyle,
              ),
              subtitle: Text(todoData.content, style: _subTitleTextStyle),
              secondary: Container(
                alignment: Alignment.center,
                width: 30,
                height: 80,
                decoration: new BoxDecoration(
                  color: Color(todoData.color ?? 0xff9e9e9e),
                  shape: BoxShape.circle,
                ),
              ),
              value: _check,
              onChanged: (bool? value) {
                setState(() {
                  _check = !_check;
                });
              }),
        ),
      ),
    );
  }
}
