// ignore_for_file: avoid_print

import 'dart:io';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdf_render/pdf_render.dart';
import 'package:shared_preferences/shared_preferences.dart';

RxInt bottomNavBarSelectedIndex = RxInt(0);
class Profile extends GetxController {
  var namecontroller = TextEditingController().obs;
  var rollnocontroller = TextEditingController().obs;
  var emailcontroller = TextEditingController().obs;
  var regnocontroller = TextEditingController().obs;
  var classnamecontroller = TextEditingController().obs;
  RxString rollno = RxString('');
  RxString username = RxString('');
  RxString email = RxString('');
  RxString regno = RxString('');
  RxString classname = RxString('');
  void updateRollNo(String roll, String username, String regid, String batch, String email ) async {
    rollno.value = roll;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('rollno', roll);
    await sharedPreferences.setString('username', username);
    await sharedPreferences.setString('email', email);
    await sharedPreferences.setString('regno', regid);
    await sharedPreferences.setString('classname', batch);
  }

  Future<void> loadRollno() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? savedrollno = sharedPreferences.getString('rollno');
    String? savedusername = sharedPreferences.getString('username');
    String? savedemail = sharedPreferences.getString('email');
    String? savedregno = sharedPreferences.getString('regno');
    String? savedclassname = sharedPreferences.getString('classname');
    if (savedrollno != null) {
      rollno.value = savedrollno;
    }
    if (savedusername != null) {
      username.value = savedusername!;
    }
    if (savedemail != null) {
      email.value = savedemail!;
    }
    if (savedregno != null) {
      regno.value = savedregno!;
    }
    if (savedclassname != null) {
      classname.value = savedclassname!;
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
    Get.snackbar('$url docs Added to the Cart','');
  }

  void removefromCart(String url, String link) {
    cartdocs.remove(url);
    cartlinks.remove(link);
    Get.snackbar('$url docs Removed from the Cart','');
  }

  bool isAddedtoCart(String url) {
    return cartdocs.contains(url);
  }
}

class StorageFilesController extends GetxController {
  final DefaultDocsController ddc = Get.put(DefaultDocsController());
  List<PlatformFile> pickedfile = [];
  var storagedoc = <String>[].obs;
  var storagelinks = <String>[].obs;
  UploadTask? uploadTask;
  RxDouble progress = 0.0.obs;
  RxString? filename = ''.obs;
  // RxInt? pageCount = 0.obs;
  Map<dynamic, dynamic> defdocinfo = {}.obs;
  Map<dynamic, dynamic> storagedocinfo = {}.obs;
  Future<int> getpages(String url) async {
    int pageCount;
    http.Response response = await http.get(Uri.parse(url));
    Uint8List filebytes = response.bodyBytes;
    PdfDocument pdfDoc = await PdfDocument.openData(filebytes);
    pageCount = pdfDoc.pageCount;
    return pageCount;
  }

  Future<void> getdefaultdocinfo(
      RxList<String> cartlinks, RxList<String> cartdocs) async {
    int i = 0;
    for (String link in cartlinks) {
      int pagecount = await getpages(link);
      String docn = cartdocs[i];
      defdocinfo[docn] = pagecount;
      i++;
    }
  }

  Future<void> getstoragedocinfo(
      RxList<String> storagedoc, List<PlatformFile> platformfile) async {
    int i = 0;
    for (PlatformFile filey in platformfile) {
      File file = File(filey.path!);
      Uint8List bytes = await file.readAsBytes();
      PdfDocument document = await PdfDocument.openData(bytes);
      int pageCount = document.pageCount;
      String docn = storagedoc[i];
      storagedocinfo[docn] = pageCount;
      i++;
    }
  }

  // @override
  // void onInit() {
  //   getdocinfo(ddc.cartlinks, ddc.cartdocs);
  //   super.onInit();
  // }

  Future uploadfile(List<PlatformFile?> pickedfile) async {
    final Profile prof = Get.find();

    for (var file in pickedfile) {
      final path = 'temp/${prof.rollno.value.toString()}/${file!.name}';
      final ref = FirebaseStorage.instance.ref().child(path);
      final uploadTask = ref.putFile(File(file.path!));
      uploadTask.snapshotEvents.listen((event) {
        double progressvalue =
            (event.bytesTransferred.toDouble() / event.totalBytes.toDouble()) *
                100;
        progress.value = progressvalue;
        filename?.value = file.name;
        print('File: ${file.name}, Progress: ${progress.toStringAsFixed(2)}%');
      });
      final snapshot = await uploadTask.whenComplete(() => {});

      final url = await snapshot.ref.getDownloadURL();
      progress.value = 0.0;
      print(url);
    }
  }

  // Future<int?> getPageCount(PlatformFile platformfile) async {
  //   File file = File(platformfile.path!);
  //   final Uint8List bytes = await file.readAsBytes();
  //   final PdfDocument document = await PdfDocument.openData(bytes);
  //   final int pageCount = document.pageCount;
  //   return pageCount;
  // }

  Future selectFiles() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: true);
    if (result == null) {
      return;
    }
    pickedfile.addAll(result.files);
    for (var file in pickedfile) {
      print(file.name);
      //   final int? pageCount = await getPageCount(file);
      if(!storagedoc.contains(file.name))
        {
          storagedoc.add(file.name);
        }

 //     ddc.cartdocs.add(file.name);
    }
  }

  void deleteFile(int index) {
    pickedfile.removeAt(index);
    storagedoc.removeAt(index);
  }
}
