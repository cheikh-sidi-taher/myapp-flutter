import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/shared/bloc_observer.dart';
import 'package:my_app/shared/network/remote/dio_helper.dart';

import 'layout/home_layout.dart';
import 'layout/news_app/news_layout.dart';
import 'modules/bmi/bmiScreen.dart';
import 'modules/counter/counterScreen.dart';
import 'modules/home/homeScreen.dart';
import 'modules/login/loginScreen.dart';
import 'modules/messeenger/messengerScreen.dart';
import 'modules/user/usersScreen.dart';

void main() {
   Bloc.observer = MyBlocObserver();
   DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
     theme: ThemeData(
      primarySwatch: Colors.deepOrange,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark
        ),
        
        backgroundColor: Colors.white,
        elevation: 0.0,
        titleTextStyle: TextStyle(color: Colors.black,
          fontSize: 20.0,
          fontWeight: FontWeight.bold
        ),
        iconTheme: IconThemeData(
          color: Colors.black
        )
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.deepOrange,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.deepOrange,
        elevation: 20.0
        
      )
     ),

     darkTheme: ThemeData(
      
     ),
      home: NewsLayout(),
      
    );
  }
}

