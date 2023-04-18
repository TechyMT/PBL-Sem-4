import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:printez/controller.dart';
import 'package:printez/new.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final Profile prof = Get.put(Profile());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: prof.namecontroller.value,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  hintText: 'Enter Your Name',
                ),
              ),
              TextField(
                controller: prof.rollnocontroller.value,
                keyboardType: TextInputType.name,
                // validator: (val) {
                //   if (val!.isEmpty) {
                //     return 'Roll No is Required';
                //   } else {
                //     return null;
                //   }
                // },
                decoration: InputDecoration(
                  hintText: 'Enter Your Roll No.',
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  final name = prof.namecontroller.value.text;
                  final rollno = prof.rollnocontroller.value.text;
                  final SharedPreferences sharedPreferences =
                      await SharedPreferences.getInstance();
                  sharedPreferences.setString(
                      'name', prof.namecontroller.value.text);
                  sharedPreferences.setString(
                      'rollno', prof.rollnocontroller.value.text);
                  print(name + " " + rollno);
                  if (rollno.isEmpty) {
                    Get.snackbar('Roll no Tak', 'Read above message');
                  } else {
                    Get.offAll(() => MyWidget());
                  }
                },
                child: Text('To the Home Screen'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
