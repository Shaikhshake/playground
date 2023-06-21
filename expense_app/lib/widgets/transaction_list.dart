// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList(this.transactions);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,

      /// THE RECOMMENDED LISTVIEW.BUILDER METHOD DOESN'T WORK!!!!!!
      /// this is error generated
      /// lib/widgets/transaction_list.dart:16:42: Error: A value of type 'Set<Card>' can't be returned from a
      // function with return type 'Widget?'.
      //  - 'Set' is from 'dart:core'.
      //  - 'Card' is from 'package:flutter/src/material/card.dart'
      //  ('../../flutter/packages/flutter/lib/src/material/card.dart').
      //  - 'Widget' is from 'package:flutter/src/widgets/framework.dart'
      //  ('../../flutter/packages/flutter/lib/src/widgets/framework.dart').
      //         itemBuilder: (context, index) => {
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                    "No Transactions Added Yet!",
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)
                    ),
                Image.asset('assets/images/rabbit.jpeg'),
              ],
            )
          : ListView(
              children: transactions.map((tx) {
                return Card(
                    child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                      // decoration: BoxDecoration(
                      //     border: Border.all(color: Theme.of(context).primaryColor, width: 2)),
                      padding: EdgeInsets.all(8.6),
                      child: Text(
                        "${tx.amount.toStringAsFixed(2)}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Color.fromARGB(255, 74, 58, 71)),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                          // padding: EdgeInsets.all(10),
                          // decoration: BoxDecoration(border: Border.all(color: Colors.black)),

                          child: Text(
                            tx.title,
                            style: TextStyle(
                                color: Color.fromARGB(255, 112, 164, 232),
                                fontSize: 18.4,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Container(
                          // decoration: BoxDecoration(border: Border.all(color: Colors.red)),
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            DateFormat.yMMMd().format(tx.date),
                            style: const TextStyle(
                                color: Color.fromARGB(255, 120, 157, 186),
                                fontSize: 9,
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    )
                  ],
                ));
              }).toList(),
            ),
    );
  }
}
