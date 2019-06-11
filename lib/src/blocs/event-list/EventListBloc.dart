import 'package:gnc_event_registration/src/models/event/EventModel.dart';
import 'package:gnc_event_registration/src/resources/EventRepository.dart';
import 'package:rxdart/rxdart.dart';

class EventListBloc {
  final _eventRespository = EventRepository();
  final _eventListFetcher = PublishSubject<List<EventModel>>();

  Observable<List<EventModel>> get allEvents => _eventListFetcher.stream;

  fetchAllEvents() async {
    List<EventModel> eventList = await _eventRespository.fetchEvents();
    _eventListFetcher.sink.add(eventList);
  }

  dispose() {
    _eventListFetcher.close();
  }
}

final eventBloc = EventListBloc();
