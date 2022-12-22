import 'package:flutter/material.dart';

import '../pages/meal_details_page.dart';
import '../models/meal.dart';

class MealCard extends StatelessWidget {
  const MealCard({
    Key? key,
    required this.meal,
  }) : super(key: key);

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => MealDetailsScreen(meal)));
      }),
      child: Card(
        elevation: 3,
        margin: const EdgeInsets.all(5),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: SizedBox(
          width: 200,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Image.network(
                '${meal.thumb}',
                fit: BoxFit.fitWidth,
                width: 200,
                loadingBuilder: ((context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: LinearProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                }),
              ),
              Container(
                color: Colors.white,
                height: 70,
                width: double.infinity,
                padding: const EdgeInsets.only(left: 10, top: 5),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    meal.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
