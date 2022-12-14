import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sap_portal/firebase_options.dart';

import '../ui/build_text.dart';
import 'sidebar.dart';
import '../utils/constants.dart';
import '../utils/toast_dialog.dart';

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
        backgroundColor: primaryColor,
        title: const Text("Create user"),
      ),
      drawer: const SideBar(),
      body: FutureBuilder(
          future: Firebase.initializeApp(
              options: DefaultFirebaseOptions.currentPlatform),
          builder: (context, snapshot) {
            return Column(
              children: [
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
                      FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: email, password: password)
                          .then(
                            (success) =>
                                notificationSuccess('Create successfully'),
                          );
                    } on FirebaseAuthException catch (e) {
                      if (kDebugMode) {
                        print(e.code);
                      }
                      if (e.code == 'weak-password') {
                        notificationError(
                            'week password, atleast 6 characters');
                      } else if (e.code == 'email-already-in-use') {
                        notificationError('email already exists');
                      } else if (e.code == 'firebase/invalid-email') {
                        notificationError('invalid email');
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      textStyle: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w300)),
                  child: const Text("Register"),
                ),
              ],
            );
          }),
    );
  }
}
