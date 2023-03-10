import 'package:sqflite/sqflite.dart';
import 'dao/contact_dao.dart';

Future<Database> createDatabase() async {
  final String dbPath = await getDatabasesPath();
  final String path = "$dbPath/bytebank.db";
  return openDatabase(path, onCreate: (db, version) {
    db.execute(ContactDao.tableSql);
  }, version: 1, onDowngrade: onDatabaseDowngradeDelete);
  //método usando .then
  // return getDatabasesPath().then((dbPath) {
  //   final String path = p.join(dbPath, 'bytebank.db');
  //   return openDatabase(path, onCreate: (db, version) {
  //     db.execute(
  //         'CREATE TABLE contacts (id INTEGER PRIMARY KEY, name text, account_number INTEGER)');
  //   }, version: 1,
  //   onDowngrade: onDatabaseDowngradeDelete);
  // });
}

//TODO: criar uma função tomap para remover essa operação de dentro do save?