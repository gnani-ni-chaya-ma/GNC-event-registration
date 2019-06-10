import 'package:flutter_web/material.dart';
import 'package:gnc_event_registration/src/models/event-list/EventListModel.dart';
import 'package:rxdart/rxdart.dart';

class EventListBloc {

  final _eventListStep = PublishSubject<EventListStepModel>();
  Observable<EventListStepModel> get stepperSteps => _eventListStep;


  dispose() {
    _eventListStep.close();
  }
}

final bloc = EventListBloc();