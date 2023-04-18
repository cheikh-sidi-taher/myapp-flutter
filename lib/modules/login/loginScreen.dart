import 'package:flutter/material.dart';

import '../../shared/components/components.dart';

// reusable components

// 1. timing
// 2. refactor
// 3. qouality

class loginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'login',
                      style: TextStyle(
                          fontSize: 40.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 40.0),
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      onFieldSubmitted: (String value) {
                        print(value);
                      },
                      onChanged: (String value) {
                        print(value);
                      },
                      decoration: InputDecoration(
                          labelText: 'Email Adress',
                          prefixIcon: Icon(
                            Icons.email,
                          ),
                          border: OutlineInputBorder()),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      onFieldSubmitted: (String value) {
                        print(value);
                      },
                      onChanged: (String value) {
                        print(value);
                      },
                      decoration: InputDecoration(
                          labelText: 'Passoword',
                          prefixIcon: Icon(
                            Icons.lock,
                          ),
                          suffixIcon: Icon(
                            Icons.remove_red_eye,
                          ),
                          border: OutlineInputBorder()),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    DfaultButton(
                        text: 'Login',
                       //radius: 8.0,
                        function: () {
                          print(emailController.text);
                          print(passwordController.text);
                        }),
                         SizedBox(
                      height: 20,
                    ),
                    DfaultButton(
                        text: 'Register',
                        //radius: 8.0,
                        //background: Colors.red,
                        function: () {
                          print(emailController.text);
                          print(passwordController.text);

                        
                        },
                        //istoUpperCase: false,
                        ),


                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('don\t have acount?'),
                        TextButton(
                          onPressed: () {},
                          child: Text('Register Row'),
                        )
                      ],
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
