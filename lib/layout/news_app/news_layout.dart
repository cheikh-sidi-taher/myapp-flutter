import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/layout/news_app/cubit/cubit.dart';
import 'package:my_app/modules/search/search_screen.dart';
import 'package:my_app/shared/cubit/cubit.dart';
import 'package:my_app/shared/network/remote/dio_helper.dart';
import '../../shared/components/components.dart';



import 'cubit/states.dart';

class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, NewsStates state) {},
        builder: (context, NewsStates state) {
          var cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'News App',
              ),
              actions: [
                IconButton(onPressed: () {
                 navigateTo(context, SearchScreen());

                }, icon: Icon(Icons.search)),
                 IconButton(onPressed: () {
                    AppCubit.get(context).changeAppMode();
                 }, 
                 icon: Icon(Icons.brightness_4_outlined))
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
        });
  }
}
