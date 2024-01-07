import 'dart:ffi';

import 'package:flutter/material.dart';

// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionModel extends StatelessWidget {
  final double amount;
  final String category;
  final DateTime date;
  final String description;
  final String title;
  final bool type;
  final String wallet;

  TransactionModel({
    required this.amount,
    required this.category,
    required this.date,
    required this.description,
    required this.title,
    required this.type,
    required this.wallet,
  });

  @override
  Widget build(BuildContext context) {
    // Create a CollectionReference called transactions that references the firestore collection
    CollectionReference transactions = FirebaseFirestore.instance.collection('Transactions');

    Future<void> addTransaction() {
      // Call the user's CollectionReference to add a new user
      return transactions
          .add({
            // 'full_name': fullName, // John Doe
            // 'company': company, // Stokes and Sons
            // 'age': age // 42
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }
    return Text("Sth");
    // return TextButton(
    //   onPressed: addUser,
    //   child: Text(
    //     "Add User",
    //   ),
    // );
  }
}