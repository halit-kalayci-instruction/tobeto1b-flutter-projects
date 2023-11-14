import 'dart:math';

import 'package:expenseapp/models/expense.dart';
import 'package:expenseapp/widgets/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesPage extends StatefulWidget {
  const ExpensesPage({Key? key}) : super(key: key);

  @override
  _ExpensesPageState createState() => _ExpensesPageState();
}

class _ExpensesPageState extends State<ExpensesPage> {
  List<Expense> expenses = [
    Expense(name: "Yemek", price: 500.529, date: DateTime.now()),
    Expense(name: "Udemy Kursu", price: 200, date: DateTime.now()),
  ];

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
              itemCount: expenses.length,
              itemBuilder: (context, index) {
                return ExpenseItem(expenses[index]);
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
