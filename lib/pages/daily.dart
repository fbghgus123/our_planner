import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/daily/timetable_provider.dart';
import '../provider/daily/todoProvider.dart';
import '../widget/daily/date_widget.dart';
import '../widget/daily/daily_memo.dart';
import '../widget/daily/daily_schedule.dart';
import '../widget/daily/daily_check.dart';
import '../widget/daily/daily_todo.dart';
import '../widget/daily/daily_timetable.dart';

class Daily extends StatefulWidget {
  const Daily({ Key? key }) : super(key: key);

  @override
  State<Daily> createState() => _DailyState();
}

class _DailyState extends State<Daily> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
        child: Column(children: [
          
          // 달력 내리기
          Container(
            height: 30,
            color: Colors.grey,
          ),

          // 상단 날짜 + D-day
          Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: DateWidget()
          ),
      
          Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Column(children: [
              // 메모
              Container(
                child: DailyMemo(),
              ),
      
              // 스케쥴, 체크리스트 레이아웃
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Padding(
                        padding: EdgeInsets.only(right: 10.0),
                        child: Container(
                          height: screenHeight * 0.15,
                          child: Schedule()
                        )
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        height: screenHeight * 0.15,
                        child: CheckList(),
                      ),
                    ),
                  ],
                ),
              ),      
              // 투두리스트, 타임테이블
              MultiProvider(
                providers: [
                  ChangeNotifierProvider(create: (context) => TimeTableProvider()),
                  ChangeNotifierProvider(create: (context) => TodoProvider())
                ],
                child: Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Padding(
                          padding: EdgeInsets.only(right: 10.0),
                          child: Container(
                            height: screenHeight * 0.6,
                            child: Todo(),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          height: screenHeight * 0.6,
                          child: TimeTable(),
                        ),
                      )
                    ],
                  ),
                ),
              ),
      
              // 제출 버튼
              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      alignment: Alignment.center,                  
                      color: Colors.grey,
                      height: 40,
                      width: 130,
                      child: Text(
                        "Submit",
                        style: TextStyle(
                          color: Colors.white
                        )
                      ),
                    ),
                  ],
                ),
              )
            ]),
          )
        ]),
          ),
      ));
  }
}