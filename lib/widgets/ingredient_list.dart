import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_details_list_tile_checkbox.dart';

class IngredientList extends StatefulWidget {
  const IngredientList({
    Key? key,
    required this.meal,
  }) : super(key: key);

  final Meal meal;

  @override
  State<IngredientList> createState() => _IngredientListState();
}

class _IngredientListState extends State<IngredientList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
          itemCount: widget.meal.ingredients.length,
          itemBuilder: (context, index) {
            final ingredient = widget.meal.ingredients[index];
            return MealDetailsListTile(ingredient);
          }),
    );
  }
}
