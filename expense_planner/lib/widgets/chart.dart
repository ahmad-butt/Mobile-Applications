import 'package:expense_planner/models/transaction.dart';
import 'package:expense_planner/widgets/chartBar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;
  Chart(this.recentTransactions);

  List<Map<String, Object>> get getChartData {
    return List.generate(
      7,
      (index) {
        final weekDay = DateTime.now().subtract(
          Duration(days: index),
        );
        var totalSum = 0.0;
        for (var i = 0; i < recentTransactions.length; i++) {
          if (recentTransactions[i].date.day == weekDay.day &&
              recentTransactions[i].date.month == weekDay.month &&
              recentTransactions[i].date.year == weekDay.year) {
            totalSum += recentTransactions[i].amount;
          }
        }
        return {
          'day': DateFormat.E().format(weekDay).substring(0, 1),
          'amount': totalSum,
        };
      },
    ).reversed.toList();
  }

  double get totalSpending {
    return getChartData.fold(0.0, (sum, item) {
      return sum + (item['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(20),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: getChartData.map(
            (data) {
              return ChartBar(
                (data['day'] as String),
                (data['amount'] as double),
                totalSpending != 0
                    ? (data['amount'] as double) / totalSpending
                    : 0,
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}