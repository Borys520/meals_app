import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../pages/meal_details_page.dart';

class SearchMealCard extends StatelessWidget {
  const SearchMealCard({
    Key? key,
    required this.meal,
  }) : super(key: key);

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        elevation: 2,
        child: ListTile(
          leading: CircleAvatar(backgroundImage: NetworkImage(meal.thumb)),
          title: Text(meal.name),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MealDetailsScreen(meal),
          ),
        );
      },
    );
  }
}
