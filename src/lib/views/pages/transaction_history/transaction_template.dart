// transaction template, could be implemented in the future
import 'package:flutter/material.dart';

class TransactionTemplate {
  final String title;
  final String description;
  final double amount;
  final DateTime date;
  final IconData icon;
  final int type; // 0 for expense, 1 for income

  const TransactionTemplate({
    required this.title,
    required this.description,
    required this.amount,
    required this.date,
    required this.icon,
    required this.type, // Include type in the constructor
  });
}