import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_search_bloc_pattern/ui/home_page.dart';
import 'bloc/food_bloc.dart';
import 'bloc/search/search_bloc.dart';
import 'data/repositories/food_repository.dart';
import 'data/repositories/search_repository.dart';


void main() {
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
            create: (context) => SearchBloc(
              searchRepository: SearchRepositoryImpl(),
            ),
          ),
          BlocProvider(
              create: (context) => FoodBloc(
                foodRepository: FoodRepositoryImpl(),
              )),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          builder: (context, child) {
            return Directionality(textDirection: TextDirection.ltr, child: child!);
          },
          title: 'Foodie App',
          home: HomePage(),
        ));
  }
}
