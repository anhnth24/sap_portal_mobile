import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sap_portal/function_pages/home_page.dart';
import 'package:sap_portal/ui/build_text.dart';

import '../firebase_options.dart';
import '../utils/constants.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        // title: const Text("Welcome !!!"),
      ),
      body: FutureBuilder(
          future: Firebase.initializeApp(
              options: DefaultFirebaseOptions.currentPlatform),
          builder: (context, snapshot) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(imgFis),
                buildTextFieldSecure(_email, context, 'Email',
                    TextInputType.emailAddress, false, false, false),
                buildTextFieldSecure(_password, context, 'Password',
                    TextInputType.visiblePassword, true, false, false),
                // TextField(
                //   controller: _email,
                //   enableSuggestions: false,
                //   autocorrect: false,
                //   keyboardType: TextInputType.emailAddress,
                //   decoration: const InputDecoration(
                //       hintText: "Email", contentPadding: EdgeInsets.all(20)),
                // ),
                // TextField(
                //   controller: _password,
                //   obscureText: true,
                //   enableSuggestions: false,
                //   autocorrect: false,
                //   decoration: const InputDecoration(
                //       hintText: "Password", contentPadding: EdgeInsets.all(20)),
                // ),
                ElevatedButton(
                  onPressed: () async {
                    final email = _email.text;
                    final password = _password.text;
                    try {
                      //final cre =
                      FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: email, password: password)
                          .then((value) {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()),
                          (Route<dynamic> route) => false,
                        );
                      });

                      //print(cre);
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                      } else if (e.code == 'wrong-password') {}
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      primary: primaryColor,
                      textStyle: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w300)),
                  child: const Text("Login"),
                ),
              ],
            );
          }),
    );
  }
}
