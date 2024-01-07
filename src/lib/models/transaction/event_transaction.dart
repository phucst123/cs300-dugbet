import 'package:dugbet/models/transaction/transaction.dart';

class EventTransaction extends Transaction {
  List<int> member;
  int payer;

  EventTransaction({
    required super.transactionId,
    required super.amount,
    required super.category,
    required super.description,
    required super.date,
    required super.isIncome,
    required this.member,
    required this.payer,
  });

  factory EventTransaction.fromJson(Map<String, dynamic> json) =>
      EventTransaction(
        transactionId: json["transactionID"],
        amount: json["amount"]?.toDouble(),
        category: json["category"],
        description: json["description"],
        date: DateTime.parse(json["date"]),
        isIncome: json["isIncome"],
        member: json["member"]?.cast<int>(),
        payer: json["payer"],
      );

  @override
  Map<String, dynamic> toJson() => {
        ...super.toJson(),
        "member": member,
        "payer": payer,
      };
}

final sample = [
  {
    "transactionID": 1,
    "amount": 54.99,
    "category": "Groceries",
    "description": "Weekly shopping at Metro Market",
    "date": "2023-12-22",
    "isIncome": false,
    "member": ["username1", "username2"],
    "payer": "username1"
  },
  {
    "transactionID": 2,
    "amount": 1250.00,
    "category": "Salary",
    "description": "Monthly salary payment",
    "date": "2023-12-23",
    "isIncome": true,
    "member": ["username3"],
    "payer": "username1"
  },
];
