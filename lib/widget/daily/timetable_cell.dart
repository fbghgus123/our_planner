import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/daily/timetable_provider.dart';
import '../../model/schedule.dart';

class TimeTableCell extends StatelessWidget {
  final int row;
  final int col;
  TimeTableCell({Key? key, required int this.row, required int this.col})
      : super(key: key);

  late TimeTableProvider _timeTableProvider;

  @override
  Widget build(BuildContext context) {
    _timeTableProvider = Provider.of<TimeTableProvider>(context, listen: true);

    return DragTarget<Schedule>(
      builder: (
        BuildContext context,
        List<dynamic> accepted,
        List<dynamic> rejected,
      ) {
        return Container(
          decoration: BoxDecoration(
              color: Provider.of<TimeTableProvider>(context).timetable[row]
                  [col],
              border: Border.all(
                width: 0.03,
              )),
        );
      },
      onAccept: (Schedule data) {
        _timeTableProvider.changeColor(row, col, data.color);
      },
    );
  }
}
