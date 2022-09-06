import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'authentication.dart';
import 'function_pages/login_page.dart';
import 'utils/constants.dart';

final auth = Authentication();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'San Francisco',
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: const Login(), //START SCREENNNNNNNNNNN
        bottomNavigationBar: BottomAppBar(
          color: const Color.fromARGB(255, 255, 255, 255),
          elevation: 0,
          child: Container(
            padding: const EdgeInsets.all(20),
            child: const Text(
              "Anhnth27 woohoo, Version 1.0.0",
              style: textDisplay,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
