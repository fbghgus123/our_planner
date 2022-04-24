import 'package:flutter/material.dart';

class TimeTable extends StatefulWidget {
  const TimeTable({ Key? key }) : super(key: key);

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
        )
      ),
      child: Expanded(
        child: Table(

        ),
      ),
    );
  }
}