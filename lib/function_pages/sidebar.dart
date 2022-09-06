import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sap_portal/function_pages/register_page.dart';
import 'package:sap_portal/function_pages/sale_order.dart';

import 'purchase_order.dart';
import '../main.dart';

class SideBar extends StatelessWidget {
  const SideBar({Key? key}) : super(key: key);

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: const Text("Cancel"),
      onPressed: () => Navigator.pop(context, false),
    );
    Widget continueButton = TextButton(
      child: const Text("Continue"),
      onPressed: () {
        FirebaseAuth.instance.signOut();
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const MyApp()),
          (Route<dynamic> route) => false,
        );
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("AlertDialog"),
      content: const Text(
          "Would you like to continue learning how to use Flutter alerts?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.menu),
            title: const Text('Sales Order'),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const SaleOrder()),
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
            title: const Text('Create user'),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const Register()),
                (Route<dynamic> route) => false,
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.menu),
            title: const Text('Logout'),
            // onTap: () {
            //   FirebaseAuth.instance.signOut();
            //   Navigator.pushAndRemoveUntil(
            //     context,
            //     MaterialPageRoute(builder: (context) => const MyApp()),
            //     (Route<dynamic> route) => false,
            //   );
            //   //showAlertDialog(context);
            // },
            onTap: (() => showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                      title: const Text(''),
                      content: const Text('Do you want to log out now ?'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'No'),
                          child: const Text('No'),
                        ),
                        TextButton(
                          onPressed: () {
                            FirebaseAuth.instance.signOut();
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MyApp()),
                              (Route<dynamic> route) => false,
                            );
                          },
                          child: const Text('Yes'),
                        ),
                      ],
                    ))),
          )
        ],
      ),
    );
  }
}
