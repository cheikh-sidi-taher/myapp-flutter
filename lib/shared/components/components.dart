import 'package:flutter/material.dart';

Widget DfaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  bool istoUpperCase = true,
  double radius = 10.0,
  required Function function,
  required String text,
}) =>
    Container(
      width: width,  
      height: 40,
      child: MaterialButton(
        onPressed: function(),
        // onPressed: () {
        //   // print(emailController.text);
        //   //print(passwordController.text);
        // },

        child: Text(
          istoUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius 
          ),
         color: background,
        ),
    );
