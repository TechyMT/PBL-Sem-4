import 'package:file_picker/file_picker.dart';
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

class DefaultDocsController extends GetxController {
  var defaultDocsList = <String>[].obs;
  var cartdocs = <String>[].obs;
  var cartlinks = <String>[].obs;
  void addUsingUrls(List<String> urls) {
    defaultDocsList.addAll(urls);
  }

  void addtoCart(String url, String link) {
    cartdocs.add(url);
    cartlinks.add(link);
    Get.snackbar('$url docs Added to the Cart', 'Same Thing');
  }

  void removefromCart(String url, String link) {
    cartdocs.remove(url);
    cartlinks.remove(link);
    Get.snackbar('$url docsRemoved from the Cart', 'Same thing');
  }

  bool isAddedtoCart(String url) {
    return cartdocs.contains(url);
  }
}

class StorageFilesController extends GetxController {
  final DefaultDocsController ddc = Get.put(DefaultDocsController());
  List<PlatformFile?> pickedfile = [];
  var storagedoc = <String>[].obs;
  var storagelinks = <String>[].obs;

}
