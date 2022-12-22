import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/ingredient.dart';
import '../helpers/constants.dart';
import '../models/category.dart';
import '../models/meal.dart';
import '../widgets/search_meal_card.dart';

abstract class ApiConnector {
  static Future<List<Meal>> _fetchMeals(Uri url) async {
    List<Meal> mealsToDisplay = [];
    try {
      final response = await http.get(url);
      final decodedDessertsResponse = jsonDecode(response.body);
      final List<dynamic> mealsList = decodedDessertsResponse['meals'] ?? [];
      for (var meal in mealsList) {
        mealsToDisplay.add(Meal(
          meal['idMeal'],
          meal['strMeal'],
          meal['strMealThumb'],
        ));
      }
      return mealsToDisplay;
    } catch (error) {
      rethrow;
    }
  }

  static Future<List<Meal>> getMealsByCategory(String category) async {
    final url = Uri.parse('${Constants.mealUrl}/filter.php?c=$category');
    try {
      final List<Meal> meals = await _fetchMeals(url);
      return meals;
    } catch (error) {
      rethrow;
    }
  }

  static Future<List<Meal>> getMealsByName(String name) async {
    final url = Uri.parse('${Constants.mealUrl}/search.php?s=$name');
    try {
      final List<Meal> meals = await _fetchMeals(url);
      return meals;
    } catch (error) {
      rethrow;
    }
  }

  static Future<List<Meal>> getMealsByArea(String area) async {
    final url = Uri.parse('${Constants.mealUrl}/filter.php?a=$area');
    try {
      final List<Meal> meals = await _fetchMeals(url);
      return meals;
    } catch (error) {
      rethrow;
    }
  }

  static Future<List<Meal>> getMealsByIngredient(String ingredient) async {
    final url = Uri.parse('${Constants.mealUrl}/filter.php?i=$ingredient');
    try {
      final List<Meal> meals = await _fetchMeals(url);
      return meals;
    } catch (error) {
      rethrow;
    }
  }

  static Future<Meal> getMealByDetails(Meal meal) async {
    try {
      final url = Uri.parse('${Constants.mealUrl}/lookup.php?i=${meal.id}');
      final response = await http.get(url);
      final decodedDessertsResponse = jsonDecode(response.body);
      final dynamic extractedMeal = decodedDessertsResponse['meals'][0];
      meal.category = extractedMeal['strCategory'];
      meal.area = extractedMeal['strArea'];
      meal.instructions = extractedMeal['strInstructions'];
      meal.youtube = extractedMeal['strYoutube'];
      int iterator = 1;
      String iteratedIngredient;
      String iteratedMeasure;
      do {
        iteratedIngredient = extractedMeal['strIngredient$iterator'];
        iteratedMeasure = extractedMeal['strMeasure$iterator'];
        iterator++;
        if (iteratedIngredient.isNotEmpty) {
          meal.ingredients
              .add(Ingredient(iteratedIngredient, iteratedMeasure, false));
        }
      } while (iteratedIngredient.isNotEmpty);
      return meal;
    } catch (error) {
      rethrow;
    }
  }

  static Future<Meal> getRandomMeal() async {
    final headerMealUrl = Uri.parse('${Constants.mealUrl}/random.php');
    final responseHeaderMeal = await http.get(headerMealUrl);
    final decodedHeaderMealResponse = jsonDecode(responseHeaderMeal.body);
    final Map<String, dynamic> extractedMeal =
        decodedHeaderMealResponse['meals'][0];
    Meal headerMeal = Meal(
      extractedMeal['idMeal'],
      extractedMeal['strMeal'],
      extractedMeal['strMealThumb'],
    );
    return headerMeal;
  }

  static Future<List<Category>> getCategories() async {
    List<Category> categories = [];
    try {
      final url = Uri.parse('${Constants.mealUrl}/categories.php');
      final response = await http.get(url);
      final decodedResponse = jsonDecode(response.body);
      final List<dynamic> extractedCategories = decodedResponse['categories'];
      for (var extractedCategory in extractedCategories) {
        Category category = Category(
            extractedCategory['idCategory'],
            extractedCategory['strCategory'],
            extractedCategory['strCategoryThumb'],
            extractedCategory['strCategoryDescription']);
        categories.add(category);
      }
      return categories;
    } catch (error) {
      rethrow;
    }
  }

  static Future<List<Widget>> createSearchMealCards(
      String search, String category) async {
    List<Meal> meals = [];
    if (category == 'Meal name') {
      meals = await getMealsByName(search);
    }
    if (category == 'Category') {
      meals = await getMealsByCategory(search);
    }
    if (category == 'Ingredient') {
      meals = await getMealsByIngredient(search);
    }
    if (category == 'Area') {
      meals = await getMealsByArea(search);
    }
    List<Widget> mealCards = [];
    for (var meal in meals) {
      mealCards.add(
        SearchMealCard(meal: meal),
      );
    }
    return mealCards;
  }
}
