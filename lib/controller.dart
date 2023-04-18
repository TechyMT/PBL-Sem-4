import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends GetxController {
  var namecontroller = TextEditingController().obs;
  var rollnocontroller = TextEditingController().obs;
  RxString rollno = RxString('');
  void updateRollNo(String newVal) async {
    rollno.value = newVal;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('rollno', newVal);
  }

  Future<void> loadRollno() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? savedrollno = sharedPreferences.getString('rollno');
    if (savedrollno != null) {
      rollno.value = savedrollno;
    }
  }
}

class MainAttributes extends GetxController {
  Rx<String> finalrollno = ''.obs;
  Rx<String> finalEmail = ''.obs;
}
