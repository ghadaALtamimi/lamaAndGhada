import 'package:flutter/cupertino.dart';
import 'package:recipe_view/checkboxState.dart';

class Recipe {
  final String id;
  final String recipeName;

  final String imageURL;
  final String category;
  final String typeOfMeal;
  final List<String> ingredients;
  final List<String> dirctions;
  final String cuisine;

  const Recipe({
    @required this.id,
    @required this.recipeName,
    @required this.typeOfMeal,
    @required this.category,
    @required this.imageURL,
    @required this.ingredients,
    @required this.dirctions,
    @required this.cuisine,
  });
}
