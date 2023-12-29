import 'dart:convert';

List<Transaction> transactionFromJson(String str) => List<Transaction>.from(
    json.decode(str).map((x) => Transaction.fromJson(x)));

String transactionToJson(List<Transaction> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Transaction {
  int transactionId;
  double amount;
  String category;
  String description;
  DateTime date;
  bool isIncome;

  Transaction({
    required this.transactionId,
    required this.amount,
    required this.category,
    required this.description,
    required this.date,
    required this.isIncome,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        transactionId: json["transactionID"],
        amount: json["amount"]?.toDouble(),
        category: json["category"],
        description: json["description"],
        date: DateTime.parse(json["date"]),
        isIncome: json["isIncome"],
      );

  Map<String, dynamic> toJson() => {
        "transactionID": transactionId,
        "amount": amount,
        "category": category,
        "description": description,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "isIncome": isIncome,
      };
}

final sample = [
  {
    "transactionID": 1,
    "amount": 15.99,
    "category": "Groceries",
    "description": "Weekly groceries at MegaMart",
    "date": "2023-12-20",
    "isIncome": false
  },
  {
    "transactionID": 2,
    "amount": 49.99,
    "category": "Utilities",
    "description": "Electricity bill",
    "date": "2023-12-15",
    "isIncome": false
  },
  {
    "transactionID": 3,
    "amount": 2500.00,
    "category": "Income",
    "description": "Monthly salary",
    "date": "2023-12-23",
    "isIncome": true
  },
  {
    "transactionID": 4,
    "amount": 12.50,
    "category": "Restaurants",
    "description": "Lunch at Pho Saigon",
    "date": "2023-12-23",
    "isIncome": false
  },
  {
    "transactionID": 5,
    "amount": 65.00,
    "category": "Transportation",
    "description": "Monthly bus pass",
    "date": "2023-12-22",
    "isIncome": false
  },
  {
    "transactionID": 6,
    "amount": 350.00,
    "category": "Rent",
    "description": "Monthly rent payment",
    "date": "2023-12-20",
    "isIncome": false
  },
  {
    "transactionID": 7,
    "amount": 80.00,
    "category": "Entertainment",
    "description": "Movie tickets",
    "date": "2023-12-18",
    "isIncome": false
  },
  {
    "transactionID": 8,
    "amount": 40.00,
    "category": "Gifts",
    "description": "Birthday gift for friend",
    "date": "2023-12-17",
    "isIncome": false
  },
  {
    "transactionID": 9,
    "amount": 25.00,
    "category": "Personal Care",
    "description": "Haircut",
    "date": "2023-12-15",
    "isIncome": false
  },
  {
    "transactionID": 10,
    "amount": 100.00,
    "category": "Savings",
    "description": "Transfer to savings account",
    "date": "2023-12-23",
    "isIncome": false
  }
];
