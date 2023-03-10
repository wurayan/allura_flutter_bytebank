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
            colorScheme: const ColorScheme.light(
                primary: Color.fromARGB(255, 27, 94, 32)),
            // primarySwatch: Colors.green,
            // colorScheme: ColorScheme.fromSwatch().copyWith(secondary: ),
            buttonTheme: ButtonThemeData(
                buttonColor: Colors.blueAccent[700],
                textTheme: ButtonTextTheme.primary)),
        home: const Dashboard()
        //const ContactsList()
        // const ContactForm()
        ); //MaterialApp
  }
}
