import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense, //122
  });

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense; //122

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder:
          (cnx, index) => Dismissible(
            key: ValueKey(expenses[index]), //122
            background: Container(
              color: Theme.of(context).colorScheme.error,
              margin: EdgeInsets.symmetric(
                horizontal: Theme.of(context).cardTheme.margin!.horizontal,
              ),
            ),
            onDismissed: (direction) {
              onRemoveExpense(expenses[index]); //122
            },
            child: ExpenseItem(expenses[index]),
          ),
    );
  }
}
