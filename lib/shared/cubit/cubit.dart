

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/modules/archive_tasks/archive_tasks_screen.dart';
import 'package:my_app/shared/cubit/states.dart';
import 'package:my_app/shared/network/local/cache_helper.dart';

import '../../modules/done_tasks/done_tasks_screen.dart';
import '../../modules/new_tasks/new_tasks_screen.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

 static AppCubit get(context) => BlocProvider.of(context);


   int currentIndex = 0;

  List<Widget> screens = [
    NewTasksScreen(),
    DoneTasksScreen(),
    ArchiveTasksScreen()
  ];

  List<String> titles = ['New Tasks', 'Done Tasks', 'Archive Tasks'];


  void changeIndex(int index){

    currentIndex = index;
    emit(AppChangeBottomNavBarState());

  }


  //ThemeMode app =  ThemeMode.dark;


  bool isDark = false;

  void changeAppMode(){

    isDark = !isDark;
    CacheHelper.putDate(key: 'isDark', value: isDark).then((value) {
      emit(AppChangeModeState());
    },);
    emit(AppChangeModeState());

  }


}
