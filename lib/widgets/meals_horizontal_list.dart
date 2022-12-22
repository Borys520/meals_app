import 'package:flutter/material.dart';

import './meal_card.dart';
import '../models/meal.dart';

class MealsHorizontalList extends StatelessWidget {
  List<Meal> meals = [];
  MealsHorizontalList(this.meals);
  @override
  Widget build(BuildContext context) {
    List<Widget> mealCards = [];
    for (var meal in meals.take(10)) {
      mealCards.add(
        MealCard(meal: meal),
      );
    }
    return Container(
      margin: EdgeInsets.only(left: 6),
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: mealCards.length,
        itemBuilder: (context, i) {
          return mealCards[i];
        },
      ),
    );
  }
}
