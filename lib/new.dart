import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:printez/defaultdocs.dart';
import 'package:printez/landingpage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:printez/controller.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

String? mail;
String? roll;

class MyWidget extends StatefulWidget {
  final Profile prof = Get.put(Profile());
  MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  Future getData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obtainedmail = sharedPreferences.getString('email');
    var obtainedroll = sharedPreferences.getString('rollno');
    print(obtainedroll);
    print(obtainedmail);
    setState(() {
      roll = obtainedroll;
    });
    print(mail);
    print(roll);
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('Log out'),
              onPressed: () async {
                try {
                  final SharedPreferences sharedPreferences =
                      await SharedPreferences.getInstance();
                  final userCredential = await FirebaseAuth.instance.signOut();
                  sharedPreferences.clear();
                  Get.off(() => LandingPage());
                } catch (e) {
                  print(e.toString());
                }
              },
            ),
            Text('Hi'),
            ElevatedButton(
                onPressed: () {
                  Get.to(() => DefaultDocs());
                },
                child: Text('Click'))
          ],
        ),
      ),
    );
  }
}
