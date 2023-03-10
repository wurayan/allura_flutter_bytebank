import 'package:alura_curso_webapi_bytebank/http/webclients/transaction_webclient.dart';
import 'package:alura_curso_webapi_bytebank/models/contacts.dart';
import 'package:flutter/material.dart';

import '../models/transactions.dart';

class TransactionForm extends StatefulWidget {
  final Contacts contact;

  const TransactionForm(this.contact, {super.key});

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final TextEditingController _valueController = TextEditingController();
  final TransactionWebClient _webClient = TransactionWebClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New transaction'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                widget.contact.name,
                style: const TextStyle(
                  fontSize: 24.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  widget.contact.accountNumber.toString(),
                  style: const TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: TextField(
                  controller: _valueController,
                  style: const TextStyle(fontSize: 24.0),
                  decoration: const InputDecoration(labelText: 'Value'),
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    child: const Text('Transfer'), onPressed: () {
                      final double value = double.parse(_valueController.text);
                      final transactionCreated = Transaction(value, widget.contact);
                      _webClient.saveTransactions(transactionCreated);
                      //provavelmente esse método de .then(navigator.pop) é desatualizado já que é impossivel o retorno ser null
                      // .then((transaction) {if (transaction != null) {
                      //   Navigator.pop(context);
                      // }});
                      Navigator.pop(context);
                  },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
