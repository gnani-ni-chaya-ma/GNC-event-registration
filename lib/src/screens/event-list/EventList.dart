import 'package:flutter_web/material.dart';
import 'package:gnc_event_registration/src/blocs/event-list/EventListBloc.dart';
import 'package:gnc_event_registration/src/constants/CategoriesConst.dart';
import 'package:gnc_event_registration/src/models/event/EventModel.dart';
import 'package:gnc_event_registration/src/screens/event-list/web-lists/WebLists.dart';

import 'mobile-lists/MobileList.dart';

class EventList extends StatefulWidget {
  final int selectedCategori;

  const EventList({Key key, this.selectedCategori}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return EventListState();
  }
}

class EventListState extends State<EventList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
        child: StreamBuilder(
          stream: eventBloc.allYuvaCamp,
          // widget.selectedCategori == categoriesList.summerCamp.index
          //     ? eventBloc.allSummerCamp
          //     : widget.selectedCategori == categoriesList.yuvacamp.index
          //         ? eventBloc.allYuvaCamp
          //         : eventBloc.allFuzionCamp,
          builder: (context, AsyncSnapshot<List<EventModel>> snapshot) {
            print(snapshot);
            return snapshot.hasData
                ? LayoutBuilder(
                    builder: (context, constraints) {
                      return constraints.maxWidth < 700
                          ? MobileLists(
                              constraints: constraints, data: snapshot)
                          : WebLists(constraints: constraints, data: snapshot);
                    },
                  )
                : CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
