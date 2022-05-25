import 'package:flutter/material.dart';

class Todo {
  String id;
  String userid;
  String title;
  String content;
  int? color;
  String date;
  int start;
  int end;
  bool onTable;
  bool check;

  Todo(this.id, this.date, this.userid,
      {this.title = "",
      this.content = "",
      this.color,
      this.start = 0,
      this.end = 0,
      this.onTable = false,
      this.check = false});
}
