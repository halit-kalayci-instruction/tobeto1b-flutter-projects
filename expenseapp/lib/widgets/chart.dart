import 'package:expenseapp/models/expense.dart';
import 'package:expenseapp/widgets/chart_bar.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  const Chart({Key? key, required this.allExpenses}) : super(key: key);
  final List<Expense> allExpenses;

  List<CategoryExpenses> get categoryExpenses {
    return [
      CategoryExpenses(
          category: Category.dress,
          expenses: allExpenses
              .where((element) => element.category == Category.dress)
              .toList()),
      CategoryExpenses(
          category: Category.food,
          expenses: allExpenses
              .where((element) => element.category == Category.food)
              .toList()),
      CategoryExpenses(
          category: Category.work,
          expenses: allExpenses
              .where((element) => element.category == Category.work)
              .toList()),
      CategoryExpenses(
          category: Category.travel,
          expenses: allExpenses
              .where((element) => element.category == Category.travel)
              .toList()),
    ];
  }

  double get maxTotal {
    double maxTotal = 0;

    categoryExpenses.forEach((element) {
      if (element.totalCategoryPrice > maxTotal)
        maxTotal = element.totalCategoryPrice;
    });

    return maxTotal;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Theme.of(context).colorScheme.primary.withOpacity(0.4),
        Theme.of(context).colorScheme.primary.withOpacity(0)
      ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
      child: Column(children: [
        Expanded(
            child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: categoryExpenses
              .map((element) => ChartBar(
                    height: element.totalCategoryPrice == 0
                        ? 0
                        : element.totalCategoryPrice / maxTotal,
                  ))
              .toList(),
        )),
        const SizedBox(height: 3),
        Row(
            children: categoryExpenses
                .map((expense) =>
                    Expanded(child: Icon(categoryIcons[expense.category])))
                .toList())
      ]),
    );
  }
}
