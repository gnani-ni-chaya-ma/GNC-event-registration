import 'package:flutter_web/material.dart';
import 'package:gnc_event_registration/src/screens/event-form/web-event-form/web-event-form.dart';

import 'mobile-event-form/mobile-event-form.dart';

class EventForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return EventFormState();
  }
}

class EventFormState extends State<EventForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return Container(
      child: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return constraints.maxWidth < 700
                ? MobileEventForm(constraints.maxWidth)
                : WebEventForm(constraints.maxWidth);
          },
        ),
      ),
    );
  }
}
