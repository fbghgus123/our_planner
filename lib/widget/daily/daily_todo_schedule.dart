import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TodoSchedule extends StatefulWidget {
  const TodoSchedule({Key? key, String? title, String? subtitle}) : super(key: key);

  @override
  State<TodoSchedule> createState() => _TodoScheduleState();
}

class _TodoScheduleState extends State<TodoSchedule> {
  
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


  bool _check = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Expanded(
        child: CheckboxListTile(
            title: Text("물리", style: _titleTextStyle,),
            subtitle: Text("슈뢰딩거의 우리 배우기", style: _subTitleTextStyle),
            secondary: Container(
              alignment: Alignment.center,
              width: 30,
              height: 80,
              decoration: new BoxDecoration(
                color: Color(0xfff08f92),
                shape: BoxShape.circle,
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
}
