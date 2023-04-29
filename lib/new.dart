// ignore_for_file: avoid_print

import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:printez/cartpage.dart';
import 'package:printez/defaultdocs.dart';
import 'package:printez/landingpage.dart';
import 'package:printez/storagedocs.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:printez/controller.dart';

String? mail;
String? roll;

class MyWidget extends StatefulWidget {
  MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final Profile prof = Get.put(Profile());
  final DefaultDocsController ddc = Get.find();
  final StorageFilesController sfc = Get.find();
  Future getData() async {
    // final SharedPreferences sharedPreferences =
    //     await SharedPreferences.getInstance();
    // var obtainedmail = sharedPreferences.getString('email');
    // var obtainedroll = sharedPreferences.getString('rollno');
    // setState(() {
    //   roll = obtainedroll;
    // });
    // print(mail);
    // print(roll);
    prof.loadRollno();
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: const Text('Log out'),
                onPressed: () async {
                  try {
                    final SharedPreferences sharedPreferences =
                        await SharedPreferences.getInstance();
                    final userCredential =
                        await FirebaseAuth.instance.signOut();
                    sharedPreferences.clear();
                    Get.off(() => const LandingPage());
                  } catch (e) {
                    print(e.toString());
                  }
                },
              ),
              Text(prof.rollno.value.toString()),
              ElevatedButton(
                onPressed: () {
                  Get.to(() => const DefaultDocs());
                },
                child: const Text('Click'),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.to(() => StorageDocs());
                },
                child: Text('Storage Docs'),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.to(() => CartPage());
                },
                child: const Text('Cart Page'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
