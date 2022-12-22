import 'package:flutter/material.dart';

import '../../models/ingredient.dart';

class MealDetailsListTile extends StatelessWidget {
  MealDetailsListTile(this.ingredient);
  Ingredient ingredient;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        ingredient.ingredient,
      ),
    );
  }
}
