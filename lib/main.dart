import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:my_app/layout/news_app/cubit/states.dart';
import 'package:my_app/shared/bloc_observer.dart';
import 'package:my_app/shared/cubit/cubit.dart';
import 'package:my_app/shared/cubit/states.dart';
import 'package:my_app/shared/network/remote/dio_helper.dart';

import 'layout/home_layout.dart';
import 'layout/news_app/cubit/cubit.dart';
import 'layout/news_app/news_layout.dart';
import 'modules/bmi/bmiScreen.dart';
import 'modules/counter/counterScreen.dart';
import 'modules/home/homeScreen.dart';
import 'modules/login/loginScreen.dart';
import 'modules/messeenger/messengerScreen.dart';
import 'modules/shop_app/on_boarding/on_boarding.screen.dart';
import 'modules/user/usersScreen.dart';
import 'shared/network/local/cache_helper.dart';
import 'shared/styles/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => NewsCubit()
              ..getBusiness()
              ..getSports()
              ..getSciences()),
        BlocProvider(
          create: (BuildContext context) => AppCubit(),
        )
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            // dark theme
            darkTheme: darkTheme,
            // theme mode
            themeMode:
                AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            // Scrren
            home: OnBoardingScreen(),
          );
        },
      ),
    );
  }
}
