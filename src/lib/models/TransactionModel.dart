class TransactionModel {
  TransactionModel({
    required this.transactionId,
    required this.amount,
    required this.category,
    required this.date,
    required this.description,
    required this.title,
    required this.type,
    required this.isIncome,
    required this.payerId,
    required this.walletId,
    required this.members,
  });
  late final String transactionId;
  late final int amount;
  late final String category;
  late final String date;
  late final String description;
  late final String title;
  late final String type;
  late final bool isIncome;
  late final String payerId;
  late final String walletId;
  late final List<Members> members;
  
  TransactionModel.fromJson(Map<String, dynamic> json){
    transactionId = json['transactionId'];
    amount = json['amount'];
    category = json['category'];
    date = json['date'];
    description = json['description'];
    title = json['title'];
    type = json['type'];
    isIncome = json['isIncome'];
    payerId = json['payerId'];
    walletId = json['walletId'];
    members = List.from(json['members']).map((e)=>Members.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['transactionId'] = transactionId;
    _data['amount'] = amount;
    _data['category'] = category;
    _data['date'] = date;
    _data['description'] = description;
    _data['title'] = title;
    _data['type'] = type;
    _data['isIncome'] = isIncome;
    _data['payerId'] = payerId;
    _data['walletId'] = walletId;
    _data['members'] = members.map((e)=>e.toJson()).toList();
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