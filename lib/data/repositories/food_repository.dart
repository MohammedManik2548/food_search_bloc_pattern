import 'package:dio/dio.dart';

import '../model/food_model.dart';

abstract class FoodRepository{
  Future<List<Recipe>> getFoods();
}

class FoodRepositoryImpl extends FoodRepository{
  @override
  Future<List<Recipe>> getFoods() async {
    Dio dio = Dio();
    String url = 'https://forkify-api.herokuapp.com/api/search?q=pizza#';

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
