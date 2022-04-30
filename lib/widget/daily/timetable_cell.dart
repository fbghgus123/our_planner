import 'package:flutter/material.dart';
import 'package:our_planner/provider/daily/todoProvider.dart';
import 'package:provider/provider.dart';

import '../../model/schedule.dart';
import '../../provider/daily/timetable_provider.dart';

class TimeTableCell extends StatefulWidget {
  final int position;
  const TimeTableCell({Key? key, required int this.position}) : super(key: key);

  @override
  State<TimeTableCell> createState() => _TimeTableCellState(position: position);
}

class _TimeTableCellState extends State<TimeTableCell> {
  final int position;
  _TimeTableCellState({required int this.position});

  late TimeTableProvider _timeTableProvider;
  late TodoProvider _todoProvider;
  @override
  Widget build(BuildContext context) {
    _timeTableProvider = Provider.of<TimeTableProvider>(context, listen: true);
    _todoProvider = Provider.of<TodoProvider>(context, listen: true);
    Schedule? _todo =
        _todoProvider.todoList[_timeTableProvider.timetable[position]];
    Color? prevColor = _todo?.color;

    return DragTarget<List<int?>>(
      builder: (
        BuildContext context,
        List<dynamic> accepted,
        List<dynamic> rejected,
      ) {
        if (_todo?.start == position) {
          return Draggable<List<int?>>(
            data: [_todo?.id, 1],
            feedback: Container(width: 50, height: 50, color: _todo?.color),
            child: Container(
              decoration: BoxDecoration(
                  color: _todo?.color,
                  border: Border.all(
                    width: 0.03,
                  )),
            ),
          );
        } else if (_todo?.end == position) {
          return Draggable<List<int?>>(
            data: [_todo?.id, 2],
            feedback: Container(width: 50, height: 50, color: _todo?.color),
            child: Container(
              decoration: BoxDecoration(
                  color: _todo?.color,
                  border: Border.all(
                    width: 0.03,
                  )),
            ),
          );
        } else {
          return Container(
            decoration: BoxDecoration(
                color: _todo?.color,
                border: Border.all(
                  width: 0.03,
                )),
          );
        }
      },
      onAccept: (List<int?> data) {
        Schedule? prev = _todoProvider.todoList[data[0]];
        if (data[1] == 0 && !prev!.onTable) {
          _todoProvider.changeOnTable(data[0], true, position, position);
        } else if (data[1] == 1) {
          if (prev!.end > position) {
            _todoProvider.changeOnTable(data[0], true, position, prev.end);
          } else {
            _todoProvider.changeOnTable(data[0], true, prev.end, position);
          }
        } else if (data[1] == 2) {
          if (prev!.start < position) {
            _todoProvider.changeOnTable(data[0], true, prev.start, position);
          } else {
            _todoProvider.changeOnTable(data[0], true, position, prev.start);
          }
        }
        _timeTableProvider.changeId(_todoProvider.todoList);
      },
    );
  }
}
