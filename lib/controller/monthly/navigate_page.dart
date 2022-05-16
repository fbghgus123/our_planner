import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../pages/daily.dart';
import '../../provider/daily/date_provider.dart';
import '../../provider/monthly/date_provider.dart';

class NavigatePage {
  late MonthlyDateProvider dateProvider;
  late BuildContext context;

  NavigatePage(this.context);

  void goToDaily() {
    Navigator.pushAndRemoveUntil(
      context, 
    MaterialPageRoute(builder: (BuildContext context) => ChangeNotifierProvider(
        create: (_) => DateProvider(),
        child: Daily()
    )), 
    (route) => false);
  }
}
