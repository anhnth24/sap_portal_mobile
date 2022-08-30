import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sap_portal/firebase_options.dart';

import '../navbar.dart';
import '../utils/toastdialog.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
        backgroundColor: Colors.green,
        title: const Text("Regist new user"),
      ),
      drawer: const NavBar(),
      body: FutureBuilder(
          future: Firebase.initializeApp(
              options: DefaultFirebaseOptions.currentPlatform),
          builder: (context, snapshot) {
            return Column(
              children: [
                TextField(
                  controller: _email,
                  enableSuggestions: false,
                  autocorrect: false,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      hintText: "Email", contentPadding: EdgeInsets.all(20)),
                ),
                TextField(
                  controller: _password,
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: const InputDecoration(
                      hintText: "Password", contentPadding: EdgeInsets.all(20)),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final email = _email.text;
                    final password = _password.text;
                    try {
                      FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: email, password: password)
                          .then(
                            (success) =>
                                notification_success('Create successfully'),

                            // Toast.show(
                            // "Create user successfully !",
                            // duration: 2,
                            // backgroundColor: Colors.green,
                            // textStyle: const TextStyle(color: Colors.white))
                          );
                    } on FirebaseAuthException catch (e) {
                      if (kDebugMode) {
                        print(e.code);
                      }
                      if (e.code == 'weak-password') {
                        notification_success(
                            'week password, atleast 6 characters');
                      } else if (e.code == 'email-already-in-use') {
                        notification_success('email already exists');
                      } else if (e.code == 'firebase/invalid-email') {
                        notification_success('invalid email');
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      textStyle: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                  child: const Text("Register"),
                ),
              ],
            );
          }),
    );
  }
}
