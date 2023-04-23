import 'package:flutter/material.dart';

class ArchiveTasksScreen extends StatelessWidget {
  const  ArchiveTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        ' Archive Tasks',
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold
        ),
        ),
    );
  }
}