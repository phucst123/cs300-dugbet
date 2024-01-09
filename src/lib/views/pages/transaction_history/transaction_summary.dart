import 'package:flutter/material.dart';

class TransactionSummary {
  final String title;
  final String description;
  final String amount;
  final DateTime date;
  final IconData icon;
  final bool isIncome;

  TransactionSummary({
    required this.title,
    required this.description,
    required this.amount,
    required this.date,
    required this.icon,
    required this.isIncome,
  });
}