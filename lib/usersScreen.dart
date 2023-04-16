import 'package:flutter/material.dart';

// class Model

class UserModel {
  final int id;
  final String name;
  final String phone;

  
   UserModel({
    required this.id,
    required this.name,
    required this.phone
   });
}
class UsersScreen extends StatelessWidget {
  
List<UserModel> users = [
  UserModel(
    id: 1,
    name: 'cheikh sidi',
    phone: '+22244648478'
    ),
    UserModel(
    id: 2,
    name: 'khaled',
    phone: '+22231002932'
    ),
    UserModel(
    id: 3,
    name: 'messi',
    phone: '+22244648478'
    ),
    UserModel(
    id: 4,
    name: 'neymar',
    phone: '+22244648478'
    ),
    UserModel(
    id: 5,
    name: 'neymar',
    phone: '+22244648478'
    ),
    UserModel(
    id: 6,
    name: 'neymar',
    phone: '+22244648478'
    ),
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
      title: Text(
        'users'
      )
     ),

     body: ListView.separated(
      itemBuilder: (context ,index) => BuildUserItem(users[index]),
       separatorBuilder:  (context ,index) => Padding(
         padding: const EdgeInsetsDirectional.only(
          start: 20.0
         ),
         child: Container(
          width: double.infinity,
          height: 1.0,
          color: Colors.grey[300],
         ),
       ), 
       itemCount: users.length)
     );
    
  }
  
  Widget BuildUserItem(UserModel user) => Padding(
       padding: const EdgeInsets.all(20.0),
       child: Row(
          children: [
            CircleAvatar(
              radius: 25.0,
              child: Text(
                '${user.id}',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold
                ),
              ),
     
            ),
     
            SizedBox(
              width: 20.0,
            ),
     
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
     
                   Text(
                '${user.name}',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold
                ),
              ),
     
              Text(
                '${user.phone}',
                style: TextStyle(
                  color: Colors.grey
                ),
              )
                  
                ],
              ),
            )
          ]
          ,),
     );
}