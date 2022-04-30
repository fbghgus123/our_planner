import 'package:flutter/material.dart';

class Schedule {
  int? id;
  String title;
  String content;
  Color? color;
  String? date;
  int start;
  int end;
  bool onTable;
  bool check;

  Schedule(
      {this.id,
      this.title = "",
      this.content = "",
      this.color,
      this.date,
      this.start = 0,
      this.end = 0,
      this.onTable = false,
      this.check = false});
}
