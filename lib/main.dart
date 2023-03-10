import 'package:alura_curso_webapi_bytebank/Screens/contact_form.dart';
import 'package:alura_curso_webapi_bytebank/Screens/contacts_list.dart';
import 'package:alura_curso_webapi_bytebank/Screens/transaction_form.dart';
import 'package:alura_curso_webapi_bytebank/Screens/transactions_list.dart';
import 'package:alura_curso_webapi_bytebank/models/contacts.dart';
import 'package:flutter/material.dart';

import 'Screens/dashboard.dart';

void main() {
  runApp(const BytebankApp());
}

class BytebankApp extends StatelessWidget {
  const BytebankApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme:
              const ColorScheme.light(primary: Color.fromARGB(255, 27, 94, 32)),
          // primarySwatch: Colors.green,
          // colorScheme: ColorScheme.fromSwatch().copyWith(secondary: ),
          buttonTheme: ButtonThemeData(
              buttonColor: Colors.blueAccent[700],
              textTheme: ButtonTextTheme.primary)),
      initialRoute: 'dashboard',
      routes: {
        'dashboard': (context) => const Dashboard(),
        'contactList': (context) => const ContactsList(),
        'contactForm': (context) => const ContactForm(),
        'transactionList': (context) => const TransactionsList(),
      },
      onGenerateRoute: (routesettings) {
        if (routesettings.name == 'transactionForm') {
          final Contacts contact = routesettings.arguments as Contacts;
          return MaterialPageRoute(builder: (context) {
            return TransactionForm(contact);
          });
        }
        return null;
      },
    ); //MaterialApp
  }
}
