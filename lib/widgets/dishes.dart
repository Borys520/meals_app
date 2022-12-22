import 'dart:developer';
import 'package:flutter/material.dart';

import '../providers/api_connector.dart';
import './dishes_shimmer.dart';
import './meals_horizontal_list.dart';

class Dishes extends StatelessWidget {
  final String title;
  final String category;

  Dishes({super.key, required this.title, required this.category});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiConnector.getMealsByCategory(category),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const DishesShimmer();
          }
          if (snapshot.error != null) {
            log('Couldn\'t get the data');
            return const DishesShimmer();
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 10),
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              MealsHorizontalList(snapshot.data!)
            ],
          );
        });
    ;
  }
}
