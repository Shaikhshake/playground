// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTx;
  NewTransaction(this.addNewTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2023),
            lastDate: DateTime.now())
        .then((value) => {
              if (value != null)
                {
                  setState(() {
                    _selectedDate = value;
                  })
                }
            });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            decoration: InputDecoration(labelText: "Title"),
            controller: titleController,
            // i don't wanna add onSubmit option for user.
          ),
          TextField(
            decoration: InputDecoration(labelText: "Amount"),
            controller: amountController,
            keyboardType: TextInputType.number,
          ),
          Container(
            //height: 70,
            //padding: EdgeInsets.only(left: 7),
            child: Row(children: [
              Text(_selectedDate == null
                  ? "No Date Chosen!"
                  : DateFormat.yMd().format(_selectedDate)),
              SizedBox(width: 207,),
              TextButton(
                  onPressed: _presentDatePicker,
                  child: Text(
                    "Chose Date",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  )),
            ]),
          ),
          ElevatedButton(
            onPressed: () {
              //special widget, to access properties of
              /// above class
              widget.addNewTx(
                  titleController.text, double.parse(amountController.text), _selectedDate);
              Navigator.of(context).pop();
            },
            child: Text(
              "Add Transaction",
              style: TextStyle(color: const Color.fromARGB(255, 63, 52, 52)),
            ),
          ),
        ],
      ),
    ));
  }
}
