import 'package:dio/dio.dart';

import '../../data/model/food_model.dart';

abstract class SearchRepository{
  Future<List<Recipe>> searchFoods(String query);
}

class SearchRepositoryImpl extends SearchRepository{
  @override
  Future<List<Recipe>> searchFoods(String query)async {
    final dio = Dio();
    String url = 'https://forkify-api.herokuapp.com/api/search?q=$query';
    var response = await dio.get(url);
    if(response.statusCode == 200){

      var data = response.data;
      List<Recipe> recipes = Food.fromJson(data).recipes!;
      return recipes;

    }else{
      throw Exception('Failed');
    }
  }

}