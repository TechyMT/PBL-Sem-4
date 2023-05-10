import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import 'package:printez/homescreen.dart';
import 'package:printez/profilepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
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
        title: const Text('Register View'),
        centerTitle: true,
        foregroundColor: Colors.black,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: FutureBuilder(
        builder: (context, snapshot) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Register'),
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
                    cursorHeight: 30,
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
                      final email = _email.text;
                      final password = _password.text;
                      try {
                        final SharedPreferences sharedPreferences =
                            await SharedPreferences.getInstance();
                        sharedPreferences.setString('email', _email.text);
                        final userCredential = await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                          email: email,
                          password: password,
                        );

                        Get.offAll(() => ProfilePage());
                        Get.snackbar('Registeration Done', '');
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          Get.snackbar('No user found', "Error Code ${e.code}");
                        } else {
                          print(e.message);
                        }
                      }
                    },
                    child: const Text('Register Now!!'))
              ],
            ),
          );
        },
      ),
    );
  }
}
