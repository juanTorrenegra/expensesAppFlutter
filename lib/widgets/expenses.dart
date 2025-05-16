import 'package:expense_tracker/widgets/chart/chart.dart';
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
    showModalBottomSheet(
      useSafeArea: true, //141
      isScrollControlled: true, //modal takes full height
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense), //120u onAddEx
    );
  }

  //120u new_expense.dart
  void _addExpense(Expense expense) {
    setState(() {
      _registredExpenses.add(expense);
    });
  }

  //122
  void _removeExpense(Expense expense) {
    final expenseIndex = _registredExpenses.indexOf(expense); //123
    setState(() {
      _registredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 3),
        content: Text("Expense deleted"),
        action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            setState(() {
              _registredExpenses.insert(expenseIndex, expense); //123
            });
          },
        ),
      ),
    ); //123
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    Widget mainContent = Center(child: Text("No expenses, start adding som"));

    if (_registredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registredExpenses,
        onRemoveExpense: _removeExpense,
      ); //123
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter expense Tracker"),
        actions: [
          IconButton(onPressed: _oppenAddExpenseOverlay, icon: Icon(Icons.add)),
        ],
      ),
      body:
          width <
                  600 // 138
              ? Column(
                children: [
                  Chart(expenses: _registredExpenses),
                  Expanded(child: mainContent),
                ],
              )
              : Row(
                children: [
                  Expanded(child: Chart(expenses: _registredExpenses)),

                  Expanded(child: mainContent),
                ],
              ),
    );
  }
}
