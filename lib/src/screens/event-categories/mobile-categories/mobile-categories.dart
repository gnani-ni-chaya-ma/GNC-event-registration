import 'dart:math';

import 'package:flutter_web/material.dart';
import 'package:gnc_event_registration/src/constants/CategoriesConst.dart';
import 'package:gnc_event_registration/src/models/EventCategooriesModel.dart';

import 'package:gnc_event_registration/src/constants/CardBackColorsConst.dart';

class MobileCategories extends StatelessWidget {
  dynamic constraints;
  final PageController ctrl =
      PageController(viewportFraction: 0.7, keepPage: false);
  final List<EventCategoriesModel> eventCategories = categories;
  final List<Color> cardColors = cardBackColors;

  MobileCategories(this.constraints);

  @override
  Widget build(BuildContext context) {
    // return Center(
    //   child: PageView(
    //     controller: ctrl,
    //     children: List.generate(
    //       eventCategories.length,
    //       (index) {
    //         return mobileCards(index, constraints);
    //       },
    //     ),
    //   ),
    // );
    return _buildMobileView();
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
    Color thisCardColor = cardColors[Random().nextInt(7)];

    return Container(
      height: MediaQuery.of(context).size.height / 4,
      padding: EdgeInsets.only(top: 30, right: 15, left: 15),
      child: Card(
        color: thisCardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 3.0,
        child: Center(
          // child: Text(
          //   eventCategories[index].eventName,
          //   style: TextStyle(fontSize: 30),
          // ),
          child: Center(
            child: Image(image: AssetImage("images/Workshops.png")),
          ),
        ),
      ),
    );
  }

  mobileCards(index, constraints) {
    return Container(
      padding: EdgeInsets.only(top: 80, bottom: 80),
      height: 200,
      width: constraints / 2,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        margin: EdgeInsets.all(10.0),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        borderOnForeground: true,
        elevation: 5.0,
        child: Center(
          child: Text(
            eventCategories[index].eventName,
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}
