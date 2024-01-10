import 'package:dugbet/models/UtilityModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class TransactionModel {
  TransactionModel({
    required this.transactionId,
    required this.amount,
    required this.category,
    required this.subCategory,
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
  late final String subCategory;
  late final DateTime date;
  late final String description;
  late final String title;
  late final String type;
  late final bool isIncome;
  late final String payerId;
  late final String walletId;
  late final List<Member> members;
  
  TransactionModel.fromJson(Map<String, dynamic> json){
    transactionId = json['transactionId'];
    amount = json['amount'];
    category = json['category'];
    subCategory = json['subCategory'];
    date = DateTime.parse(json['date']);
    description = json['description'];
    title = json['title'];
    type = json['type'];
    isIncome = json['isIncome'];
    payerId = json['payerId'];
    walletId = json['walletId'];
    members = List.from(json['members']).map((e)=>Member.fromJson(e)).toList();
  }

  TransactionModel.fromDocumentSnapshot({required DocumentSnapshot documentSnapshot}){
    transactionId = documentSnapshot.id;
    amount = documentSnapshot['amount'];
    category = documentSnapshot['category'];
    subCategory = documentSnapshot['subCategory'];
    date = documentSnapshot['date'].toDate();
    description = documentSnapshot['description'];
    title = documentSnapshot['title'];
    type = documentSnapshot['type'];
    isIncome = documentSnapshot['isIncome'];
    payerId = documentSnapshot['payerId'];
    walletId = documentSnapshot['walletId'];
    //members = List.from(documentSnapshot['members']).map((e)=>Member.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['transactionId'] = transactionId;
    _data['amount'] = amount;
    _data['category'] = category;
    _data['subCategory'] = subCategory;
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
