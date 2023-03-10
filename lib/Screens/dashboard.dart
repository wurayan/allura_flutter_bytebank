import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/bytebank_logo.png'),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: const [
                _FeatureItem(
                    name: 'Transfer',
                    icon: Icons.monetization_on, routeName: 'contactList',
                    // onClick: () {_showContactsList(context);}
                    ),
                _FeatureItem(
                  name: 'Transaction feed',
                  icon: Icons.description, routeName: 'transactionList',
                  // onClick: () {_showTransactionsList(context);},
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
  //Método verboso que cria uma função de direcionar materialpageroute, adaptei e alterei para o uso de routes
  // void _showContactsList(BuildContext context) {
  //   Navigator.of(context).push(MaterialPageRoute(
  //     builder: (context) => const ContactsList(),
  //   ));
  // }
  // void _showTransactionsList(BuildContext context) {
  //   Navigator.of(context).push(MaterialPageRoute(
  //     builder: (context) => const TransactionsList(),
  //   ));
  // }
}

class _FeatureItem extends StatelessWidget {
  const _FeatureItem({
    required this.name,
    required this.icon,
    required this.routeName
    // required this.onClick,
  });
  final String name;
  final IconData icon;
  final String routeName;
  // final Function onClick;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).colorScheme.primary,
        child: InkWell(
          onTap: () {Navigator.pushNamed(context, routeName);},
          // => onClick(),
          child: Container(
            padding: const EdgeInsets.all(8),
            height: 100,
            width: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  icon,
                  color: Colors.white,
                ),
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
