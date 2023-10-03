import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_search_bloc_pattern/bloc/botton_nav_bar/nav_bar_event.dart';
import 'package:food_search_bloc_pattern/bloc/botton_nav_bar/nav_bar_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState>{
  NavigationBloc():super(NavInitialState(tabIndex: 0)){

    on<NavigationEvent>((event, emit){
      if(event is NavTabChange){
        print('Index_change: ${event.tabIndex}');
        emit(NavInitialState(tabIndex: event.tabIndex));
      }
    });
  }

}