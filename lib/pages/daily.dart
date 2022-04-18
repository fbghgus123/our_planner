import 'package:flutter/material.dart';

class Daily extends StatelessWidget {
  const Daily({Key? key}) : super(key: key);

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
            child: Container(
              height: 70,
              color: Colors.red,
            ),
          ),
      
          Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Column(children: [
              // 메모
              Container(
                height: 70,
                color: Colors.blue,
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
                          color: Colors.pink,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        height: screenHeight * 0.15,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
      
              // 투두리스트, 타임테이블
              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Padding(
                        padding: EdgeInsets.only(right: 10.0),
                        child: Container(
                          height: screenHeight * 0.6,
                          color: Colors.purple,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        height: screenHeight * 0.6,
                        color: Colors.yellow,
                      ),
                    )
                  ],
                ),
              ),
      
              // 제출 버튼
              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [Container(
                    color: Colors.grey,
                    height: 40,
                    width: 130,
                  )],
                ),
              )
            ]),
          )
        ]),
          ),
      ));
  }
}
