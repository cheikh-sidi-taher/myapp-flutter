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


    Widget buildTaskTtem(Map Model) => Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40.0,
            child: Text('${Model['title']}'),
            
          ),
    
          SizedBox(
            width: 20.0,
          ),
    
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '${Model['time']}',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold
                ),
                ),
                Text(
               '${Model['date']}',
                style: TextStyle(
                 color: Colors.grey
                ),
                )
            ],
          )
        ],
      ),
    );
