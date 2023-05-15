import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:printez/firebase_options.dart';
import 'package:printez/profilepage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'controller.dart';
import 'homescreen.dart';

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
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        foregroundColor: Colors.white,
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
                Text("LOG IN", style: TextStyle(color: Colors.white,fontSize: 30)),
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
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.purple,
                      hintText: 'Enter Your Email',
                      hintStyle: TextStyle(color: Colors.grey.shade800),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30.0),
                        )
                      ),
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
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.purple,
                      hintText: 'Enter Your Password',
                      hintStyle: TextStyle(color: Colors.grey.shade800),

                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30.0),
                          ),
                      ),

                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  color: Colors.orange,
                  height: 50,
                  width: 250,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                    ),
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
                        Get.offAll(() => (HomeScreenView()));
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          Get.snackbar('User not found', e.code);
                        } else {
                          print(e.message);
                        }
                      }
                    },
                    child: const Text('LOG IN',style:TextStyle(fontSize: 20.0,)),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
