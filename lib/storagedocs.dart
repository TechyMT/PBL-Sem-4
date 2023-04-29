// ignore_for_file: avoid_print

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

Future uploadfile(List<PlatformFile?> pickedfile) async {
  final Profile prof = Get.find();
  for (var file in pickedfile) {
    final path = 'temp/${prof.rollno.value.toString()}/${file!.name}';
    final ref = FirebaseStorage.instance.ref().child(path);
    final uploadTask = ref.putFile(File(file.path!));
    final snapshot = await uploadTask.whenComplete(() => {});
    final url = await snapshot.ref.getDownloadURL();
    print(url);
  }
}

class StorageDocs extends StatefulWidget {
  const StorageDocs({super.key});

  @override
  State<StorageDocs> createState() => _StorageDocsState();
}

class _StorageDocsState extends State<StorageDocs> {
  final Profile prof = Get.put(Profile());
  final StorageFilesController sfc = Get.find();
  final DefaultDocsController ddc = Get.find();

  //List<PlatformFile?> pickedfile = [];

  UploadTask? uploadTask;

  Future selectfile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: true);
    if (result == null) {
      return;
    }
    setState(() {
      sfc.pickedfile.addAll(result.files);
    });
    for (var file in sfc.pickedfile) {
      print(file!.name);
      sfc.storagedoc.add(file.name);
      ddc.cartdocs.add(file.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    print(sfc.storagedoc);

    return Scaffold(
      appBar: AppBar(
        title: Text('Storage Docs'),
      ),
      body: Center(
        child: Column(
          children: [
            SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.5,
                child: sfc.storagedoc.isEmpty
                    ? Center(child: const CircularProgressIndicator())
                    : Obx(() => ListView.builder(
                        itemCount: sfc.storagedoc.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Text(
                            sfc.storagedoc[index],
                            style: TextStyle(color: Colors.black),
                          );
                        })),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                selectfile();
              },
              child: sfc.storagedoc.isEmpty
                  ? Text('Select File')
                  : Text('Add More to Cart'),
            ),
            ElevatedButton(
              onPressed: () {
                //        uploadfile(pickedfile);
              },
              child: Text('Upload File'),
            ),
          ],
        ),
      ),
    );
  }
}
