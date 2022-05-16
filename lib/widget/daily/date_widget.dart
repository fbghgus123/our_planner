import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../pages/monthly.dart';
import '../../provider/monthly/date_provider.dart';
import '../../provider/daily/date_provider.dart';

class DateWidget extends StatelessWidget {
  DateWidget({Key? key}) : super(key: key);
  List<String> weekName = ["", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
  late DateProvider _dateProvider;

  // 폰트 스타일 설정
  TextStyle _textStyle = GoogleFonts.unna(
      fontSize: 36, fontWeight: FontWeight.w700, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    _dateProvider = Provider.of<DateProvider>(context, listen: true);
    DateTime date = _dateProvider.selectDate;

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ChangeNotifierProvider(
              create: (_) => MonthlyDateProvider(selectDate: _dateProvider.selectDate),
              child: Monthly(),
            )));
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
                formatDate(date, [yyyy, '.', mm, '.', 'dd', ' ']) + weekName[date.weekday],
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
