import 'package:sqflite/sqflite.dart';

import '../../models/contacts.dart';
import '../app_database.dart';

//TODO implementar uma verificação que impeça a repetição de ids

class ContactDao {
  static const String tableSql =
      'CREATE TABLE $_tableName ($_id INTEGER PRIMARY KEY, $_name text, $_accountNumber INTEGER)';

  static const String _tableName = 'contacts';
  static const String _id = 'id';
  static const String _name = 'name';
  static const String _accountNumber = 'account_number';

  Future<dynamic> save(Contacts contact) async {
    final Database db = await createDatabase();
    Map<String, dynamic> contactMap = toMap(contact);
    return db.insert(_tableName, contactMap);

    // return createDatabase().then((db){
    //   final Map<String, dynamic> contactMap = {};
    //   contactMap['id'] = contact.id;
    //   contactMap['name'] = contact.name;
    //   contactMap['acount_number'] = contact.accountNumber;
    //   return db.insert('contact', contactMap);
    // } );
  }

  Map<String, dynamic> toMap(Contacts contact) {
    final Map<String, dynamic> contactMap = {};
    contactMap[_id] = contact.id;
    contactMap[_name] = contact.name;
    contactMap[_accountNumber] = contact.accountNumber;
    return contactMap;
  }

  Future<List<Contacts>> findAll() async {
    final Database db = await createDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    List<Contacts> contactsList = toList(result);
    return contactsList;

    // return createDatabase().then((db) {
    //   return db.query('contacts').then((maps) {
    //     final List<Contacts> contactsList = [];
    //     for (Map<String, dynamic> map in maps) {
    //       final Contacts contact =
    //           Contacts(map['id'], map['name'], map['account_id']);
    //       contactsList.add(contact);
    //     }
    //     return contactsList;
    //   });
    // });
  }

  List<Contacts> toList(List<Map<String, dynamic>> result) {
    final List<Contacts> contactsList = [];
    for (Map<String, dynamic> row in result) {
      final Contacts contact =
          Contacts(row[_id], row[_name], row[_accountNumber]);
      contactsList.add(contact);
    }
    return contactsList;
  }
}
