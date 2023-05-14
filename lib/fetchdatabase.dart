import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:path/path.dart' as path;

import 'controller.dart';

List<String> durls = [];
List<String> title = [];

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

Future<void> addDoc() async {
  final Profile prof = Get.put(Profile());
  final FireStoreDatabase fsd = Get.put(FireStoreDatabase());

  print(durls);
  print(title);
  List<Map<String, String>> urlArr = [];
  for (int i = 0; i < title.length; i++) {
    urlArr.add({'link': durls[i], 'name': title[i]});
  }
  print(urlArr);
  print(prof.rollno.value.toString());
  print(fsd.totalpages().toInt() + fsd.totalpages().toInt() * 1);
  try {
    await FirebaseFirestore.instance.collection('print').add({
      'id': prof.rollno.value.toString(),
      'isGiven': false,
      'isPrinted': false,
      'pages': fsd.totalpages().toInt(),
      'Amount': fsd.totalpages().toInt() * 1,
      'urlArr': urlArr
    });
    print("Data Added Successfully");
  } catch (e) {
    print(e.toString());
  }
}
