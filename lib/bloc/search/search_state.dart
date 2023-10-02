import 'package:equatable/equatable.dart';

import '../../data/model/food_model.dart';

abstract class SearchState extends Equatable{}

class SearchLoadingState extends SearchState{
  @override
  List<Object?> get props => [];

}

class SearchLoadedState extends SearchState{
  late final List<Recipe> recipe;
  SearchLoadedState({required this.recipe});

  @override
  List<Object?> get props => [];

}

class SearchErrorState extends SearchState{
  @override
  List<Object?> get props => [];

}