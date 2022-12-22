import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../models/meal.dart';
import '../providers/api_connector.dart';
import '../pages/meal_details_page.dart';
import './header.dart';
import './shimmer_container.dart';

class HeroHeader extends StatelessWidget {
  HeroHeader();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiConnector.getRandomMeal(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Shimmer(
            period: const Duration(seconds: 5),
            direction: ShimmerDirection.ltr,
            gradient: const LinearGradient(
              colors: [
                Colors.black12,
                Colors.white,
              ],
            ),
            child: ShimmerContainer(height: 340, width: double.infinity),
          );
        }
        if (snapshot.error != null) {
          throw Exception(snapshot.error);
        }

        final meal = snapshot.data as Meal;
        return GestureDetector(
          onTap: (() {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MealDetailsScreen(meal)));
          }),
          child: Header(
            meal: meal,
            showPopularity: true,
          ),
        );
      },
    );
  }
}
