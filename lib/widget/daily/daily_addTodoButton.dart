import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:our_planner/provider/daily/todo_provider.dart';
import 'package:provider/provider.dart';

import '../../firebase/todo.dart';
import '../../provider/daily/date_provider.dart';

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

class AddTodoButton extends StatelessWidget {
  late TodoProvider _todoProvider;
  AddTodoButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _todoProvider = Provider.of<TodoProvider>(context, listen: false);

    return Column(
      children: [
        GestureDetector(
          onTap: () {
            _todoProvider.addTodo();
          },
          child: Container(
            padding: EdgeInsets.only(top: 20),
            alignment: Alignment.center,
            child: Icon(
              Icons.add,
              color: Colors.grey,
              size: 30,
            ),
          ),
        ),
      ],
    );
  }
}
