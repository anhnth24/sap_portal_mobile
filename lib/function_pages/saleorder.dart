// ignore_for_file: library_private_types_in_public_api, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:sap_portal/navbar.dart';

class Saleorder extends StatefulWidget {
  const Saleorder({Key? key}) : super(key: key);

  @override
  _SaleorderState createState() => _SaleorderState();
}

class _SaleorderState extends State<Saleorder> {
  TextEditingController customerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Sale order"),
          backgroundColor: Colors.green,
        ),
        drawer: const NavBar(),
        resizeToAvoidBottomInset: true,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              onTap: () {},
              controller: customerController, // Controller for Username
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "customer",
                  contentPadding: EdgeInsets.all(20)),
              onEditingComplete: () => FocusScope.of(context).nextFocus(),
            ),
            const Divider(
              thickness: 3,
            ),
          ],
        ));
  }
}
