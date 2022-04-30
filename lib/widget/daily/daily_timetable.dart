import 'package:flutter/material.dart';
import 'timetable_cell.dart';

class TimeTable extends StatefulWidget {
  const TimeTable({Key? key}) : super(key: key);

  @override
  State<TimeTable> createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: Color(0xffbfbfbf),
            )),
        child: Column(
          children: [
            for (var i = 0; i < 24; i++)
              Expanded(
                child: Row(children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                        alignment: Alignment.center,
                        child: Text(i.toString(),
                            style: TextStyle(color: Color(0xffbfbfbf)))),
                  ),
                  for (var j = 0; j < 6; j++)
                    Expanded(
                      flex: 3,
                      child: TimeTableCell(position: i*6 + j)
                    )
                ]),
              )
          ],
        ));
  }
}
