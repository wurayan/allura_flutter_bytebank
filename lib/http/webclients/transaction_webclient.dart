import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../../models/transactions.dart';
import '../webclient.dart';

class TransactionWebClient {
  Future<List<Transaction>> findAllTransactions() async {
    http.Response response = await client
        .get(Uri.parse(baseUrl))
        .timeout(const Duration(seconds: 10));
    List<dynamic> decodedJson = jsonDecode(response.body);
    return decodedJson
        .map((dynamic json) => Transaction.fromJson(json))
        .toList();
  }

  Future<Transaction> saveTransactions(Transaction transaction) async {
    final String transactionJson = jsonEncode(transaction.toJson());
    http.Response response = await client.post(Uri.parse(baseUrl),
        headers: {'Content-type': 'application/json', 'password': '1000'},
        body: transactionJson);
    if (response.statusCode != 200){
      throw HttpException(response.body);
    }
    return Transaction.fromJson(jsonDecode(response.body));
  }

// List<Transaction> _toTransactionList(http.Response response) {
//     final List<dynamic> decodedJson = jsonDecode(response.body);
//     final List<Transaction> transactionList = [];
//     //for (Map<String, dynamic> element in decodedJson) {
//       transactionList.add(Transaction.fromJson(element));
//     }//
//     return decodedJson.map((dynamic json) => Transaction.fromJson(json) ).toList();
// com a siplificação do for em uma linha de .map, podemo enviar a função inteira para o bloco que foi chamada ionvés de criar uma nova função para executar a conversão
//   }
}
