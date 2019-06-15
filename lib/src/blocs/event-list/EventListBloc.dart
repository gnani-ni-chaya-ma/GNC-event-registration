import 'package:gnc_event_registration/src/constants/CategoriesConst.dart';
import 'package:gnc_event_registration/src/models/event/EventModel.dart';
import 'package:gnc_event_registration/src/resources/EventRepository.dart';
import 'package:rxdart/rxdart.dart';

class EventListBloc {
  final _eventRespository = EventRepository();
  final _eventListFetcher = PublishSubject<List<EventModel>>();
  final _summerCampList = PublishSubject<List<EventModel>>();
  final _fuzionList = PublishSubject<List<EventModel>>();
  final _yuvaList = PublishSubject<List<EventModel>>();

  Observable<List<EventModel>> get allEvents => _eventListFetcher.stream;
  Observable<List<EventModel>> get allSummerCamp => _summerCampList.stream;
  Observable<List<EventModel>> get allFuzionCamp => _fuzionList.stream;
  Observable<List<EventModel>> get allYuvaCamp => _yuvaList.stream;

  fetchAllEvents() async {
    List<EventModel> eventList = await _eventRespository.fetchEvents();
    const summerTempData = [];
    const fuzionTempData = [];
    const yuvaTempData = [];
    eventList.map((res) => {
          res.name.contains('summer')
              ? summerTempData.add(res)
              : res.name.contains('Yuva')
                  ? yuvaTempData.add(eventList)
                  : fuzionTempData.add(eventList)
        });
    print(yuvaTempData[0].name);
    _eventListFetcher.sink.add(eventList);
    _summerCampList.sink.add(summerTempData);
    _fuzionList.sink.add(fuzionTempData);
    _yuvaList.sink.add(yuvaTempData);
  }

  dispose() {
    _eventListFetcher.close();
    _summerCampList.close();
    _fuzionList.close();
    _yuvaList.close();
  }
}

final eventBloc = EventListBloc();
