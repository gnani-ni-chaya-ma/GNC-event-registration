import 'package:flutter_web/material.dart';

import '../../models/EventCategooriesModel.dart';
import 'package:gnc_event_registration/src/constants/CategoriesConst.dart';
import './web-categories/web-categories.dart';
import 'mobile-categories/mobile-categories.dart';

class EventCategories extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return EventCategoriesState();
  }
}

class EventCategoriesState extends State<EventCategories> {
  int count;
  double cardCount;
  List<EventCategoriesModel> eventCategories = categories;

  PageController ctrl = PageController(viewportFraction: 0.7, keepPage: false);

  @override
  void initState() {
    super.initState();
    count = num.parse((eventCategories.length / 2).toStringAsFixed(0));
    print(count);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Event Categories'),
        ),
      ),
      backgroundColor: Colors.blueAccent,
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return Container(
      child: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return constraints.maxWidth < 700
                ? MobileCategories(constraints.maxWidth)
                : WebCategories(constraints.maxWidth);
          },
        ),
      ),
    );
  }
}