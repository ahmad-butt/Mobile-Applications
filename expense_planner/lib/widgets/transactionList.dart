import '../models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _transactions;
  final Function _removeTransaction;

  TransactionList(this._transactions, this._removeTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _transactions.isEmpty
          ? LayoutBuilder(
              builder: (ctx, constraints) {
                return Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text('Transaction list is empty'),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: constraints.maxHeight * 0.7,
                      child: Image.asset(
                        './assets/images/waiting.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                );
              },
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  elevation: 5,
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 15,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 15,
                          ),
                          child: Text(
                            'Rs ${_transactions[index].amount}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.purple,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _transactions[index].title,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              DateFormat.yMMMEd().format(
                                _transactions[index].date,
                              ),
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () => _removeTransaction(
                            _transactions[index].id,
                          ),
                          icon: Icon(Icons.delete),
                          color: Colors.red,
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: _transactions.length,
            ),
    );
  }
}
