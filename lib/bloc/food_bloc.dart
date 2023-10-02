import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_search_bloc_pattern/bloc/food_event.dart';
import 'package:food_search_bloc_pattern/bloc/food_state.dart';

import '../data/model/food_model.dart';
import '../data/repositories/food_repository.dart';

class FoodBloc extends Bloc<FoodEvent, FoodState>{
  final FoodRepository foodRepository;

  FoodBloc({required this.foodRepository}):super(FoodLoadingState()){
    on<FetchFoodEvent>((event, emit)async{
      emit(FoodLoadingState());

      try{
        List<Recipe> recipes = await foodRepository.getFoods();
        emit(FoodLoadedState(recipes: recipes));
      }catch(e){
        emit(FoodErrorState(message: e.toString()));
      }

    }
    );
  }

}