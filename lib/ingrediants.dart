import 'package:flutter/material.dart';

import 'checkboxState.dart';

class ingrediants extends StatefulWidget {
  List<String> listOfin;
  String title;
  int s = 1;
  List<checkboxState> listOfIngrediant = [];
  ingrediants(this.listOfin, this.title);

  @override
  State<StatefulWidget> createState() => ingred();
}

bool outvalue = false; //outvalue is change the state of check list
var checkedstyle = TextDecoration.none;
//List<checkboxState> listOfIngrediant = [];

class ingred extends State<ingrediants> {
  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < widget.listOfin.length; i++) {
      if (widget.s != 0)
        widget.listOfIngrediant.add(checkboxState(title: widget.listOfin[i]));
      else
        break;
    }
    widget.s = 0;
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
          //color: Color(0xFFeb6d44),
          width: 380,
          decoration: BoxDecoration(
            color: Color(0xFFeb6d44),
            // border: Border.all(color: Color(0xFFeb6d44), width: 1),
            borderRadius: BorderRadius.circular(5),
            // shape: BoxShape.rectangle,
          ),
          child: Center(
            child: Text(
              widget.title,
              style: TextStyle(
                //backgroundColor: Colors.grey[50],
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        // Container(
        //   width: double.infinity,
        //   height: 200,
        //   margin: EdgeInsets.fromLTRB(10, 15, 30, 10),
        //   padding: EdgeInsets.only(bottom: 3, top: 15),
        //   decoration: BoxDecoration(
        //     // border: Border.all(color: Color(0xFFeb6d44), width: 1),
        //     borderRadius: BorderRadius.circular(5),
        //     shape: BoxShape.rectangle,
        //   ),
        // child: ListView(children: [
        ...widget.listOfIngrediant.map(creatCheckbox).toList(),
        //Text(listOfIngrediant[0].title)
        // ]),
        // ),
        // Positioned(
        //     left: 20,
        //     top: 5,
        //     child: Container(
        //       padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
        //       //color: Color(0xFFeb6d44),
        //       width: 380,
        //       decoration: BoxDecoration(
        //         color: Color(0xFFeb6d44),
        //         // border: Border.all(color: Color(0xFFeb6d44), width: 1),
        //         borderRadius: BorderRadius.circular(5),
        //         // shape: BoxShape.rectangle,
        //       ),
        //       child: Center(
        //         child: Text(
        //           widget.title,
        //           style: TextStyle(
        //             //backgroundColor: Colors.grey[50],
        //             fontSize: 17,
        //             fontWeight: FontWeight.bold,
        //             color: Colors.white,
        //           ),
        //         ),
        //       ),
        //     )
        //     ),
      ],
    );

    // ListView(children: [
    //   ...listOfIngrediant.map(creatCheckbox).toList(),
    //   //Text(listOfIngrediant[0].title)
    // ]);
  }

  Widget creatCheckbox(checkboxState checkbox) => CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      activeColor: Color(0xFFeb6d44),
      //contentPadding: EdgeInsets.only(left: 80),
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
