import 'package:flutter/material.dart';

import 'counterScreen.dart';
import 'homeScreen.dart';
import 'loginScreen.dart';
import 'messengerScreen.dart';
import 'usersScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      home:CounterScreen(),
    );
  }
}

