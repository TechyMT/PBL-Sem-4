import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:path/path.dart' as path;
import 'package:printez/controller.dart';

class DefaultDocs extends StatefulWidget {
  const DefaultDocs({super.key});

  @override
  State<DefaultDocs> createState() => _DefaultDocsState();
}

class _DefaultDocsState extends State<DefaultDocs> {
  final DefaultDocsController ddc = Get.find();
  final CollectionReference defaultdocsref =
      FirebaseFirestore.instance.collection('/default-docs');
  final Reference storageRef =
      FirebaseStorage.instance.ref().child('/default-docs');
  // final Reference sto =
  //     FirebaseStorage.instance.ref().child('1a0n0xeq13u91.jpg');
  List<String> downloadUrls = [];
  // RxBool once = false.obs;
  // Future<String>? hehe;
  @override
  void initState() {
    fetchDefaultDocs();
    super.initState();
  }

  Future<void> fetchDefaultDocs() async {
    try {
      downloadUrls.clear();
      //     print(downloadUrls);
      //    final res = await sto;
      //  final url = res.getDownloadURL();
      //    hehe = url;
      final ListResult result = await storageRef.listAll();
      final downloadUrlsFutures =
          result.items.map((ref) => ref.getDownloadURL()).toList();
      final urls = await Future.wait(downloadUrlsFutures);
      setState(() {
        downloadUrls = urls;
      });
      print(downloadUrls);

      for (int i = 0; i < downloadUrls.length; i++) {
        await defaultdocsref.doc('doc$i').set({'name': 'Document ${i + 1}'});
      }
    } catch (e) {
      print(e.toString());
    }
  }

   String substr(String link) {
    String templink = link.replaceAll("%2F", " ");
    String finallink = templink.replaceAll("%20", " ");
    return finallink;
  }

  @override
  Widget build(BuildContext context) {
    // print(ddc.cartdocs.value);
    // print(ddc.cartlinks.value);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Default Docs'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              child: downloadUrls.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : GridView.builder(
                      itemCount: downloadUrls.length,
                      padding: const EdgeInsets.all(20),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        String link =
                            path.basenameWithoutExtension(downloadUrls[index]);
                        String substring = link.substring(link.indexOf('%2F'));
                        String docsName = substr(substring);
                        return Container(
                          color: Colors.red,
                          child: Column(children: [
                            Text(docsName),
                            ElevatedButton(
                              onPressed: () {
                                if (ddc.isAddedtoCart(docsName)) {
                                  return;
                                } else {
                                  ddc.addtoCart(docsName, downloadUrls[index]);
                                }
                                //                 print(ddc.cartdocs.value);
                              },
                              child: Obx(() => Text(ddc.isAddedtoCart(docsName)
                                  ? 'Added'
                                  : 'Add to Cart')),
                            ),
                          ]),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
