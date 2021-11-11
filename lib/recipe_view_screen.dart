import 'package:flutter/material.dart';
import 'package:recipe_view/ingrediants.dart';
import 'package:recipe_view/recipe_model.dart';

class recipe_view extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Recipe a = new Recipe(
      id: 'r1',
      recipeName: 'Pancakes',
      imageURL:
          'https://lacuisinedegeraldine.fr/wp-content/uploads/2021/06/Pancakes-04483-2-scaled.jpg',
      typeOfMeal: "breakfast",
      category: 'c1',
      cuisine: "indian",
      ingredients: ["ggggg", "dsdsad", "asdasda"],
      dirctions: ["ggggg", "dsdsad", "asdasda"],
    );

    return Scaffold(
      body: ListView(
        children: [
          Container(
            child: ingrediants(),
          )
        ],
      ),
    );
  } //outvalue is change the state of check list
}
 //-------------------
 