// ignore_for_file: prefer_const_constructors
import '../widgets/new_transaction.dart';

import 'package:flutter/material.dart';
import "./models/transaction.dart";
import './widgets/transaction_list.dart';

void main() {
  runApp(
    MaterialApp(
        home: ExpenseApp(),
        title: "Expense Report",
        theme: ThemeData(
          primarySwatch: Colors.amber,
          primaryIconTheme: IconThemeData(color: Colors.purple),
          
        ),
        ),
  );
  //runApp(ExpenseApp());
}

class ExpenseApp extends StatefulWidget {
  @override
  State<ExpenseApp> createState() => _ExpenseAppState();
}

class _ExpenseAppState extends State<ExpenseApp> {
  final List<Transaction> transactions = [
    // Transaction("t1", "Futbol", 999.9, DateTime.now()),
    // Transaction("t2", "Handbol", 899.9, DateTime.now()),
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    if (txTitle.isEmpty || txAmount.isNaN || txAmount.isNegative) {
      print("THATS ILLEGAL, CHECK USER_TRANSACTION.DART\n\n\n\n");
      return;
    }
    final newTx = Transaction(
        DateTime.now().toString(), txTitle, txAmount, DateTime.now());

    setState(() {
      transactions.add(newTx);
    });
  }

  void _startAddingNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (ctx) {
          return NewTransaction(_addNewTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense Report"),
        actions: [
          IconButton(
              onPressed: () => _startAddingNewTransaction(context),
              icon: Icon(Icons.add))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              //For card
              width: double.infinity,
              child: Container(
                margin: EdgeInsets.only(top: 5),
                child: Card(
                  color: Theme.of(context).primaryColor,
                  elevation: 10,
                  child: Text("Card Placeholder"),
                ),
              )),
          TransactionList(transactions), // for Input and Display parts
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddingNewTransaction(context),
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      
    );
  }
}
