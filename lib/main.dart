import 'package:flutter/material.dart';

import 'homeScreen.dart';
import 'loginScreen.dart';
import 'messengerScreen.dart';

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
      home:messengerScreen(),
    );
  }
}
