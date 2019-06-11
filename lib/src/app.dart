import 'package:flutter_web/material.dart';

import 'screens/event-categories/EventCategories.dart';
import 'screens/event-list/EventList.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: EventCategories(), routes: <String, WidgetBuilder>{
      '/categories': (BuildContext context) => new EventCategories(),
      '/list': (BuildContext context) => new EventList(),
    });
  }
}
