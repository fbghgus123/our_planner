import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../firebase/memo.dart';
import '../../provider/daily/date_provider.dart';

class DailyMemo extends StatefulWidget {
  const DailyMemo({Key? key}) : super(key: key);

  @override
  State<DailyMemo> createState() => _DailyMemoState();
}

class _DailyMemoState extends State<DailyMemo> {
  late MemoDB _memoDB;
  late DateProvider _dateProvider;
  late TextEditingController _controller;
  String? _initMemo;

  // 폰트 스타일 설정
  TextStyle _labelTextStyle = GoogleFonts.faustina(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Color(0xff57636C),
  );

  TextStyle _memoTextStyle = GoogleFonts.gowunDodum(
      fontSize: 20, fontWeight: FontWeight.w400, color: Color(0xff57636C));

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    _dateProvider = Provider.of<DateProvider>(context);
    _memoDB = MemoDB("123", _dateProvider.selectDate);

    // 메모 추가
    if (_initMemo == null) {
      _memoDB.getMemo().then((value) {
        setState(() {
          _initMemo = value;
        });
      });
    }

    return Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: Container(
        decoration: const BoxDecoration(
            border:
                Border(bottom: BorderSide(color: Color(0xffbfbfbf), width: 1))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Memo", style: _labelTextStyle),
            TextField(
              onSubmitted: (text) {
                if (_initMemo != text) {
                  _memoDB.setMemo(text);
                  setState(() {
                    _initMemo = text;
                  });
                }
              },
              controller: _controller..text = _initMemo ?? "",
              style: _memoTextStyle,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(border: InputBorder.none),
            ),
          ],
        ),
      ),
    );
  }
}
