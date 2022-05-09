import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../pages/monthly.dart';

class DateWidget extends StatelessWidget {
  DateWidget({Key? key}) : super(key: key);

  // 폰트 스타일 설정
  TextStyle _textStyle = GoogleFonts.unna(
      fontSize: 36, fontWeight: FontWeight.w700, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Monthly()));
      },
      child: Container(
        height: 70,
        color: Color(0xff97afc9),
        child: Row(children: [
          // 날짜
          Expanded(
            flex: 5,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                "2022.02.22 Tue",
                style: _textStyle,
              ),
            ),
          ),
          // D-day
          Expanded(
            flex: 3,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                "D-222",
                style: _textStyle,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
