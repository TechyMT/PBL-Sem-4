import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:path/path.dart' as path;

class DefaultDocs extends StatefulWidget {
  const DefaultDocs({super.key});

  @override
  State<DefaultDocs> createState() => _DefaultDocsState();
}

class _DefaultDocsState extends State<DefaultDocs> {
  final CollectionReference defaultdocsref =
      FirebaseFirestore.instance.collection('/default-docs');
  final Reference storageRef =
      FirebaseStorage.instance.ref().child('/default-docs');
  final Reference sto =
      FirebaseStorage.instance.ref().child('1a0n0xeq13u91.jpg');
  List<String> downloadUrls = [];
  Future<String>? hehe;
  @override
  void initState() {
    fetchDefaultDocs();
    super.initState();
  }

  Future<void> fetchDefaultDocs() async {
    try {
      final res = await sto;
      final url = res.getDownloadURL();
      hehe = url;
      final ListResult result = await storageRef.listAll();
      final downloadUrlsFutures =
          result.items.map((ref) => ref.getDownloadURL()).toList();
      final urls = await Future.wait(downloadUrlsFutures);
      setState(() {
        downloadUrls = urls;
      });
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Default Docs'),
      ),
      // body: downloadUrls.isEmpty
      //     ? Center(child: CircularProgressIndicator())
      //     : ListView.builder(
      //         itemCount: downloadUrls.length,
      //         itemBuilder: (context, index) {
      //           return ListTile(
      //             title: Text('Document ${index + 1}'),
      //             subtitle: Text(downloadUrls[index]),
      //             onTap: () {

      //             },
      //           );
      //         },
      //       ),
      body: Column(
        children: [
          FutureBuilder<String>(
            future: hehe,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                String link = path.basenameWithoutExtension(snapshot.data!);
                return Text(link);
              } else {
                return Text('jh');
              }
            },
          ),
          SingleChildScrollView(
            child: Container(
              height: 200,
              child: downloadUrls.isEmpty
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: downloadUrls.length,
                      itemBuilder: (context, index) {
                        String link =
                            path.basenameWithoutExtension(downloadUrls[index]);
                        String substring = link.substring(link.indexOf('%2F'));
                        String hehe = substr(substring);
                        return ListTile(
                          title: Text('Document ${index + 1}'),
                          subtitle: Text(hehe),
                          onTap: () {},
                        );
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
