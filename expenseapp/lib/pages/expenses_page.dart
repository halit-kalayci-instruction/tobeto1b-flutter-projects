import 'dart:math';

import 'package:expenseapp/models/expense.dart';
import 'package:expenseapp/widgets/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesPage extends StatefulWidget {
  const ExpensesPage(this.expenses, this.onRemove, {Key? key})
      : super(key: key);
  final List<Expense> expenses;
  final void Function(Expense expense) onRemove;

  @override
  _ExpensesPageState createState() => _ExpensesPageState();
}

class _ExpensesPageState extends State<ExpensesPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const SizedBox(
          height: 150,
          child: Text("Grafik Bölümü"),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: widget.expenses.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: ValueKey(widget.expenses[index]),
                  child: ExpenseItem(widget.expenses[index]),
                  onDismissed: (direction) {
                    // if (direction == DismissDirection.startToEnd) {
                    //   // eğer soldan sağa kaydırılmışsa..
                    // }
                    //print(direction);
                    widget.onRemove(widget.expenses[index]);
                  },
                );
              }),
        ),
        const SizedBox(
          height: 150,
          child: Text("Burası bottom bar."),
        )
      ]),
    );
  }
}

// listeden veri silme ve alt başlıkları
// theming ve alt başlıkları