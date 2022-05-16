import 'package:flutter/material.dart';
import 'package:our_planner/provider/daily/todo_provider.dart';
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
  Color? overayColor;

  @override
  Widget build(BuildContext context) {
    _timeTableProvider = Provider.of<TimeTableProvider>(context, listen: true);
    _todoProvider = Provider.of<TodoProvider>(context, listen: true);
    Schedule? _todo =
        _todoProvider.todoList[_timeTableProvider.timetable[position]];

    Widget draggableCell(int num) {
      return Draggable<List<int?>>(
        data: [_todo?.id, num],
        feedback: Container(
            width: 50, height: 50, color: _todo?.color?.withOpacity(0.5)),
        child: Container(
          decoration: BoxDecoration(
              color: _todo?.color,
              border: Border.all(
                width: 0.03,
              )),
        ),
      );
    }

    return DragTarget<List<int?>>(
      builder: (
        BuildContext context,
        List<dynamic> accepted,
        List<dynamic> rejected,
      ) {
        if (_todo?.start == position && _todo?.end == position) {
          return draggableCell(3);
        } else if (_todo?.start == position) {
          return draggableCell(1);
        } else if (_todo?.end == position) {
          return draggableCell(2);
        } else {
          return Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: _todo?.color,
                    border: Border.all(
                      width: 0.03,
                    )),
              ),
              Container(
                decoration: BoxDecoration(
                  color: overayColor ?? null,
                ),
              )
            ],
          );
        }
      },
      onAccept: (List<int?> data) {
        setState(() {
          overayColor = null;
        });
        Schedule? prev = _todoProvider.todoList[data[0]];
        if (data[1] == 0 && !prev!.onTable) {
          _todoProvider.changeOnTable(data[0], true, position, position);
          // 겹침
        } else if (data[1] == 3) {
          if (prev!.end > position) {
            _todoProvider.changeOnTable(data[0], true, position, prev.end);
          } else {
            _todoProvider.changeOnTable(data[0], true, prev.start, position);
          }
          // 머리
        } else if (data[1] == 1) {
          if (prev!.end > position) {
            _todoProvider.changeOnTable(data[0], true, position, prev.end);
          } else {
            _todoProvider.changeOnTable(data[0], true, prev.end, prev.end);
          }
          // 꼬리
        } else if (data[1] == 2) {
          if (prev!.start < position) {
            _todoProvider.changeOnTable(data[0], true, prev.start, position);
          } else {
            _todoProvider.changeOnTable(data[0], true, prev.start, prev.start);
          }
        }
        _timeTableProvider.changeId(_todoProvider.todoList);
      },
      onWillAccept: (List<int?>? data) {
        Schedule? prev = _todoProvider.todoList[data?[0]];
        // 타임테이블 배치 유효한지 확인
        bool checkAvail(int start, int end) {
          for (var i = start; i < end; i++) {
            if (_timeTableProvider.timetable[i] != null &&
                _timeTableProvider.timetable[i] != data?[0]) {
              return false;
            }
          }
          return true;
        }

        if (_timeTableProvider.timetable[position] != null &&
            _timeTableProvider.timetable[position] != data?[0]) {
          return false;
        } else if (data?[1] == 3) {
          if (prev!.end > position) {
            return checkAvail(position, prev.end);
          } else {
            return checkAvail(prev.start, position);
          }
        } else if (data?[1] == 1) {
          if (prev!.end > position) {
            return checkAvail(position, prev.end);
          }
        } else if (data?[1] == 2) {
          if (prev!.start < position) {
            return checkAvail(prev.start, position);
          }
        }
        return true;
      },
      onMove: (_) {
        setState(() {
          overayColor = Colors.grey.withOpacity(0.5);
        });
      },
      onLeave: (_) {
        setState(() {
          overayColor = null;
        });
      },
    );
  }
}
