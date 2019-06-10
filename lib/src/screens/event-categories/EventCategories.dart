
import 'package:flutter_web/material.dart';
import 'package:flutter_web/rendering.dart';

class EventCategoriesModel {
  String eventName;
  String eventImage;

  EventCategoriesModel(this.eventName, this.eventImage);
}

class EventCategories extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return EventCategoriesState();
  }
}

class EventCategoriesState extends State<EventCategories> {
  List<EventCategoriesModel> eventCategories = [
    EventCategoriesModel('Summer Camp', 'no'),
    EventCategoriesModel('Fuzion', 'no'),
    EventCategoriesModel('Yuva Camp', 'no'),
    EventCategoriesModel('Yuva Pro', 'no'),
    EventCategoriesModel('Workshops', 'no'),
    EventCategoriesModel('Picnics', 'no'),
  ];
  int count;
  double cardCount;

  PageController ctrl = PageController(viewportFraction: 0.7, keepPage: false);

  @override
  void initState() {
    super.initState();
    count = num.parse((eventCategories.length / 2).toStringAsFixed(0));
    print(count);
    // cardCount = MediaQuery.of(context).size.width / eventCategories.length;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Event Categories'),
        ),
      ),
      backgroundColor: Colors.lightBlue,
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return Container(
      child: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return constraints.maxWidth < 700
                ? mobileView(constraints.maxWidth)
                : webView(constraints.maxWidth);
          },
        ),
      ),
    );
  }

  mobileView(constraints) {
    return Center(
      child: PageView(
        controller: ctrl,
        children: List.generate(
          eventCategories.length,
          (index) {
            return mobileCards(index, constraints);
          },
        ),
      ),
    );
  }

  webView(constraints) {
    return Container(
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(
                    eventCategories.length,
                    (index) {
                      return webCard(index, constraints);
                    },
                  ),
                ),
              ),
            ),
          ],
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

  webCard(index, constraints) {
    return Container(
      height: 200,
      width: constraints / 2,
      padding: EdgeInsets.only(top: 30, right: 15, left: 15),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        elevation: 3.0,
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
