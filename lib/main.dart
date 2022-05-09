import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './pages/daily.dart';
import './pages/monthly.dart';

void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Daily()
    );
  }
}
