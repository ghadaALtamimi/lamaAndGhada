import 'package:flutter/material.dart';
import 'package:recipe_view/comments.dart';
import 'package:recipe_view/ingrediants.dart';
import 'package:recipe_view/rating.dart';
import 'package:recipe_view/rating_recipe.dart';
import 'package:recipe_view/recipe_model.dart';
import 'package:recipe_view/view_reicpe_flotingbutton.dart';

class recipe_view extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Recipe a = new Recipe(
      id: 'r1',
      recipeName: 'Pancakes',
      imageURL:
          "https://www.eatthis.com/wp-content/uploads/sites/4/2019/11/whole-grain-pancake-stack.jpg?fit=1200%2C879&ssl=1",
      typeOfMeal: "breakfast",
      category: 'Drinks',
      cuisine: "indian",
      ingredients: ["ggggg", "dsdsad", "asdasda", "ggggg", "dsdsad", "asdasda"],
      dirctions: ["aaa", "dsdsad", "asdasda"],
    );

    //---------

    const _actionTitles = [
      'Add ingrediants To Shopoing List',
      'Reating',
      'Add Comment'
    ];
    void _showAction(BuildContext context, int index) {
      showDialog<void>(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(_actionTitles[index]),
            // actions: [
            //   TextButton(
            //     onPressed: () => Navigator.of(context).pop(),
            //     child: const Text('CLOSE'),
            //     style: ButtonStyle(
            //         foregroundColor:
            //             MaterialStateProperty.all(Color(0xFFeb6d44))),
            //   ),
            //   TextButton(
            //     onPressed: () => Navigator.of(context).pop(),
            //     child: const Text('ADD'),
            //     style: ButtonStyle(
            //         foregroundColor:
            //             MaterialStateProperty.all(Color(0xFFeb6d44))),
            //   ),
            // ],
          );
        },
      );
    }

    //--------------

    //-------------
    return Scaffold(
      floatingActionButton: ExpandableFab(
        distance: 100.0,
        children: [
          ActionButton(
            onPressed: () => _showAction(context, 0),
            icon: const Icon(Icons.shopping_bag),
          ),
          Rating_recipe(),
          ActionButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => commentsScreen()));
            },
            icon: const Icon(Icons.comment_sharp),
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          //ExampleExpandableFab(),
          //---------------------image and bookmarked and shear button---------------
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 200,
                  child: Image.network(
                    a.imageURL,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  left: 20,
                  top: 10,
                  child: Row(
                    children: [
                      IconButton(
                          icon: Icon(
                            Icons.bookmark_add_outlined,
                            size: 30,
                            // color: Color(0xFFeb6d44),
                          ),
                          onPressed: () {
                            //setstat :change the kind of ici=on and add it to bookmark list
                          }),
                      IconButton(
                          icon: Icon(
                            Icons.ios_share_outlined,
                            //  Icons.ios_share,
                            size: 26,
                          ),
                          onPressed: () {
                            //setstat :change the kind of ici=on and add it to bookmark list
                          }),
                    ],
                  ),
                ),
              ],
            ),
          ),
          //-------------------------ginral discription ------------------------------------
          Container(
            margin: EdgeInsets.only(bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Row(
                    children: [
                      Icon(
                        Icons.restaurant,
                        color: Colors.grey[600],
                      ),
                      Center(
                          child: Text(
                        "  " + a.typeOfMeal,
                        //   style: TextStyle(
                        //       fontSize: 30,
                        //       color: Colors.grey[600],
                        //       fontWeight: FontWeight.w100),
                        // ),
                      ))
                    ],
                  ),
                ),
                //--------------------------------
                Container(
                  child: Row(
                    children: [
                      Icon(
                        Icons.public,
                        color: Colors.grey[600],
                      ),
                      // Text(
                      //   "|",
                      //   style: TextStyle(
                      //       fontSize: 30,
                      //       color: Colors.grey[600],
                      //       fontWeight: FontWeight.w100),
                      // ),
                      Center(child: Text("  " + a.cuisine))
                    ],
                  ),
                ),
                // Text(a.category),
                // Text(a.cuisine),
                // Text(a.typeOfMeal),
                Container(
                  child: Row(
                    children: [
                      Icon(
                        Icons.format_list_bulleted,
                        color: Colors.grey[600],
                      ),
                      // Text(
                      //   "|",
                      //   style: TextStyle(
                      //       fontSize: 30,
                      //       color: Colors.grey[600],
                      //       fontWeight: FontWeight.w100),
                      // ),
                      Center(child: Text("  " + a.category))
                    ],
                  ),
                ),
              ],
            ),
          ),

          //--------------------------ingrediants--------------------------
          ingrediants(a.ingredients, "Ingrediants"),

          ingrediants(a.dirctions, "Dirctions")
          //-------------------------------------------
        ],
      ),
    ); //Row(
    //   children: [ingrediants(a.ingredients), ingrediants(a.dirctions)],
  } //outvalue is change the state of check list
}

//-------------------
