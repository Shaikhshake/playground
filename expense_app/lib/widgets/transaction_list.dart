// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;
  TransactionList(this.transactions, this.deleteTransaction);
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: (MediaQuery.of(context).size.height * 0.6),
      child: transactions.isEmpty
          ? Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset('assets/images/empty_folder.png'),
                Text("No Transactions Added Yet!",
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                
              ],
            )
          : ListView(
              children: transactions.map((tx) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                  elevation: 5,
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: FittedBox(
                            child: Text(
                          '₹${tx.amount}',
                        )),
                      ),
                    ),
                    title: Text(
                      tx.title,
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ),
                    subtitle: Text(DateFormat.yMMMd().format(tx.date)),
                    trailing: IconButton(
                      onPressed: () {
                        deleteTransaction(tx.id);
                      },
                      icon: Icon(Icons.delete),
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                );
              }).toList(),
            ),
    );
  }
}
