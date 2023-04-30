
import 'package:flutter/material.dart';

import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';

class NewTasksScreen extends StatelessWidget {

  



  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context , index) => buildTaskTtem(tasks[index]),
       separatorBuilder:(context , index) => Padding(
         padding: const EdgeInsets.all(20.0),
         child: Container(
          width: double.infinity,
          height: 1.0,
          color: Colors.grey,
         ),
       ),
        itemCount: tasks.length);

    
  }
}