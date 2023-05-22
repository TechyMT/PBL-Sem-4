import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';

import 'package:get/get.dart';
import 'package:path/path.dart' as path;
import 'package:shared_preferences/shared_preferences.dart';

import 'controller.dart';

List<String> durls = [];
List<String> title = [];
List<String> printedurls = [];

String substr(String link) {
  final Profile prof = Get.put(Profile());
  String templink = link.replaceAll("%2F", " ");
  String finallink = templink.replaceAll("%20", " ");
  String finalink1 = finallink.replaceAll(prof.rollno.value, '');
  String cleanUrl = finalink1.split('?')[0];
  return cleanUrl;
}

Future<List<String>> getDownloadUrls() async {
  final Profile prof = Get.put(Profile());
  final FireStoreDatabase fsd = Get.put(FireStoreDatabase());
  String foldername = prof.rollno.value;
  final Reference storageref =
      FirebaseStorage.instance.ref().child('/temp/$foldername');
  final ListResult result = await storageref.listAll();
  final downloadUrlsFutures =
      result.items.map((ref) => ref.getDownloadURL()).toList();
  final urls = await Future.wait(downloadUrlsFutures);
  printedurls.addAll(urls);
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  sharedPreferences.setStringList('printed', printedurls);

  return urls;
}

Future<void> fetchDocs() async {
  List<String> databasenamelist = [];
  final List<String> urls = await getDownloadUrls();
  bool isthere = false;
  String name = '';
  String dname = '';
  for (String i in urls) {
    String link = path.basenameWithoutExtension(i);

    String substring = link.substring(link.indexOf('%2F'));

    String docsName = substr(substring);
    if (docsName != 'abc') {
      isthere = true;
      name = i;
      dname = docsName;
      databasenamelist.add(docsName);
    }
  }
  if (isthere) {
    urls.remove(name);
    databasenamelist.remove(dname);
  }
  print(urls);
  print(databasenamelist);
  durls = urls;
  title = databasenamelist;
  await addDoc();
}

Future<String> datetime() async {
  String datetime =
      ("${DateFormat.yMMMd().format(DateTime.now())} ${DateFormat.jm().format(DateTime.now())}");
  return datetime;
}

Future<void> addDoc() async {
  final Profile prof = Get.put(Profile());
  final FireStoreDatabase fsd = Get.put(FireStoreDatabase());

  List<Map<String, String>> urlArr = [];
  for (int i = 0; i < title.length; i++) {
    urlArr.add({'link': durls[i], 'name': title[i]});
  }
  try {
    await FirebaseFirestore.instance.collection('print').add({
      'id': prof.rollno.value.toString(),
      'isGiven': false,
      'isPrinted': false,
      'pages': fsd.totalpages().toInt(),
      'Amount': fsd.totalpages().toInt() * 1,
      'date_time': await datetime(),
      'urlArr': urlArr
    });
  } catch (e) {
    Get.snackbar('Error Occured', e.toString());
  }
}
