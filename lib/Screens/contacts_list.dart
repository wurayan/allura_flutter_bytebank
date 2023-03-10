import 'package:alura_curso_webapi_bytebank/database/dao/contact_dao.dart';
import 'package:alura_curso_webapi_bytebank/models/contacts.dart';
import 'package:flutter/material.dart';

import 'contact_form.dart';

class ContactsList extends StatefulWidget {
  const ContactsList({super.key});

  @override
  State<ContactsList> createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
  final ContactDao _dao = ContactDao();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
      ),
      body: FutureBuilder<List<Contacts>>(
          //initialdata retornna um valor default enquanto carrega o future
          initialData: const [],
          future: _dao.findAll(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                break;
              case ConnectionState.waiting:
                return const CircularProgressIndicator();
              case ConnectionState.active:
                break;
              case ConnectionState.done:
                final List<Contacts> contactsList =
                    snapshot.data as List<Contacts>;
                return ListView.builder(
                  itemBuilder: (context, int index) {
                    final Contacts contact = contactsList[index];
                    return _ContactItem(contact: contact);
                  },
                  itemCount: contactsList.length,
                );
            }
            return const Text("Algo deu errado!");
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const ContactForm())).then((value) => setState((){}));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  final Contacts contact;

  const _ContactItem({
    required this.contact,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          contact.name,
          style: const TextStyle(fontSize: 24),
        ),
        subtitle: Text(contact.accountNumber.toString(),
            style: const TextStyle(fontSize: 16)),
      ),
    );
  }
}
