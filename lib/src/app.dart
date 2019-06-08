import 'package:flutter_web/material.dart';

import 'screens/event-categories/EventCategories.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(home: EventCategories(), routes: <String, WidgetBuilder>{
      '/categories': (BuildContext context) => new EventCategories(),
    });
  }
}
