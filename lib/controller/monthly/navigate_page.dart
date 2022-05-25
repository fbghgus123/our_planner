import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../pages/daily.dart';
import '../../provider/daily/date_provider.dart';
import '../../provider/monthly/date_provider.dart';

class NavigateController {
  late MonthlyDateProvider dateProvider;
  late BuildContext context;

  NavigateController(this.context) {
    dateProvider = Provider.of<MonthlyDateProvider>(context, listen: false);
  }

  void goToDaily() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => ChangeNotifierProvider(
                  create: (_) =>
                      DateProvider(selectDate: dateProvider.selectDate),
                  child: Daily(),
                )),
        (route) => false);
  }

  void goToBack() {
    Navigator.pop(context);
  }
}


