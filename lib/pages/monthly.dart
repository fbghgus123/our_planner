import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widget/monthly/calender.dart';


class Monthly extends StatelessWidget {
  const Monthly({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Calender()
          ],
        )
      ),
    );
  }
}
