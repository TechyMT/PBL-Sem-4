import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profile extends GetxController {
  var namecontroller = TextEditingController().obs;
  var rollnocontroller = TextEditingController().obs;
  
}

class MainAttributes extends GetxController {
  Rx<String> finalrollno = ''.obs;
  Rx<String> finalEmail = ''.obs;
}
