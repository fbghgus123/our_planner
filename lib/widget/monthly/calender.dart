import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../controller/monthly/navigate_page.dart';
import '../../provider/monthly/date_provider.dart';

class Calender extends StatefulWidget {
  const Calender({Key? key}) : super(key: key);

  @override
  State<Calender> createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  late MonthlyDateProvider _dateProvider;
  late NavigateController _navigateController;

  List<String> weekName = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"];
  TextStyle _dateStyle = GoogleFonts.unna(
      fontSize: 36, fontWeight: FontWeight.w700, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    _dateProvider = Provider.of<MonthlyDateProvider>(context, listen: true);
    _navigateController = NavigateController(context);

    DateTime selectDate = _dateProvider.selectDate;
    DateTime selectMonth = _dateProvider.selectMonth;
    DateTime start = selectMonth.subtract(Duration(days: selectMonth.weekday));

    return Expanded(
      child: Container(
        child: Column(
          children: [
            // 상단 연도 - 월 표시
            Container(
              color: Color(0xff97afc9),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      _navigateController.goToBack();
                    },
                    child: Container(
                        padding: EdgeInsets.only(left: 20),
                        child: Icon(Icons.west, color: Colors.white)),
                  ),
                  Expanded(
                      child: Container(
                    height: 100,
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                        onTap: () {
                          _dateProvider.changePrevMonth();
                        },
                        child: Icon(Icons.arrow_back_ios, color: Colors.white)),
                  )),
                  Container(
                    padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                    height: 100,
                    alignment: Alignment.center,
                    child: Text(
                      formatDate(selectMonth, [yyyy, '.', mm]),
                      style: _dateStyle,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 100,
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                          onTap: () {
                            _dateProvider.changeNextMonth();
                          },
                          child: Icon(Icons.arrow_forward_ios,
                              color: Colors.white)),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _navigateController.goToDaily();
                    },
                    child: Container(
                        padding: EdgeInsets.only(right: 20),
                        child: Icon(Icons.check, color: Colors.white)),
                  ),
                ],
              ),
            ),
            // 월화수목금토일 표시
            Container(
              color: Color(0xff97afc9),
              child: Row(
                children: List.generate(
                    7,
                    (index) => Expanded(
                            child: Container(
                          height: 40,
                          child: Text(weekName[index],
                              textAlign: TextAlign.center),
                        ))),
              ),
            ),
            // 달력 Grid
            Expanded(
              child: GridView.builder(
                physics: ClampingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 7, childAspectRatio: 0.75),
                itemCount: 42,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  // 날짜 표시
                  DateTime date = start.add(Duration(days: index));
                  String dateForm = formatDate(date, [d]);
                  // 날짜 컨테이너
                  return GestureDetector(
                    onTap: () {
                      _dateProvider.changeDate(date);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: () {
                          if (date == selectDate) {
                            return Border.all(width: 2, color: Colors.red);
                          }
                          return Border.all(width: 0.08);
                        }(),
                        color: () {
                          if (date.month != selectMonth.month)
                            return Color.fromARGB(255, 223, 223, 223);
                        }(),
                      ),
                      child: Column(children: [
                        Text(dateForm),
                      ]),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
