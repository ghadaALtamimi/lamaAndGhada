import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:recipe_view/view_reicpe_flotingbutton.dart';

class Rating extends StatefulWidget {
  // final int maximumRating;
  // final Function(int) onRatingSelected;

  // Rating(this.onRatingSelected, [this.maximumRating = 5]);

  @override
  _Rating createState() => _Rating();
}

class _Rating extends State<Rating> {
  double rating = 0.0;
  int numOfRates = 0;
  double total = 0.0;
  double avg = 0.0;

  void showRaitingDialog() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Rate the recipe'),
          content: Column(
            children: [Text('Please leave your rating '), _buildRatinBar()],
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: Text('Submit'),
              onPressed: () {
                Navigator.pop(context);
                numOfRates++;
                print(numOfRates);
                total += rating;
                print('total $total');
                avg = total / numOfRates;
                print('Avg $avg');
              },
            ),
          ],
        ),
      );

  Widget _buildRatinBar() {
    return RatingBar.builder(
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: 30,
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (val) => setState(() {
        rating = val;

        print(rating);
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ActionButton(
      onPressed: () {
        showRaitingDialog();
      },
      icon: const Icon(Icons.star),
    );
  }
}
