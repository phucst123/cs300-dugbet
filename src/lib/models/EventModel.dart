import 'package:dugbet/models/UtilityModel.dart';

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
  });
  late final String id;
  late final String name;
  late final String description;
  late final DateTime startDate;
  late final DateTime endDate;
  late final int initialAmount;
  late final List<TransactionInfo> transactions;
  late final List<Member> members;
  
  EventModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    description = json['description'];
    startDate = DateTime.parse(json['startDate']);
    endDate = DateTime.parse(json['endDate']);
    initialAmount = json['initialAmount'];
    transactions = List.from(json['transactions']).map((e)=>TransactionInfo.fromJson(e)).toList();
    members = List.from(json['members']).map((e)=>Member.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['description'] = description;
    _data['startDate'] = startDate;
    _data['endDate'] = endDate;
    _data['initialAmount'] = initialAmount;
    _data['transactions'] = transactions.map((e)=>e.toJson()).toList();
    _data['members'] = members.map((e)=>e.toJson()).toList();
    return _data;
  }
}