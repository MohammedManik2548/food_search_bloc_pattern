import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_search_bloc_pattern/bloc/search/search_event.dart';
import 'package:food_search_bloc_pattern/bloc/search/search_state.dart';

import '../../data/model/food_model.dart';
import '../../data/repositories/search_repository.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState>{
  final SearchRepository searchRepository;


  SearchBloc({required this.searchRepository}): super(SearchLoadingState()){
    on<Search>((event, emit)async{
      emit(SearchLoadingState());

      try{
        List<Recipe> recipes = await searchRepository.searchFoods(event.query);
        emit(SearchLoadedState(recipe: recipes));
      }catch(e){
        emit(SearchErrorState());
      }

    });
  }

}