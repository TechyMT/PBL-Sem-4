// ignore_for_file: avoid_print

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:printez/controller.dart';
import 'package:printez/firebase_options.dart';
import 'package:printez/landingpage.dart';
import 'package:printez/homescreen.dart';

import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: "PBL Sem-4",
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

String? finalEmail;
String? finalrollno;

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final DefaultDocsController ddc = Get.put(DefaultDocsController());
  final StorageFilesController sfc = Get.put(StorageFilesController());
  final Profile prof = Get.put(Profile());
  final FireStoreDatabase fsd = Get.put(FireStoreDatabase());
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
  }

  @override
  void initState() {
    getValidationData().whenComplete(() async {
      if (finalrollno==null) {
        Get.offAll(() => LandingPage());
      } else {
        Get.offAll(() => HomeScreenView());
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
              fontFamily: "Arial",
            ),
            home: const LandingPage(),
          );
        }
      },
    );
  }
}
// multiple files from storage 
// cart page should be connected with local storage and default docs
// number of pages of pdf
// (optional) take print info like black n white / colour , landscape / portrait , etc
