import 'package:flutter/material.dart';

import '../data/model/food_model.dart';

class FoodDetail extends StatelessWidget {
  final Recipe recipes;
  const FoodDetail({super.key, required this.recipes});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipes.title!),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.network(
                  recipes.imageUrl!,
                  height: 280,
                  fit: BoxFit.cover,
                )),
            const SizedBox(height: 20),
            Text(
              recipes.title!,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  recipes.publisher!,
                ),
                const SizedBox(width: 10),
                const Text(
                  "(Publisher)",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
