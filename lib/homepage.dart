// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'navbar.dart';

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
          backgroundColor: Colors.green,
        ),
        resizeToAvoidBottomInset: true,
        backgroundColor: const Color.fromRGBO(40, 38, 56, 1),
        drawer: const NavBar(),
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
                    "Successfull login!",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  )),
            ),
            Container(
              height: 100,
              width: 570,
              padding: const EdgeInsets.all(20),
            )
          ],
        ));
  }
}
