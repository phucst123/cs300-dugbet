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
  late final String startDate;
  late final String endDate;
  late final int initialAmount;
  late final List<Transactions> transactions;
  late final List<Members> members;
  
  EventModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    description = json['description'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    initialAmount = json['initialAmount'];
    transactions = List.from(json['transactions']).map((e)=>Transactions.fromJson(e)).toList();
    members = List.from(json['members']).map((e)=>Members.fromJson(e)).toList();
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

class Transactions {
  Transactions({
    required this.id,
  });
  late final String id;
  
  Transactions.fromJson(Map<String, dynamic> json){
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    return _data;
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
    final _data = <String, dynamic>{};
    _data['id'] = id;
    return _data;
  }
}