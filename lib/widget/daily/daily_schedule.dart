import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Schedule extends StatefulWidget {
  const Schedule({ Key? key }) : super(key: key);

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  
  TextStyle _labelTextStyle = GoogleFonts.faustina(
    fontSize: 14, 
    fontWeight: FontWeight.w400, 
    color: Color(0xff57636C),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Schedule",
            style: _labelTextStyle,
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color(0xffbfbfbf),
                    width: 1
                  )
                )
              ),
            )
          )
        ],
      )
    );
  }
}