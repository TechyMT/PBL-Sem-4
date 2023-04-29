import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:printez/firebase_options.dart';
import 'package:printez/profilepage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'controller.dart';
import 'new.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final DefaultDocsController ddc = Get.put(DefaultDocsController());

  final Profile prof = Get.put(Profile());
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
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        title: const Text('Login View'),
        centerTitle: true,
        foregroundColor: Colors.black,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, snapshot) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Login Karlo Fren'),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.all(8),
                  child: TextField(
                    controller: _email,
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: false,
                    autofocus: false,
                    enableSuggestions: false,
                    cursorHeight: 25,
                    decoration: const InputDecoration(
                      hintText: 'Enter Your Email',
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.all(8),
                  child: TextField(
                    controller: _password,
                    autocorrect: false,
                    enableSuggestions: false,
                    cursorHeight: 30,
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: 'Enter Your Password',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextButton(
                    onPressed: () async {
                      final SharedPreferences sharedPreferences =
                          await SharedPreferences.getInstance();
                      sharedPreferences.setString('email', _email.text);
                      final email = _email.text;
                      final password = _password.text;
                      try {
                        final userCredential = await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                          email: email,
                          password: password,
                        );
                        // var roll = prof.rollnocontroller.value.text;
                        Get.offAll(() => (MyWidget()));
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          Get.snackbar('Hehe', e.code);
                        } else {
                          print(e.message);
                        }
                      }
                    },
                    child: const Text('Login Now!!'))
              ],
            ),
          );
        },
      ),
    );
  }
}
