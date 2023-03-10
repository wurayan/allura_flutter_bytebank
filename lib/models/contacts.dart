class Contacts {
  final int id;
  final String name;
  final int accountNumber;

  Contacts(
    this.id,
    this.name,
    this.accountNumber
  );

  @override
  String toString() {
    return "Contact{id: $id, name: $name, account: $accountNumber}";
  }

  Contacts.fromJson(Map<String,dynamic>json) :
    id = 0,
    name = json['name'],
    accountNumber = json['accountNumber'];

  Map<String,dynamic> toJson() => {
    'id': id,
    'name': name,
    'accountNumber': accountNumber
  };

}