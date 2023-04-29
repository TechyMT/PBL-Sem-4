// ignore_for_file: avoid_print

import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:printez/controller.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:printez/defaultdocs.dart';
import 'package:printez/storagedocs.dart';

class CartPage extends StatelessWidget {
  final Profile prof = Get.put(Profile());
  final DefaultDocsController ddc = Get.put(DefaultDocsController());
  final StorageFilesController sfc = Get.find();
  CartPage({super.key});

  String substr(String link) {
    String templink = link.replaceAll("%2F", " ");
    String finallink = templink.replaceAll("%20", " ");
    String finalLink1 = finallink.replaceAll("default-docs", "");
    return finalLink1;
  }

  Future<void> uploadFileStorage(RxList<String> cartlinks) async {
    FirebaseStorage storage = FirebaseStorage.instance;

    for (String link in cartlinks) {
      try {
        http.Response response = await http.get(Uri.parse(link));
        Uint8List filebytes = response.bodyBytes;
        String fileName = path.basenameWithoutExtension(link);
        //      String substring = link.substring(link.indexOf('%2F'));
        String finalName = substr(fileName);
        Reference storageref = storage
            .ref()
            .child('temp/${prof.rollno.value.toString()}/$finalName');
        UploadTask? uploadTak = storageref.putData(filebytes);
        String downloadUrl = await (await uploadTak).ref.getDownloadURL();
        print(
            'File $finalName uploaded to Firebase Storage with download URL: $downloadUrl');
      } catch (e) {
        print('Failed to upload file from $link : $e');
      } 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Page'),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.7,
              child: ddc.cartdocs.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: ddc.cartdocs.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Text(ddc.cartdocs[index]);
                      },
                    ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                uploadFileStorage(ddc.cartlinks);
                uploadfile(sfc.pickedfile);
              },
              child: Text('Uploads on Temp'))
        ],
      ),
    );
  }
}
