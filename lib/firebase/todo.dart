import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:date_format/date_format.dart';
import 'package:provider/provider.dart';

import '../model/todo.dart';
import '../provider/daily/todo_provider.dart';

class TodoDB {
  late DatabaseReference ref;
  late String userId;
  late String formatedDate;
  late Function setTodoList;
  TodoDB(
    this.userId,
    DateTime date,
    this.setTodoList,
  ) {
    formatedDate = formatDate(date, [yyyy, mm, dd]);
    ref = FirebaseDatabase.instance.ref("$userId/$formatedDate/todo");
  }

  void getTodos() async {
    Map<String, Todo> tmp = {};
    await ref.onValue.listen((event) {
      print("업데이트 되었습니다");
      if (event.snapshot.value != null) {
        Map<dynamic, dynamic> data =
            event.snapshot.value as Map<dynamic, dynamic>;
        data.forEach((key, value) {
          Map<String, dynamic> todoData = Map.from(value);
          Todo tmpTodo = Todo(
              todoData['id'], todoData['date'], todoData['userid'],
              title: todoData['title'],
              content: todoData['content'],
              color: todoData['color'],
              start: todoData['start'],
              end: todoData['end'],
              onTable: todoData['onTable'],
              check: todoData['check']);
          tmp[todoData['id']] = tmpTodo;
        });
      }
      setTodoList(tmp);
    });
  }

  void addTodo({String? title, String? content}) async {
    String? key = await ref.push().key;

    await ref.child(key ?? "tmp").set({
      "id": key,
      "userid": userId,
      "date": formatedDate,
      "check": false,
      "onTable": false,
      "title": title ?? "분류",
      "content": content ?? "내용",
      "color": 0xff9e9e9e,
      "start": 0,
      "end": 0,
    });
  }

  void updateTodoTime(String id, bool value, int start, int end) {
    ref.child(id).update({
      "onTable": value,
      "start": start,
      "end": end,
    });
  }
}
