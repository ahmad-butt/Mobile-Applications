import 'package:expense_planner/models/transaction.dart';
import 'package:expense_planner/widgets/chart.dart';
import 'package:expense_planner/widgets/newTransaction.dart';
import 'package:expense_planner/widgets/transactionList.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [];

  List<Transaction> get _recentTransactions {
    return _transactions.where(
      (trs) {
        return trs.date.isAfter(
          DateTime.now().subtract(
            Duration(days: 7),
          ),
        );
      },
    ).toList();
  }

  void _addTransaction(String title, double amount, DateTime date) {
    final newTransaction = Transaction(
      DateTime.now().toString(),
      title,
      amount,
      date,
    );
    setState(
      () {
        _transactions.add(newTransaction);
      },
    );
  }

  void _removeTransaction(String ID) {
    print(ID);
    setState(
      () {
        _transactions.removeWhere((txID) => txID.id == ID);
      },
    );
  }

  void openNewTransactionModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return NewTransaction(_addTransaction);
      },
    );
  }

  bool _showChart = false;

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text('Expense Tracker'),
      actions: [
        IconButton(
          onPressed: () => openNewTransactionModal(context),
          icon: Icon(Icons.add),
        ),
      ],
    );

    var isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    var txsStyle = Container(
      height: (MediaQuery.of(context).size.height -
              MediaQuery.of(context).padding.top -
              appBar.preferredSize.height) *
          0.7,
      child: TransactionList(
        _transactions,
        _removeTransaction,
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Theme.of(context),
      home: Scaffold(
        appBar: appBar,
        body: ListView(
          children: [
            if (isLandscape)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Show Chart',
                  ),
                  Switch(
                    activeColor: Theme.of(context).colorScheme.secondary,
                    value: _showChart,
                    onChanged: (value) {
                      setState(
                        () {
                          _showChart = value;
                        },
                      );
                    },
                  ),
                ],
              ),
            if (isLandscape)
              Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _showChart
                      ? Container(
                          height: (MediaQuery.of(context).size.height -
                                  MediaQuery.of(context).padding.top -
                                  appBar.preferredSize.height) *
                              0.7,
                          child: Chart(_recentTransactions),
                        )
                      : txsStyle,
                ],
              ),
            if (!isLandscape)
              Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: (MediaQuery.of(context).size.height -
                            MediaQuery.of(context).padding.top -
                            appBar.preferredSize.height) *
                        0.3,
                    child: Chart(_recentTransactions),
                  ),
                  txsStyle,
                ],
              ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => openNewTransactionModal(context),
        ),
      ),
    );
  }
}
