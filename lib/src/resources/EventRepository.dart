import 'dart:async';
import 'ApiHelper.dart';
import '../models/event/EventModel.dart';

class EventRepository {
  final eventApiProvider = Apihelper();
  Future<List<EventModel>> fetchEvents() =>
      eventApiProvider.getCategoryEvents();
}
