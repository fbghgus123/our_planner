import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import './firebase_options.dart';
import './pages/daily.dart';
import './pages/monthly.dart';
import './provider/daily/date_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: "ourplanner",
    options: DefaultFirebaseOptions.android,
  );
  FirebaseDatabase.instance.databaseURL = "https://ourplanner-cc4f6-default-rtdb.asia-southeast1.firebasedatabase.app/";
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: ChangeNotifierProvider(
            create: (_) => DateProvider(), child: Daily()));
  }
}
