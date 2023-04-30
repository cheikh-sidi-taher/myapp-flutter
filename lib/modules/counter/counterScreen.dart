//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/modules/counter/cubit/states.dart';

import 'cubit/cubit.dart';


class CounterScreen extends StatelessWidget {
 

  int counter = 1;

  // 1.constractor
//  2. init state
//   3.build



  @override
  Widget build(BuildContext context) {
   
    return BlocProvider(
      create: (BuildContext context) =>  CounterCubit(),
      child: BlocConsumer<CounterCubit, CounterStates>(
        listener: (context, state)  {
          if(state is CounterMinusState){
           print('Munis State ${state.counter}');

          }
          if(state is CounterPlusState) {
            
            print('Plus State ${state.counter}');
          }
        },
        builder: (context, state) {
          return  Scaffold(
          appBar: AppBar(
            title: Text('Counter'),
          ),
          body: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {
                      // setState(() {
                      //   counter--;
                      //   print(counter);
                      // });

                      CounterCubit.get(context).minus();
                    },
                    child: Text('min')),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    '${CounterCubit.get(context).counter}',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      // setState(() {
                      //   counter++;
                      //   print(counter);
                      // });

                      CounterCubit.get(context).plus();
                    
                    },
                    child: Text('plus')),
              ],
            ),
          ),
        );
        },
      ),
    );
  }
}
