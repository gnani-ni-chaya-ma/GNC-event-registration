import 'dart:math';

import 'package:flutter_web/material.dart';
import 'package:gnc_event_registration/src/resources/ApiHelper.dart';
import 'package:gnc_event_registration/src/constants/CategoriesConst.dart';
import 'package:gnc_event_registration/src/constants/CardBackColorsConst.dart';

import 'package:gnc_event_registration/src/models/EventCategooriesModel.dart';
import 'package:gnc_event_registration/src/screens/event-list/EventList.dart';

class WebCategories extends StatelessWidget {
  final dynamic constraints;

  //List<EventCategoriesModel> eventCategories = categories;

  //// HARD CODED CATEGORIES CARDS///
  List<dynamic> eventCategories = tempCategories;
  List<Color> cardColors = cardBackColors;
  WebCategories(this.constraints) {
    if (eventCategories.length % 2 != 0) {
      eventCategories.add(EventCategoriesModel('More', 'no'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 100, right: 100),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Events",
                style: TextStyle(color: Colors.white, fontSize: 50),
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: GridView.builder(
              itemCount: eventCategories.length,
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 2),
              ),
              itemBuilder: (context, index) {
                return _webCategoryCardView(context, index);
              },
            ),
          )
        ],
      ),
    );
  }

  _webCategoryCardView(BuildContext context, int index) {
    /// TO DISPLAY RANDOM COLORS IN CARD, NOT NEEDED FOR HARD CODED///

    //Color thisCardColor = cardColors[Random().nextInt(7)];

    return Container(
      margin: EdgeInsets.all(10),
      child: Card(
        //elevation: 10.0,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: tempCategories[index]["color"],
        child: new InkWell(
          // For Touch Events
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EventList(selectedCategori: index),
              ),
            );
            Navigator.pushNamed(context, '/list');
          },

          child: Center(

              ///// TO DISPLAY TEXT FROM API /////

              // child: Text(
              //   eventCategories[index].eventName,
              //   textAlign: TextAlign.center,
              //   style: TextStyle(
              //       fontSize: 24,
              //       color: Colors.white70,
              //       fontWeight: FontWeight.bold),
              // ),

              child:
                  Image(image: AssetImage(tempCategories[index]["imagePath"]))),
        ),
      ),
    );
  }
}
