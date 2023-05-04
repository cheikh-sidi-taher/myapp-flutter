
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/layout/news_app/cubit/cubit.dart';
import 'package:my_app/layout/news_app/cubit/states.dart';
import 'package:my_app/shared/components/components.dart';

class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit , NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
         var list = NewsCubit.get(context).search;
        return  Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  controller:  searchController,
                            keyboardType: TextInputType.text,
                          
                            onChanged: (value) {
                             NewsCubit.get(context).getsearch(value);
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                labelText: 'search',
                                prefixIcon: Icon(
                                  Icons.search,
                                ),
                                border: OutlineInputBorder()),
                
              ),
            ),

            Expanded(child: Center(child: articleBuilder(list, context))),
          ],
        ),
    
        
      );
      },
     
    );
  }
} 