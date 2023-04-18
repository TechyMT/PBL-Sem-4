// ignore_for_file: avoid_print

import 'dart:io';

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
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';

String? mail;
String? roll;

class MyWidget extends StatefulWidget {
  MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final Profile prof = Get.put(Profile());
  PlatformFile? pickedfile;
  UploadTask? uploadTask;
  Future selectfile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) {
      return;
    }
    setState(() {
      pickedfile = result.files.first;
    });
    print(pickedfile!.name);
  }

  Future uploadfile() async {
    final path = 'temp/${prof.rollno.value.toString()}/${pickedfile!.name}';
    final file = File(pickedfile!.path!);
    final ref = FirebaseStorage.instance.ref().child(path);
    uploadTask = ref.putFile(file);
    final snapshot = await uploadTask!.whenComplete(() => {});
    final url = await snapshot.ref.getDownloadURL();
    print(url);
  }

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
                  selectfile();
                },
                child: Text('Select File'),
              ),
              ElevatedButton(
                onPressed: () {
                  uploadfile();
                },
                child: Text('Upload File'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
