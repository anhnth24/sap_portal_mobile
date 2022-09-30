import 'dart:io';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'authentication.dart';
import 'function_pages/login_page.dart';
import 'utils/constants.dart';

final auth = Authentication();

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  // ByteData data =
  //     await PlatformAssetBundle().load('assets/ca/lets-encrypt-r3.pem');
  // SecurityContext.defaultContext
  //     .setTrustedCertificatesBytes(data.buffer.asUint8List());

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
