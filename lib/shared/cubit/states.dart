abstract class AppStates {}

class AppInitialState extends AppStates {
  get currentIndex => null;

  get isDark => null;

  void changeIndex(int index) {}

  void changeAppMode() {}
}

class AppChangeBottomNavBarState extends AppStates {
  // final int counter;

  // CounterPlusState(this.counter);
}


class AppChangeModeState extends AppStates {
 
}
