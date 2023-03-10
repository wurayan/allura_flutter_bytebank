import 'package:alura_curso_webapi_bytebank/components/centered_message.dart';
import 'package:alura_curso_webapi_bytebank/http/webclients/transaction_webclient.dart';
import 'package:flutter/material.dart';

import '../components/circular_progress.dart';
import '../models/transactions.dart';

class TransactionsList extends StatefulWidget {
  const TransactionsList({super.key});

  @override
  State<TransactionsList> createState() => _TransactionsListState();
}

class _TransactionsListState extends State<TransactionsList> {
  final TransactionWebClient _webClient = TransactionWebClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Transactions'),
        ),
        body: FutureBuilder<List<Transaction>>(
          future: _webClient.findAllTransactions(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                break;
              case ConnectionState.waiting:
                return const CircularProgress();
              case ConnectionState.active:
                break;
              case ConnectionState.done:
              //substituir esse if nestado por um OR
                if (snapshot.hasData) {
                  final List<Transaction> transactionList =
                      snapshot.data as List<Transaction>;
                  if (transactionList.isNotEmpty) {
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        final Transaction transaction = transactionList[index];
                        return Card(
                          child: ListTile(
                            leading: const Icon(Icons.monetization_on),
                            title: Text(
                              transaction.value.toString(),
                              style: const TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              transaction.contact.accountNumber.toString(),
                              style: const TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: transactionList.length,
                    );
                  }
                  return const CenteredMessage(
                    "Não foram encontradas transações",
                    icon: Icons.warning,
                  );
                }
                return const CenteredMessage(
                  "Não foram encontradas transações",
                  icon: Icons.warning,
                );
            }
            return const CenteredMessage("Algo deu errado!");
          },
        ));
  }
}
