import "package:uuid/uuid.dart";
import 'package:flutter/material.dart';
import "package:intl/intl.dart";

final formatter = DateFormat.yMd(); //intl

const uuid = Uuid();

enum Category { food, travel, leisure, work }

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
}; //Icon(categoryIcons[expense.category]) expense_item.dart

class Expense {
  Expense({
    required this.title,
    //this.id,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4(); //uuid

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate {
    return formatter.format(date);
  }
}
