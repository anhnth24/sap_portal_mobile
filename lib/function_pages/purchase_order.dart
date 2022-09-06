// ignore_for_file: library_private_types_in_public_api, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:sap_portal/function_pages/sidebar.dart';

import '../utils/constants.dart';

class Purchaseorder extends StatefulWidget {
  const Purchaseorder({Key? key}) : super(key: key);

  @override
  _PurchaseorderState createState() => _PurchaseorderState();
}

class _PurchaseorderState extends State<Purchaseorder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Purchase order"),
          backgroundColor: primaryColor,
        ),
        drawer: const SideBar(),
        resizeToAvoidBottomInset: true,
        backgroundColor: backgroundColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Container(
                  height: 400,
                  width: 200,
                  padding: const EdgeInsets.all(20),
                  alignment: Alignment.center,
                  child: const Text(
                    "Purchase order page ...!",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.red, fontSize: 25),
                  )),
            )
            // Container(
            //   child: CustomButton(
            //     buttonText: 'PO back to homepage',
            //     onPress: () => {
            //       Navigator.pushAndRemoveUntil(
            //         context,
            //         MaterialPageRoute(builder: (context) => const HomePage()),
            //         (Route<dynamic> route) => false,
            //       ),
            //     },
            //   ),
            // )
          ],
        ));
  }
}
