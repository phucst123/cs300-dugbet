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
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['initialAmount'] = initialAmount;
    data['transactions'] = transactions.map((e)=>e.toJson()).toList();
    data['members'] = members.map((e)=>e.toJson()).toList();
    return data;
  }
<<<<<<< Updated upstream
=======
}

class Transactions {
  Transactions({
    required this.id,
  });
  late final String id;
  
  Transactions.fromJson(Map<String, dynamic> json){
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    return data;
  }
}

class Members {
  Members({
    required this.id,
  });
  late final String id;
  
  Members.fromJson(Map<String, dynamic> json){
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    return data;
  }
>>>>>>> Stashed changes
}