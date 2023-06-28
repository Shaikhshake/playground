// ignore_for_file: prefer_const_constructors
import 'dart:io';

import 'package:flutter/services.dart';

import '../widgets/new_transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "./models/transaction.dart";
import './widgets/transaction_list.dart';
import './widgets/chart.dart';

void main() {
  //below code forces app to only have portrait mode
  // WidgetsFlutterBinding.ensureInitialized(); //initializes something
  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
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

  bool _showChart = false;
  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.orientationOf(context) == Orientation.landscape;

    final PreferredSizeWidget appBar = Platform.isIOS
        ? CupertinoNavigationBar(
            middle: Text("Expense Report"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  child: Icon(Icons.add),
                  onTap: () => _startAddingNewTransaction(context),
                )
              ],
            ),
          )
        : AppBar(
            title: Text("Expense Report"),
            actions: [
              IconButton(
                  onPressed: () => _startAddingNewTransaction(context),
                  icon: Icon(Icons.add))
            ],
          ) as PreferredSizeWidget;
    final pageBody = SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (isLandscape)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Show Chart"),
                  Switch.adaptive(
                      activeColor: Colors.amber,//Theme.of(context).primaryColor,
                      value: _showChart,
                      onChanged: (val) {
                        setState(() {
                          _showChart = val;
                        });
                      })
                ],
              ),
            if (!isLandscape)
              Container(
                  height: (MediaQuery.of(context).size.height -
                          appBar.preferredSize.height -
                          MediaQuery.of(context).padding.top) *
                      0.3,
                  child: Chart(transactions)),
            if (!isLandscape)
              Container(
                height: (MediaQuery.of(context).size.height -
                        appBar.preferredSize.height -
                        MediaQuery.of(context).padding.top) *
                    0.7,
                child: TransactionList(transactions, _deleteTransactions),
              ),
            if (isLandscape)
              _showChart
                  ? Container(
                      height: (MediaQuery.of(context).size.height -
                              appBar.preferredSize.height -
                              MediaQuery.of(context).padding.top) *
                          0.7,
                      child: Chart(transactions))
                  : Container(
                      height: (MediaQuery.of(context).size.height -
                              appBar.preferredSize.height -
                              MediaQuery.of(context).padding.top) *
                          0.75,
                      child: TransactionList(transactions, _deleteTransactions),
                    ), // for Input and Display parts
          ],
        ),
      ),
    );
    return Platform.isIOS
        ? CupertinoPageScaffold(
            navigationBar: appBar as ObstructingPreferredSizeWidget,
            child: pageBody,
          )
        : Scaffold(
            appBar: appBar,
            body: pageBody,
            floatingActionButton: Platform.isIOS
                ? Container()
                : FloatingActionButton(
                    onPressed: () => _startAddingNewTransaction(context),
                    child: Icon(Icons.add),
                  ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
  }
}
