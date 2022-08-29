import 'package:flutter/material.dart';
import 'package:sap_portal/function_pages/saleorder.dart';

import 'function_pages/purchaseorder.dart';
import 'main.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.menu),
            title: const Text('Sales Order'),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const Saleorder()),
                (Route<dynamic> route) => false,
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.menu),
            title: const Text('Purchase Order'),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const Purchaseorder()),
                (Route<dynamic> route) => false,
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.menu),
            title: const Text('Logout'),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const MyApp()),
                (Route<dynamic> route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}
