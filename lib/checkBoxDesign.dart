import 'package:flutter/material.dart';
import 'package:recipe_view/checkboxState.dart';

class checkbox_Design extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => checkbox();
}

class checkbox extends State<checkbox_Design> {
  bool outvalue = false; //outvalue is change the state of check list
  var checkedstyle = TextDecoration.none;
  // var listOfIngrediant = [
  //   checkboxState(title: "Milk"),
  //   checkboxState(title: "Eggs"),
  //   checkboxState(title: "Cream"),
  //   checkboxState(title: "Sugar"),
  // ];
  @override
  Widget build(BuildContext context) {
    List<String> ingrediantFromDataBase = ["hjj", "jjkj"];

    List<checkboxState> listOfIngrediant = [
      // checkboxState(title: "Milk"),
      // checkboxState(title: "Eggs"),
      // checkboxState(title: "Cream"),
      // checkboxState(title: "Sugar"),
    ];
    //------------------from datatbase-----------------------
    for (int i = 0; i < ingrediantFromDataBase.length; i++) {
      listOfIngrediant.add(checkboxState(title: ingrediantFromDataBase[i]));
    }
    return Scaffold(
      body: ListView(padding: EdgeInsets.all(12), children: [
        //Text(listOfIngrediant[0].title)
        ...listOfIngrediant.map(creatCheckbox).toList(),
      ]),
    );
  }

  Widget creatCheckbox(checkboxState checkbox) => CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      activeColor: Color(0xFFeb6d44),
      value: checkbox.outvalue,
      title: Text(checkbox.title,
          style: TextStyle(
            decoration: checkbox.checkedstyle,
            decorationColor: Color(0xFFeb6d44),
            decorationThickness: 4,
          )),
      onChanged: (value) {
        setState(() {
          checkbox.outvalue = value;
          if (checkbox.outvalue == true) {
            checkbox.checkedstyle = TextDecoration.lineThrough;
          } else {
            checkbox.checkedstyle = TextDecoration.none;
          }
        });
      });
}
