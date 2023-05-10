// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:pdf_render/pdf_render_widgets.dart';
import 'package:printez/homescreenbase.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:printez/controller.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
//import 'package:pdf/pdf.dart';
import 'package:pdf_render/pdf_render.dart';
//import 'package:pdf_render/pdf_render_widgets.dart';
//import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class CartPage extends StatelessWidget {
  final Profile prof = Get.put(Profile());
  final DefaultDocsController ddc = Get.put(DefaultDocsController());
  final StorageFilesController sfc = Get.find();
  RxDouble progress = 0.0.obs;
  RxString filename = ''.obs;
  CartPage({super.key});

  String substr(String link) {
    String templink = link.replaceAll("%2F", " ");
    String finallink = templink.replaceAll("%20", " ");
    String finalLink1 = finallink.replaceAll("default-docs", "");
    return finalLink1;
  }
  // Future<int?> getpages(String cartlink) async {
  //   int? pagesCount;
  //   try {
  //     http.Response response = await http.get(Uri.parse(cartlink));
  //     Uint8List filebytes = response.bodyBytes;
  //     PdfDocumentLoader(
  //       doc: PdfDocument.openData(filebytes),
  //       documentBuilder: (context, pdfDocument, pagecount) {
  //         pagesCount = pagecount;
  //         return Container();
  //       },
  //     );
  //   } catch (e) {
  //     print(e.toString());
  //   }

  //   return pagesCount;
  // }

  Future<void> uploadFileStorage(RxList<String> cartlinks) async {
    FirebaseStorage storage = FirebaseStorage.instance;
    print(ddc.cartlinks);
    for (String link in cartlinks) {
      try {
        http.Response response = await http.get(Uri.parse(link));
        Uint8List filebytes = response.bodyBytes;
        //   Uint8List pdfbytes = response.bodyBytes;
        //   PdfDocumentLoader pdfDocument = PdfDocumentLoader.openData(pdfbytes);
        // PdfDocumentLoader(
        //   doc: PdfDocument.openData(pdfbytes),
        //   documentBuilder: (context, pdfDocument, pageCount) {
        //     pagescount = pdfDocument!.pageCount;
        //     return Container();
        //   },
        // );
        //  http.Response response = await http.get(Uri.parse(link));
        //      PdfDocument pdfDoc = await PdfDocument.openData(filebytes);
        //      sfc.pageCount?.value = pdfDoc.pageCount;

        String fileName = path.basenameWithoutExtension(link);
        //      String substring = link.substring(link.indexOf('%2F'));
        String finalName = substr(fileName);
        Reference storageref = storage
            .ref()
            .child('temp/${prof.rollno.value.toString()}/$finalName');
        UploadTask? uploadTask = storageref.putData(filebytes);
        uploadTask.snapshotEvents.listen((event) {
          double progressval = (event.bytesTransferred.toDouble() /
                  event.totalBytes.toDouble()) *
              100;
          progress.value = progressval;
          filename.value = finalName;
        });
        String downloadUrl = await (await uploadTask).ref.getDownloadURL();
        print(
            'File $finalName uploaded to Firebase Storage with download URL: $downloadUrl');
      } catch (e) {
        print('Failed to upload file from $link : $e');
      }
      progress.value = 0.0;
    }
  }

  @override
  Widget build(BuildContext context) {

    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    sfc.getstoragedocinfo(sfc.storagedoc, sfc.pickedfile);
    sfc.getdefaultdocinfo(ddc.cartlinks, ddc.cartdocs);
    print(sfc.defdocinfo);
    print(sfc.storagedocinfo);
    print(ddc.cartlinks);
    print(sfc.storagedoc);
    print(sfc.pickedfile);
    return HomeScreenBase(
        childUpper: Text('Cart Page',style: TextStyle(color: Colors.white,fontSize: screenHeight * 0.05),),
        childLower: Column(
          children: [
            Text("Uploaded Docs"),
            Expanded(
              flex:1,
              child: Obx(() => SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: (sfc.storagedoc.length != sfc.storagedocinfo.length)
                      ? const Center(child: CircularProgressIndicator())
                      : ListView.builder(
                    itemCount: sfc.storagedoc.length,
                    itemBuilder: (BuildContext context, int index) {
                      // String? documentName =
                      //     sfc.defdocinfo.keys.toList()[index];
                      // int? pageCount = sfc.defdocinfo.values.toList()[index];
                      String? documentName1 =
                      sfc.storagedocinfo.keys.toList()[index];
                      int? pageCount1 =
                      sfc.storagedocinfo.values.toList()[index];

                      return buildCartListTile(context,documentName: documentName1, pageCount: pageCount1);
                    },
                  ),
                ),
              )),
            ),
            Text("Default Docs"),
            Expanded(
              flex:1,
              child: Obx(() => SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: (ddc.cartdocs.length != sfc.defdocinfo.length)
                      ? const Center(child: CircularProgressIndicator())
                      : ListView.builder(
                    itemCount: ddc.cartdocs.length,
                    itemBuilder: (BuildContext context, int index) {
                      String? documentName =
                      sfc.defdocinfo.keys.toList()[index];
                      int? pageCount =
                      sfc.defdocinfo.values.toList()[index];
                      // String? documentName1 =
                      //     sfc.storagedocinfo.keys.toList()[index];
                      // int? pageCount1 =
                      //     sfc.storagedocinfo.values.toList()[index];

                      return buildCartListTile(context, documentName: documentName, pageCount: pageCount);
                    },
                  ),
                ),
              )),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Obx(() => Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Text(sfc.filename!.value.toString()),
                //     Obx(() => CircularStepProgressIndicator(
                //       totalSteps: 100,
                //       currentStep: sfc.progress.value.toInt(),
                //       padding: 0,
                //       stepSize: 10,
                //       height: 50,
                //       width: 50,
                //       unselectedColor: Colors.grey,
                //       selectedColor: Colors.green,
                //     )),
                //   ],
                // )),
                // Obx(() => Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Text(filename.value.toString()),
                //     Obx(() => CircularStepProgressIndicator(
                //       totalSteps: 100,
                //       currentStep: progress.value.toInt(),
                //       padding: 0,
                //       stepSize: 10,
                //       height: 50,
                //       width: 50,
                //       unselectedColor: Colors.grey,
                //       selectedColor: Colors.green,
                //     )),
                //   ],
                // )),
              ],
            ),
            // Container(
            //   height: 50,
            //   width: 100,
            //   child: Obx(() =>
            //       Text('FileName : ${sfc.progress.value.toStringAsFixed(2)}')),
            // ),
            ElevatedButton(
              onPressed: () {
                uploadFileStorage(ddc.cartlinks);
                sfc.uploadfile(sfc.pickedfile);
                //    sfc.pickedfile.clear();
                //     ddc.cartlinks.clear();
              },
              child: Text('Uploads on Temp'),
            ),
          ],
        ),
    );

  }

  Widget buildCartListTile(BuildContext context, {String? documentName, int? pageCount}) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.all(screenWidth* 0.01),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey,
        ),
        child: ListTile(

        title: Text(documentName!),
        trailing: IconButton(onPressed: (){
          if(sfc.defdocinfo.keys.toList().contains(documentName)){
            ddc.cartlinks.removeAt(sfc.defdocinfo.keys.toList().indexOf(documentName));
          }
          else if(sfc.storagedocinfo.keys.toList().contains(documentName)){
           sfc.pickedfile.removeAt(sfc.storagedocinfo.keys.toList().indexOf(documentName));
          }
        }, icon: Icon(Icons.delete),),
        subtitle: Text('$pageCount pages'),
          ),
      ),
    );
  }
}
