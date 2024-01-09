// transaction template, could be implemented in the future
import 'package:flutter/material.dart';

class TransactionTemplate {
  final String category;
  final String title;
  final String description;
  final int amount;
  final DateTime date;
  final String icon;
  final int type; // 0 for expense, 1 for income

  const TransactionTemplate({
    required this.category,
    required this.title,
    required this.description,
    required this.amount,
    required this.date,
    required this.icon,
    required this.type, // Include type in the constructor
  });
}