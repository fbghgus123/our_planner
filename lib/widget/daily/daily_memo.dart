import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DailyMemo extends StatefulWidget {
  const DailyMemo({Key? key}) : super(key: key);

  @override
  State<DailyMemo> createState() => _DailyMemoState();
}

class _DailyMemoState extends State<DailyMemo> {
  // 폰트 스타일 설정
  TextStyle _labelTextStyle = GoogleFonts.faustina(
    fontSize: 14, 
    fontWeight: FontWeight.w400, 
    color: Color(0xff57636C),
  );

  TextStyle _memoTextStyle = GoogleFonts.gowunDodum(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: Color(0xff57636C)
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Color(0xffbfbfbf),
              width: 1
            )
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Memo", 
              style: _labelTextStyle
            ),
            TextField(
              style: _memoTextStyle,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                border: InputBorder.none
              ),
            ),
          ],
        ),
      ),
    );
  }
}
