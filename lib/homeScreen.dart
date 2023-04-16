import 'package:flutter/material.dart';

class homeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: Icon(
          Icons.menu,
        ),
        title: Text('cheikh',
            style: TextStyle(
              fontSize: 24,
              color: Colors.red,
            )),
        actions: [
          IconButton(
              onPressed: not,
              icon: Icon(
                Icons.search,
              )),
          IconButton(
              onPressed: () {
                print('hello');
              },
              icon: Text('yes'))
        ],
      ),
      body: Column(
        children: [
          Container(
            width: 200,
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Container(
                decoration: BoxDecoration(
                  //borderRadius: BorderRadius.circular(20),
                  borderRadius: BorderRadiusDirectional.only(
                    topStart: Radius.circular(10)
                  )
                ),
               
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Image(
                      image: NetworkImage(
                        'https://www.planetsport.com/image-library/square/1200/c/cristiano-ronaldo-portugal-5-june-2022.jpg',
                        ),
                        height: 200,
                        width: 200,
                        fit: BoxFit.cover,
                        ),
                        
                        Container(
                          width: double.infinity,
                          color: Colors.black.withOpacity(.7),
                          padding: EdgeInsets.symmetric(
                            vertical: 20,
                          ),
                          child: Text(
                            
                            'cheikh',
                            textAlign: TextAlign.center,
                             style: TextStyle(
                              
                              color: Colors.blue,
                              fontSize: 20.0,
                              
                            ),
                            ),
                        )
                  ],
                ),
              ),
            ),
          )
        ],
      )
      );
    
  }

  void not() {
    print('welcome to flutter');
  }
}
