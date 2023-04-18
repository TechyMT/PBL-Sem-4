import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:printez/controller.dart';
import 'package:printez/firebase_options.dart';
import 'package:printez/landingpage.dart';
import 'package:printez/new.dart';
import 'package:printez/profilepage.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'loginview.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

String? finalEmail;
String? finalrollno;

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Profile prof = Get.put(Profile());
  var auth = FirebaseAuth.instance;

  // Future<bool> checkifLogin() async {
  //   var completer = Completer<bool>();
  //   auth.authStateChanges().listen((User? user) {
  //     if (user != null && mounted) {
  //       completer.complete(true);
  //     } else {
  //       completer.complete(false);
  //     }
  //   });
  //   return completer.future;
  // }
  Future getValidationData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obtainedEmail = sharedPreferences.getString('email');
    var obtainedrollno = sharedPreferences.getString('rollno');
    setState(() {
      finalEmail = obtainedEmail;
      finalrollno = obtainedrollno;
    });
    print(finalEmail);
    print(finalrollno);
  }

  @override
  void initState() {
    getValidationData().whenComplete(() async {
      if (finalEmail == null) {
        Get.offAll(() => LandingPage());
      } else {
        Get.offAll(() => MyWidget());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else {
          //       var isLogin = snapshot.data ?? false;
          return GetMaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const LoginView(),
          );
        }
      },
    );
  }
}
