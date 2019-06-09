class EventModel {
  int id;
  Venue venue;
  String name;
  int year;
  String startDate;
  String endDate;
  String lastDateOfRegistration;
  String fees;
  String lateFees;
  bool accommodationProvided;
  String eventCode;
  String gender;
  int minAge;
  int maxAge;
  String rules;
  String remarks;
  bool active;
  int center;

  EventModel(
      {this.id,
      this.venue,
      this.name,
      this.year,
      this.startDate,
      this.endDate,
      this.lastDateOfRegistration,
      this.fees,
      this.lateFees,
      this.accommodationProvided,
      this.eventCode,
      this.gender,
      this.minAge,
      this.maxAge,
      this.rules,
      this.remarks,
      this.active,
      this.center});

  EventModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    venue = json['venue'] != null ? new Venue.fromJson(json['venue']) : null;
    name = json['name'];
    year = json['year'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    lastDateOfRegistration = json['last_date_of_registration'];
    fees = json['fees'];
    lateFees = json['late_fees'];
    accommodationProvided = json['accommodation_provided'];
    eventCode = json['event_code'];
    gender = json['gender'];
    minAge = json['min_age'];
    maxAge = json['max_age'];
    rules = json['rules'];
    remarks = json['remarks'];
    active = json['active'];
    center = json['center'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.venue != null) {
      data['venue'] = this.venue.toJson();
    }
    data['name'] = this.name;
    data['year'] = this.year;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['last_date_of_registration'] = this.lastDateOfRegistration;
    data['fees'] = this.fees;
    data['late_fees'] = this.lateFees;
    data['accommodation_provided'] = this.accommodationProvided;
    data['event_code'] = this.eventCode;
    data['gender'] = this.gender;
    data['min_age'] = this.minAge;
    data['max_age'] = this.maxAge;
    data['rules'] = this.rules;
    data['remarks'] = this.remarks;
    data['active'] = this.active;
    data['center'] = this.center;
    return data;
  }
}

class Venue {
  int id;
  String country;
  String address1;
  String address2;
  String city;
  String state;
  String zipCode;
  String raw;

  Venue(
      {this.id,
      this.country,
      this.address1,
      this.address2,
      this.city,
      this.state,
      this.zipCode,
      this.raw});

  Venue.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    country = json['country'];
    address1 = json['address_1'];
    address2 = json['address_2'];
    city = json['city'];
    state = json['state'];
    zipCode = json['zip_code'];
    raw = json['raw'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['country'] = this.country;
    data['address_1'] = this.address1;
    data['address_2'] = this.address2;
    data['city'] = this.city;
    data['state'] = this.state;
    data['zip_code'] = this.zipCode;
    data['raw'] = this.raw;
    return data;
  }
}
