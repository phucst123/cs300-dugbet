import 'package:dugbet/models/UtilityModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EventModel {
  EventModel({
    required this.id,
    required this.name,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.initialAmount,
    required this.transactions,
    required this.members,
    required this.eventPicture,
  });
  late final String id;
  late final String name;
  late final String description;
  late final DateTime startDate;
  late final DateTime endDate;
  late final int initialAmount;
  late final List<TransactionInfo> transactions;
  late final List<Member> members;
  late final String eventPicture;
  
  EventModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    description = json['description'];
    startDate = DateTime.parse(json['startDate']);
    endDate = DateTime.parse(json['endDate']);
    initialAmount = json['initialAmount'];
    transactions = List.from(json['transactions']).map((e)=>TransactionInfo.fromJson(e)).toList();
    members = List.from(json['members']).map((e)=>Member.fromJson(e)).toList();
    eventPicture = json['eventPicture'];
  }

  EventModel.fromDocumentSnapshot({required DocumentSnapshot documentSnapshot}){
    id = documentSnapshot.id;
    name = documentSnapshot['name'];
    description = documentSnapshot['description'];
    startDate = documentSnapshot['startDate'].toDate();
    endDate = documentSnapshot['endDate'].toDate();
    initialAmount = documentSnapshot['initialAmount'];
    //transactions = List.from(documentSnapshot['transactions']).map((e)=>TransactionInfo.fromJson(e)).toList();
    //members = List.from(documentSnapshot['members']).map((e)=>Member.fromJson(e)).toList();
    eventPicture = documentSnapshot['eventPicture'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['initialAmount'] = initialAmount;
    data['transactions'] = transactions.map((e)=>e.toJson()).toList();
    data['members'] = members.map((e)=>e.toJson()).toList();
    data['eventPicture'] = eventPicture;
    return data;
  }
}