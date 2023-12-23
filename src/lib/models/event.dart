import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  int eventID;
  final String eventName;
  final DateTime startDate;
  final DateTime endDate;

  Event(
      {this.eventID = 0,
      required this.eventName,
      required this.startDate,
      required this.endDate});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['eventID'] = eventID;
    data['eventName'] = eventName;
    data['startDate'] = startDate;
    data['endDate'] = endDate;

    return data;
  }

  static Event fromJon(Map<String, dynamic> json) => Event(
      eventID: json['eventID'],
      eventName: json['eventName'],
      startDate: (json['startDate'] as Timestamp).toDate(),
      endDate: (json['endDate'] as Timestamp).toDate());

// static Event fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot)=>Event(
//   eventID: snapshot['eventID'] as int,
//   eventName: snapshot['eventName'] as String,
//   startDate: (snapshot['startDate'] as Timestamp).toDate(),
//     endDate: (snapshot['endDate'] as Timestamp).toDate()
// );
}

List<Event> mockEvents = [
  Event(
    eventID: 1,
    eventName: 'Hue International Balloon Festival',
    startDate: DateTime(2023, 4, 27),
    endDate: DateTime(2023, 4, 29),
  ),
  Event(
    eventID: 2,
    eventName: 'Nha Trang Sea Festival',
    startDate: DateTime(2023, 5, 11),
    endDate: DateTime(2023, 5, 14),
  ),
  Event(
    eventID: 3,
    eventName: 'Vesak Day',
    startDate: DateTime(2023, 5, 1),
    endDate: DateTime(2023, 5, 31),
  ),
  Event(
    eventID: 4,
    eventName: 'Da Nang International Fireworks Festival',
    startDate: DateTime(2023, 7, 1),
    endDate: DateTime(2023, 7, 31),
  ),
  Event(
    eventID: 5,
    eventName: 'Da Lat Flower Festival',
    startDate: DateTime(2023, 12, 1),
    endDate: DateTime(2023, 12, 31),
  ),
  Event(
    eventID: 6,
    eventName: 'Bái Đính Temple Festival',
    startDate: DateTime(2021, 2, 17),
    endDate: DateTime(2021, 2, 17),
  ),
  Event(
    eventID: 7,
    eventName: 'HCM City Tourism Day',
    startDate: DateTime(2020, 7, 16),
    endDate: DateTime(2020, 7, 16),
  ),
  Event(
    eventID: 8,
    eventName: 'Vote for the 10 cultural, sports and tourism events of 2016',
    startDate: DateTime(2016, 12, 29),
    endDate: DateTime(2016, 12, 29),
  ),
  Event(
    eventID: 9,
    eventName: '16th Ho Chi Minh City Tourism Day',
    startDate: DateTime(2017, 4, 16),
    endDate: DateTime(2017, 4, 19),
  ),
  Event(
    eventID: 10,
    eventName: 'Top 10 typical cultural, sports and tourism events in 2018',
    startDate: DateTime(2018, 12, 31),
    endDate: DateTime(2018, 12, 31),
  ),
  Event(
    eventID: 11,
    eventName: 'Vietnam International Textile & Apparel Accessories Exhibition',
    startDate: DateTime(2023, 10, 25),
    endDate: DateTime(2023, 10, 28),
  ),
  Event(
    eventID: 12,
    eventName:
        'International Exhibition HVACR, Cleanroom and High- Tech Factory',
    startDate: DateTime(2023, 10, 26),
    endDate: DateTime(2023, 10, 28),
  ),
  Event(
    eventID: 13,
    eventName: 'Vietnam International Plastics and Rubber Industry Exhibition',
    startDate: DateTime(2023, 10, 18),
    endDate: DateTime(2023, 10, 21),
  ),
  Event(
    eventID: 14,
    eventName: 'Vietnam Foodexpo',
    startDate: DateTime(2023, 11, 22),
    endDate: DateTime(2023, 11, 25),
  ),
  Event(
    eventID: 15,
    eventName: 'Vietstock Expo & Forum',
    startDate: DateTime(2023, 10, 11),
    endDate: DateTime(2023, 10, 13),
  ),
  Event(
    eventID: 16,
    eventName: 'Vietnam International Industrial Fair',
    startDate: DateTime(2023, 10, 10),
    endDate: DateTime(2023, 10, 12),
  ),
  Event(
    eventID: 17,
    eventName: 'Vietnam Hanoi Fabric & Garment Accessories Expo',
    startDate: DateTime(2023, 10, 25),
    endDate: DateTime(2023, 10, 27),
  ),
  Event(
    eventID: 18,
    eventName: 'Vietnam International Furniture & Home Accessories Fair',
    startDate: DateTime(2024, 2, 26),
    endDate: DateTime(2024, 2, 29),
  ),
  Event(
    eventID: 19,
    eventName: 'Vietnam International Medical and Pharmaceutical Exhibition',
    startDate: DateTime(2024, 5, 8),
    endDate: DateTime(2024, 5, 11),
  ),
  Event(
    eventID: 20,
    eventName: 'Automechanika Ho Chi Minh',
    startDate: DateTime(2024, 6, 20),
    endDate: DateTime(2024, 6, 22),
  ),
  Event(
    eventID: 21,
    eventName: 'Vietnam International Textile & Apparel Accessories Exhibition',
    startDate: DateTime(2026, 10, 25),
    endDate: DateTime(2026, 10, 28),
  ),
  Event(
    eventID: 22,
    eventName:
        'International Exhibition HVACR, Cleanroom and High- Tech Factory',
    startDate: DateTime(2026, 10, 26),
    endDate: DateTime(2026, 10, 28),
  ),
  Event(
    eventID: 23,
    eventName: 'Vietnam International Plastics and Rubber Industry Exhibition',
    startDate: DateTime(2026, 10, 18),
    endDate: DateTime(2026, 10, 21),
  ),
  Event(
    eventID: 24,
    eventName: 'Vietnam Foodexpo',
    startDate: DateTime(2026, 11, 22),
    endDate: DateTime(2026, 11, 25),
  ),
  Event(
    eventID: 25,
    eventName: 'Vietstock Expo & Forum',
    startDate: DateTime(2026, 10, 11),
    endDate: DateTime(2026, 10, 13),
  ),
  Event(
    eventID: 26,
    eventName: 'Vietnam International Industrial Fair',
    startDate: DateTime(2026, 10, 10),
    endDate: DateTime(2026, 10, 12),
  ),
  Event(
    eventID: 27,
    eventName: 'Vietnam Hanoi Fabric & Garment Accessories Expo',
    startDate: DateTime(2026, 10, 25),
    endDate: DateTime(2026, 10, 27),
  ),
  Event(
    eventID: 28,
    eventName: 'Vietnam International Furniture & Home Accessories Fair',
    startDate: DateTime(2027, 2, 26),
    endDate: DateTime(2027, 2, 29),
  ),
  Event(
    eventID: 29,
    eventName: 'Vietnam International Medical and Pharmaceutical Exhibition',
    startDate: DateTime(2027, 5, 8),
    endDate: DateTime(2027, 5, 11),
  ),
  Event(
    eventID: 30,
    eventName: 'Automechanika Ho Chi Minh',
    startDate: DateTime(2027, 6, 20),
    endDate: DateTime(2027, 6, 22),
  ),
  // Add more events as needed
];
