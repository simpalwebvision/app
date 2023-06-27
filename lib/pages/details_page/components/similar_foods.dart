import 'package:app/data/data.dart';
import 'package:app/models/food_model.dart';
import 'package:app/pages/home_page/components/food_item.dart';
import 'package:app/pages/home_page/home_page.dart';
import 'package:flutter/material.dart';

class SimilarFoods extends StatelessWidget {
  const SimilarFoods({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size!.height * .350,
      child: ListView.builder(
        itemCount: foodList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          FoodModel foodModel = foodList[index];
          return SizedBox(
            width: size!.width / 2,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size!.height * .015,
              ),
              child: FoodItem(
                foodModel: foodModel,
                tag: foodModel.id.toString(),
              ),
            ),
          );
        },
      ),
    );
  }
}
