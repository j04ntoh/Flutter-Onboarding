import 'package:flutter/material.dart';
import 'package:flutter_mvc/utils/assets.dart';
import 'package:flutter_mvc/Onboarding/dot_indicator.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class Page1 extends StatelessWidget {
  var rating = 3.0;

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: double.infinity,
      width: double.infinity,
      decoration: new BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Colors.green[400],
                Colors.blue[600],
                Colors.blue[900],
              ],
              begin: Alignment(0.5, -1.0),
              end: Alignment(0.5, 1.0)
          )
      ),
      child: Stack(
        children: <Widget>[
          new Positioned(
            child: new DotIndicator(Assets.pose1),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          new Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  child: Image(
                    image: AssetImage(Assets.pose1),
                    fit: BoxFit.fitHeight,
                  ),
                  height: IMAGE_SIZE,
                  width: IMAGE_SIZE,
                ),
                new Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Workout at home, outside or in the studio',
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                Text('Workout anywhere without any equipment!',
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                SmoothStarRating(
                  rating: rating,
                  isReadOnly: false,
                  size: 60,
                  filledIconData: Icons.star,
                  //halfFilledIconData: Icons.star_half,
                  defaultIconData: Icons.star_border,
                  starCount: 5,
                  allowHalfRating: false,
                  spacing: 2.0,
                  color: Colors.black38,
                  borderColor: Colors.black26,
                  onRated: (value) {
                    print("rating value -> $value");
                    // print("rating value dd -> ${value.truncate()}");
                  },
                )
              ],
            ),
          )
        ],
        alignment: FractionalOffset.center,
      ),
    );
  }
}