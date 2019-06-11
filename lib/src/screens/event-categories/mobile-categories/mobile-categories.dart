import 'dart:math';

import 'package:flutter_web/material.dart';
import 'package:gnc_event_registration/src/constants/CategoriesConst.dart';
import 'package:gnc_event_registration/src/models/EventCategooriesModel.dart';

import 'package:gnc_event_registration/src/constants/CardBackColorsConst.dart';

class MobileCategories extends StatelessWidget {
  dynamic constraints;

  //List<EventCategoriesModel> eventCategories = categories;

  //// HARD CODED CATEGORIES CARDS///
  List<dynamic> eventCategories = tempCategories;

  //final List<Color> cardColors = cardBackColors;

  MobileCategories(this.constraints);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child:Text("Events")),),
      backgroundColor: Colors.blueGrey,
      body: _buildMobileView(),
    );
  }

  _buildMobileView() {
    return ListView.builder(
      itemCount: eventCategories.length,
      itemBuilder: (context, index) {
        return _buildMobileCard(context, index);
      },
    );
  }

  _buildMobileCard(BuildContext context, int index) {
    //Color thisCardColor = cardColors[Random().nextInt(7)];

    return Container(
      height: MediaQuery.of(context).size.height / 4,
      padding: EdgeInsets.only(top: 30, right: 15, left: 15),
      child: Card(
          color: tempCategories[index]["color"],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 3.0,
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/list');
            },
            child: Center(
              child: Center(
                child: Image(image: AssetImage(tempCategories[index]["imagePath"])),
                // child: Text(
                //   eventCategories[index].eventName,
                //   style: TextStyle(fontSize: 30),
                // ),
              ),
            ),
          )),
    );
  }
}
