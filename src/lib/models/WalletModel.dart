import 'package:dugbet/models/UtilityModel.dart';

class WalletModel {
  WalletModel({
    required this.id,
    required this.walletPicture,
    required this.description,
    required this.initialAmount,
    required this.expense,
    required this.income,
    required this.name,
    required this.type,
    required this.transactions,
  });
  late final String id;
  late final String walletPicture;
  late final String description;
  late final int initialAmount;
  late final int expense;
  late final int income;
  late final String name;
  late final String type;
  late final List<TransactionInfo> transactions;
  
  WalletModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    walletPicture = json['walletPicture'];
    description = json['description'];
    initialAmount = json['initialAmount'];
    expense = json['expense'];
    income = json['income'];
    name = json['name'];
    type = json['type'];
    transactions = List.from(json['transactions']).map((e)=>TransactionInfo.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['walletPicture'] = walletPicture;
    _data['description'] = description;
    _data['initialAmount'] = initialAmount;
    _data['expense'] = expense;
    _data['income'] = income;
    _data['name'] = name;
    _data['type'] = type;
    _data['transactions'] = transactions.map((e)=>e.toJson()).toList();
    return _data;
  }
}
