import 'ingredient.dart';

class Meal {
  Meal(this.id, this.name, this.thumb);
  String id;
  String name;
  String thumb;
  String? category;
  String? area;
  String? instructions;
  String? youtube;
  List<Ingredient> ingredients = [];
}
