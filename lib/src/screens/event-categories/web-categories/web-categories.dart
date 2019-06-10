import 'dart:math';

import 'package:flutter_web/material.dart';
import 'package:gnc_event_registration/src/constants/CategoriesConst.dart';
import 'package:gnc_event_registration/src/constants/CardBackColorsConst.dart';

import 'package:gnc_event_registration/src/models/EventCategooriesModel.dart';

class WebCategories extends StatelessWidget {

  final dynamic constraints;

  List<EventCategoriesModel> eventCategories = categories;
  List<Color> cardColors = cardBackColors;
    WebCategories(this.constraints){
      if(eventCategories.length%2 != 0){
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
    Color thisCardColor = cardColors[Random().nextInt(7)];
    return Container(
      margin: EdgeInsets.all(10),
      child: Card(
        //elevation: 10.0,
        
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: thisCardColor,
        child: new InkWell(
          // For Touch Events
          onTap: () {},
          
          child: Center(child: Image(image: AssetImage("images/Workshops.png"))
              // Text(
              //   eventCategories[index].eventName,
              //   textAlign: TextAlign.center,
              //   style: TextStyle(
              //       fontSize: 24,
              //       color: Colors.black,
              //       fontWeight: FontWeight.bold),
              // ),
              ),
        ),
      ),
    );
  }
}
