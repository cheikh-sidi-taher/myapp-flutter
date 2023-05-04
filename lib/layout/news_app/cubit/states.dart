abstract class NewsStates {}

class NewsInitialState extends NewsStates {}

class BottomNavBarState extends NewsStates {}

class NewsGetBuisinessLoadingState extends NewsStates {}

class NewsGetBuisinessSucccessState extends NewsStates {}

class NewsGetBuisinessErrorState extends NewsStates {


  final String error;
  NewsGetBuisinessErrorState(this.error);
}




class NewsGetSportsLoadingState extends NewsStates {}

class NewsGetSportsSucccessState extends NewsStates {}

class NewsGetSportsErrorState extends NewsStates {

  final String error;
  NewsGetSportsErrorState(this.error);
}


class NewsGetSciencesLoadingState extends NewsStates {}

class NewsGetSciencesSucccessState extends NewsStates {}

class NewsGetSciencesErrorState extends NewsStates {

  final String error;
  NewsGetSciencesErrorState(this.error);
}

class NewsGetSearchLoadingState extends NewsStates {}
class NewsGetSearchSucccessState extends NewsStates {}

class NewsGetSearchErrorState extends NewsStates {

  final String error;
  NewsGetSearchErrorState(this.error);
}
