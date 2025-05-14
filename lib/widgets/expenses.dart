import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

import "package:expense_tracker/widgets/expenses_list/expenses_list.dart";
import 'package:expense_tracker/models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registredExpenses = [
    Expense(
      title: "Flutter course",
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: "Cinema",
      amount: 15.92,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  // + abre pagina inferior
  void _oppenAddExpenseOverlay() {
    showModalBottomSheet(context: context, builder: (ctx) => NewExpense());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter expense Tracker"),
        actions: [
          IconButton(onPressed: _oppenAddExpenseOverlay, icon: Icon(Icons.add)),
        ],
      ),
      body: Column(
        children: [
          Text("the chart"),
          Expanded(child: ExpensesList(expenses: _registredExpenses)),
        ],
      ),
    );
  }
}
