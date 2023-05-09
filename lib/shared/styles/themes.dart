import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:my_app/shared/styles/colors.dart';

ThemeData darkTheme = ThemeData(
              primarySwatch: DfaultColor,
              scaffoldBackgroundColor: HexColor('333739'),
              appBarTheme: AppBarTheme(
                  backwardsCompatibility: false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: HexColor('333739'),
                      statusBarIconBrightness: Brightness.light),
                  backgroundColor: HexColor('333739'),
                  elevation: 0.0,
                  titleTextStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                  iconTheme: IconThemeData(color: Colors.white)),
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Colors.deepOrange,
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                unselectedItemColor: Colors.grey,
                elevation: 20.0,
                backgroundColor: HexColor('333739'),
              ),
              textTheme: TextTheme(
                  bodyMedium: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.white)
                      ),
                      fontFamily: 'Raleway',
                      );



ThemeData lightTheme =  ThemeData(
              primarySwatch: DfaultColor,
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(
                titleSpacing: 20.0,
                  backwardsCompatibility: false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.white,
                      statusBarIconBrightness: Brightness.dark),
                  backgroundColor: Colors.white,
                  elevation: 0.0,
                  titleTextStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                  iconTheme: IconThemeData(color: Colors.black)),
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Colors.deepOrange,
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                elevation: 20.0,
              ),
              textTheme: TextTheme(
                   bodyMedium: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black)
                      ),
                       fontFamily: 'Raleway',
                      );