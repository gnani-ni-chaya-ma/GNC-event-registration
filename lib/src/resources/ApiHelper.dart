import 'dart:convert';

import 'package:gnc_event_registration/src/models/event/EventModel.dart';
import 'package:http/http.dart' as http;

class Apihelper {
  Future<List<EventModel>> getCategoryEvents(String category) async {
    var url =
        "http://ec2-13-232-87-27.ap-south-1.compute.amazonaws.com/events/?active=true&format=json";
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> list = json.decode(response.body);
      List<EventModel> eventListFormJson = [];
      for (var item in list) {
        eventListFormJson.add(EventModel.fromJson(item));
      }
      return eventListFormJson;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}

