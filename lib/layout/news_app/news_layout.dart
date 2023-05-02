import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/layout/news_app/cubit/cubit.dart';
import 'package:my_app/shared/network/remote/dio_helper.dart';

import 'cubit/states.dart';

class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit()..getBusiness()..getSports()..getSciences(),
      child: BlocConsumer<NewsCubit, NewsStates>(
          listener: (context, NewsStates state) {},
          builder: (context, NewsStates state) {
            var cubit = NewsCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  'News App',
                ),
                actions: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.search))
                ],
              ),
              
              body: cubit.screens[cubit.currenIndex],
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: cubit.currenIndex,
                onTap: (index) {
                  cubit.changeBottomNavBar(index);
                },
                items: cubit.bottomItems,
              ),
            );
          }),
    );
  }
}
