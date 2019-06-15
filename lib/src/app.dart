import 'package:flutter_web/material.dart';
import 'package:gnc_event_registration/src/screens/event-form/EventForm.dart';

import 'screens/event-categories/EventCategories.dart';
import 'screens/event-list/EventList.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: EventForm(), routes: <String, WidgetBuilder>{
      '/categories': (BuildContext context) => new EventCategories(),
      '/list': (BuildContext context) => new EventList(),
    });
  }
}
