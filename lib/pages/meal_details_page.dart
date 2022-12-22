import 'package:flutter/material.dart';
import 'dart:core';

import '../widgets/ingredient_list.dart';
import '../providers/api_connector.dart';
import '../models/meal.dart';
import '../widgets/header.dart';
import '../widgets/ingredient_list.dart';

class MealDetailsScreen extends StatelessWidget {
  Meal meal;

  MealDetailsScreen(this.meal);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.name),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: FutureBuilder(
        future: ApiConnector.getMealByDetails(meal),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          meal.ingredients.sort(
            (a, b) => a.checked ? 1 : -1,
          );
          return SingleChildScrollView(
            child: Column(
              children: [
                Header(
                  meal: meal,
                  showPopularity: false,
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Column(children: [
                        Text(
                          'Instructions',
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              ?.copyWith(fontSize: 20),
                        ),
                        Container(
                            margin: const EdgeInsets.symmetric(vertical: 20),
                            child: Text(meal.instructions!)),
                      ]),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        'Ingredients',
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            ?.copyWith(fontSize: 20),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    IngredientList(meal: meal),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
