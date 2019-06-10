import 'package:flutter_web/material.dart';
import 'package:gnc_event_registration/src/screens/event-list/web-lists/WebLists.dart';

import 'mobile-lists/MobileList.dart';

class EventList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return EventListState();
  }
}

class EventListState extends State<EventList> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return Container(
      child: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return constraints.maxWidth < 700
                ? MobileLists(constraints: constraints)
                : WebLists(constraints: constraints);
          },
        ),
      ),
    );
  }
}
