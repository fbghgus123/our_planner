import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import '../../provider/daily/todo_provider.dart';
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
  late TodoProvider _todoProvider;
  late Todo data;
  late Todo? todoData;
  late TextEditingController _titleController;
  late TextEditingController _contentController;
  _TodoScheduleState(Todo this.data);
  bool _check = false;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _contentController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    _todoProvider = Provider.of<TodoProvider>(context, listen: true);
    todoData = _todoProvider.todoList[data.id];

    return Draggable<List<dynamic?>>(
      data: [todoData!.id, 0],
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
                color: Color(todoData!.color ?? 0xff9e9e9e),
                shape: BoxShape.circle,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(todoData!.title, style: _titleTextStyle),
                  Text(todoData!.content, style: _subTitleTextStyle)
                ],
              ),
            )
          ]),
        ),
      ),
      child: SizedBox(
        height: 80,
        child: CheckboxListTile(
            title: Text(
              todoData!.title,
              style: _titleTextStyle,
            ),
            subtitle: Text(todoData!.content, style: _subTitleTextStyle),
            secondary: GestureDetector(
              onTap: () {
                _showDialog(todoData!.color ?? 0xff9e9e9e);
              },
              child: Container(
                alignment: Alignment.center,
                width: 30,
                height: 80,
                decoration: BoxDecoration(
                  color: Color(todoData!.color ?? 0xff9e9e9e),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            value: _check,
            onChanged: (bool? value) {
              setState(() {
                _check = !_check;
              });
            }),
      ),
    );
  }

  void _showDialog(int color) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        int _initialColor = color;

        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: const Text("할 일 수정"),
              content: Row(children: [
                GestureDetector(
                  onTap: () {
                    colorPick(color).then((value) {
                      setState(() {
                        _initialColor = value;
                      });
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 30,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Color(_initialColor),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 25),
                  width: 300,
                  height: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 제목 수정
                      TextField(
                        controller: _titleController..text = todoData!.title,
                        style: _titleTextStyle,
                        decoration:
                            const InputDecoration(border: InputBorder.none),
                      ),
                      // 내용 수정
                      TextField(
                        controller: _contentController..text = todoData!.content,
                        style: _subTitleTextStyle,
                        decoration:
                            const InputDecoration(border: InputBorder.none),
                      ),
                    ],
                  ),
                )
              ]),
              actions: <Widget>[
                FlatButton(
                  child: const Text("취소"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                FlatButton(
                  child: const Text("확인"),
                  onPressed: () {
                    _todoProvider.updateTodoInfo(todoData!.id, _initialColor,
                        _titleController.text, _contentController.text);
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

  Future<int> colorPick(int initialColor) async {
    var result = await showDialog<int>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
                child: BlockPicker(
              pickerColor: Color(initialColor),
              onColorChanged: (color) {
                initialColor = color.value;
              },
            )),
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context, initialColor);
                  },
                  child: Text("확인"))
            ],
          );
        });
    return result as int;
  }
}
