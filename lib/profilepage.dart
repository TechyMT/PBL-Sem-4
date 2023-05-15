// ignore_for_file: avoid_print

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:printez/controller.dart';
import 'package:printez/homescreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path/path.dart' as path;

class ProfilePage extends StatefulWidget {
  ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Future<void> createRollNoFolder() async {
    String subfolderpath = 'temp';
    String folderName = rollnocontroller.text;
    String fullPath = '$subfolderpath/$folderName/';

    // try {
    //   await FirebaseStorage.instance.ref(fullPath).putString('');
    //   print('SubFolder Created at $fullPath');
    // } catch (e) {
    //   print(e.toString());
    // }
    Reference storageRef = FirebaseStorage.instance.ref();
    String storagepath = path.join(fullPath, 'abc');
    print(storagepath);
    await storageRef
        .child(storagepath)
        .putString('', format: PutStringFormat.raw);
  }

  Future<void> deleteabsolutefile() async {
     String subfolderpath = 'temp';
    String folderName = rollnocontroller.text;
      String fullPath = '$subfolderpath/$folderName/';
    String filename = 'abc';
    String folderPath = 'temp/$folderName';
    Reference storageRef = FirebaseStorage.instance.ref();
      String storagePath = '$folderPath/$filename';
    print(storagePath);
    }

  late final namecontroller = TextEditingController();
  late final rollnocontroller = TextEditingController();
  late final emailcontroller = TextEditingController();
  late final regnocontroller = TextEditingController();
  late final classnamecontroller = TextEditingController();
  final Profile prof = Get.put(Profile());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: namecontroller,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Enter Your Name',
                  hintStyle: TextStyle(color: Colors.grey.shade800),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30.0),
                    ),
                  ),

                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: regnocontroller,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Enter Your Registration Number',
                  hintStyle: TextStyle(color: Colors.grey.shade800),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30.0),
                    ),
                  ),

                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: classnamecontroller,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Enter Your Class',
                  hintStyle: TextStyle(color: Colors.grey.shade800),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30.0),
                    ),
                  ),

                ),
              ),
            ),
            // TextField(
            //   controller: emailcontroller,
            //   keyboardType: TextInputType.name,
            //   decoration: InputDecoration(
            //     hintText: 'Enter Your Email',
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: rollnocontroller,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Enter Your Roll Number',
                  hintStyle: TextStyle(color: Colors.grey.shade800),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30.0),
                    ),
                  ),

                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                await createRollNoFolder();
                //             await deleteabsolutefile();
                // final name = namecontroller.text;
                // final rollno = rollnocontroller.text;
                // final SharedPreferences sharedPreferences =
                //     await SharedPreferences.getInstance();
                // sharedPreferences.setString('name', namecontroller.text);
                // sharedPreferences.setString('rollno', rollnocontroller.text);

                if (rollnocontroller.text.isEmpty) {
                  Get.snackbar('Enter Roll Number', '');
                } else {
                  prof.updateRollNo(rollnocontroller.text,namecontroller.text,regnocontroller.text,classnamecontroller.text,emailcontroller.text);
                  Get.offAll(() => HomeScreenView());
                }
              },
              style: TextButton.styleFrom(backgroundColor: Colors.orange) ,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: const Text('PROCEED TO HOME SCREEN', style: TextStyle(fontSize: 15.0),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
