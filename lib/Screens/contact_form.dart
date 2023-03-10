import 'package:alura_curso_webapi_bytebank/database/dao/contact_dao.dart';
import 'package:alura_curso_webapi_bytebank/models/contacts.dart';
import 'package:flutter/material.dart';


class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _accountNumberController =
      TextEditingController();

  final ContactDao _dao = ContactDao();

  //remover essa opção quando for implementar webapi
  //não será necesssário pois a id é irrelevante neste código
  final TextEditingController _idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Contact"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: TextField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: "full name"),
                style: const TextStyle(fontSize: 24),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: _idController,
                decoration: const InputDecoration(labelText: "insira um id"),
                style: const TextStyle(fontSize: 24),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: TextField(
                controller: _accountNumberController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: "account number"),
                style: const TextStyle(fontSize: 24),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                      onPressed: () {
                        String name = _nameController.text;
                        int accountNumber =
                            int.parse(_accountNumberController.text);
                        int idNumber = int.parse(_idController.text);
                        final Contacts newContact =
                            Contacts(idNumber, name, accountNumber);
                        _dao.save(newContact).then((boolExists) => showDialog(context: context, builder: (BuildContext context){
                          return AlertDialog(
                            title: const Text("Id já existe!"),
                            actions: [
                              TextButton( onPressed: (){
                                Navigator.of(context).pop();
                              },
                              child: const Text("Voltar"))
                            ],
                          );
                        }));
                        Navigator.pop(context, true);
                      },
                      child: const Text("Create"))),
            ),
          ],
        ),
      ),
    );
  }
}
