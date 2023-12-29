import 'package:dugbet/models/transaction/transaction.dart';

class EventTransaction extends Transaction {
  List<int> member;
  int payer;

  EventTransaction({
    required int transactionId,
    required double amount,
    required String category,
    required String description,
    required DateTime date,
    required bool isIncome,
    required this.member,
    required this.payer,
  }) : super(
          transactionId: transactionId,
          amount: amount,
          category: category,
          description: description,
          date: date,
          isIncome: isIncome,
        );

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
