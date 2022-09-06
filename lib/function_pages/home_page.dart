// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:sap_portal/utils/constants.dart';
import 'sidebar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Welcome"),
          backgroundColor: primaryColor,
        ),
        resizeToAvoidBottomInset: true,
        backgroundColor: backgroundColor,
        drawer: const SideBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Container(
                  //height: 90 / 100,
                  // width: 200,
                  padding: const EdgeInsets.all(20),
                  child: const Text(
                    "Successfull login!",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  )),
            ),
            // Container(
            //   height: 100,
            //   width: 570,
            //   padding: const EdgeInsets.all(20),
            // )
          ],
        ));
  }
}
