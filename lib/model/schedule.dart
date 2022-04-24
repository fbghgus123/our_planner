import 'package:flutter/material.dart';

class Schedule {
  int? id;
  String title;
  String content;
  Color? color;
  String? date;
  String? startTime;
  String endTime;
  bool check;

  Schedule(
      {this.id,
      this.title = "",
      this.content = "",
      this.color,
      this.date,
      this.startTime = "",
      this.endTime = "",
      this.check = false});
}
