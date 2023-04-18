import 'package:flutter/material.dart';

import 'modules/bmi/bmiScreen.dart';
import 'modules/counter/counterScreen.dart';
import 'modules/home/homeScreen.dart';
import 'modules/login/loginScreen.dart';
import 'modules/messeenger/messengerScreen.dart';
import 'modules/user/usersScreen.dart';

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
      home:loginScreen(),
      
    );
  }
}

