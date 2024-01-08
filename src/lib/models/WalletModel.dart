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
    final data = <String, dynamic>{};
    data['id'] = id;
    data['walletPicture'] = walletPicture;
    data['description'] = description;
    data['initialAmount'] = initialAmount;
    data['expense'] = expense;
    data['income'] = income;
    data['name'] = name;
    data['type'] = type;
    data['transactions'] = transactions.map((e)=>e.toJson()).toList();
    return data;
  }
}
