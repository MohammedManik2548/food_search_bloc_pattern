import 'package:flutter/material.dart';

import '../data/model/food_model.dart';
import '../ui/food_details.dart';

Widget buildHintsList(List<Recipe> recipes) {
  //SearchFoodBloc searchBloc;
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3.7 / 4,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemCount: recipes.length,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              FoodDetail(recipes: recipes[index])));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  // alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 236, 236, 235),
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: SizedBox(
                          height: 90,
                          width: MediaQuery.of(context).size.width,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              recipes[index].imageUrl!,
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        recipes[index].title!,
                        maxLines: 2,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        recipes[index].publisher!,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
      const SizedBox(height: 20),
    ],
  );
}
