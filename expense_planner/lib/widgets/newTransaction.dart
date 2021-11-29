import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTrasaction;

  NewTransaction(this.addTrasaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime transactionDate = DateTime.now();

  void _selectDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime.now(),
    ).then(
      (date) {
        if (date == null) {
          return;
        }
        setState(
          () {
            transactionDate = date;
          },
        );
      },
    );
  }

  void _submitTransaction() {
    if (titleController.text.isEmpty ||
        double.parse(amountController.text) <= 0) {
      return;
    } else {
      final newTitle = titleController.text;
      final newAmount = double.parse(amountController.text);
      widget.addTrasaction(newTitle, newAmount, transactionDate);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Title',
                ),
                controller: titleController,
                onSubmitted: (_) => _submitTransaction(),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Amount',
                ),
                controller: amountController,
                onSubmitted: (_) => _submitTransaction(),
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      '${DateFormat.yMMMMEEEEd().format(transactionDate)}',
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _selectDate,
                    child: Text(
                      'Select Date',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: ElevatedButton(
                  onPressed: _submitTransaction,
                  child: Text(
                    'Add Transaction',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
