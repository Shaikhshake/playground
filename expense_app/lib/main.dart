// ignore_for_file: prefer_const_constructors
import '../widgets/new_transaction.dart';

import 'package:flutter/material.dart';
import "./models/transaction.dart";
import './widgets/transaction_list.dart';
import './widgets/chart.dart';

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

  void _addNewTransaction(
      String txTitle, double txAmount, DateTime chosenDate) {
    if (txTitle.isEmpty || txAmount.isNaN || txAmount.isNegative) {
      print("THATS ILLEGAL, CHECK USER_TRANSACTION.DART\n\n\n\n");
      return;
    }
    final newTx =
        Transaction(DateTime.now().toString(), txTitle, txAmount, chosenDate);

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

  void _deleteTransactions(String id) {
    setState(() {
      transactions.removeWhere((tx) => tx.id == id);
    });
  }

  List<Transaction> get _recentTransactions {
    return transactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text("Expense Report"),
      actions: [
        IconButton(
            onPressed: () => _startAddingNewTransaction(context),
            icon: Icon(Icons.add))
      ],
    );
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                height: (MediaQuery.of(context).size.height -
                    appBar.preferredSize.height - MediaQuery.of(context).padding.top)* 0.25,
                child: Chart(transactions)),
            Container(
              height: (MediaQuery.of(context).size.height -
                    appBar.preferredSize.height -MediaQuery.of(context).padding.top)* 0.75,
              child: TransactionList(transactions,
                  _deleteTransactions),
            ), // for Input and Display parts
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddingNewTransaction(context),
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
