import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Future<List<Map<String, dynamic>>> getDocumentsByRollNo(String rollNo ) async {
  final QuerySnapshot<Map<String, dynamic>> snapshot =
      await FirebaseFirestore.instance.collection('print').get();

  final List<Map<String, dynamic>> documents = snapshot.docs
      .where((doc) => doc.data()['id'] == rollNo)
      .map((doc) => doc.data())
      .toList();

  print(documents);
  return documents;
}

class DocumentList extends StatelessWidget {
  final String rollNo;

  const DocumentList({required this.rollNo});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: getDocumentsByRollNo(rollNo),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final document = snapshot.data![index];
                final urlArr = document['urlArr'] as List<dynamic>;
                print(urlArr);
                return Material(
                  child: ListTile(
                    title: Text(document['id']),
                    subtitle: Text('${document['pages']} pages'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      //                      showDialog(
                      //   context: context,
                      //   builder: (_) {
                      //     return AlertDialog(
                      //       title: Text('Document Details'),
                      //       content: Column(
                      //         mainAxisSize: MainAxisSize.min,
                      //         crossAxisAlignment: CrossAxisAlignment.start,
                      //         children: [
                      //           if (document != null && document['urlArr'] != null)
                      //             for (var doc in document['urlArr'])
                      //               Text('${doc['name']}: ${doc['isGiven'] ? 'Given' : 'Not given'}${doc['isPrinted'] ? ', Printed' : ''}'),
                      //         ],
                      //       ),
                      //     );
                      //   },
                      // );
                    },
                  ),
                );
              },
            );
          } else {
            return Center(
              child: Text('No documents found for rollNo $rollNo'),
            );
          }
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
