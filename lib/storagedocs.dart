// ignore_for_file: avoid_print

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:printez/cartpage.dart';
import 'package:printez/homescreenbase.dart';

import 'controller.dart';

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

  @override
  Widget build(BuildContext context) {
    print(sfc.storagedoc);


    var height2 = MediaQuery.of(context).size.height;
    var width2 = MediaQuery.of(context).size.width;
    return HomeScreenBase(
      childUpper: Container(
        child: Text("Storage Docs",style:TextStyle(color: Colors.white,fontSize: 30.0,fontWeight: FontWeight.bold),),
      ),
      childLower: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child:Container(
                  height: height2 * 0.5,
                  child: Obx(
                    () => sfc.storagedoc.isEmpty
                        ? Center(child: const Text('No File Selected'),)
                        :Obx(
                          ()=>ListView.builder(
                        itemCount: sfc.storagedoc.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.all(height2*0.005),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey,
                              ),
                              height: height2 * 0.1,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    sfc.storagedoc[index],
                                    style: TextStyle(color: Colors.black, fontSize: height2 * 0.02),
                                  ),
                                  IconButton(onPressed: (){
                                    sfc.deleteFile(index);
                                  }, icon: Icon(Icons.delete),),
                                ],
                              ),
                            ),
                          );
                        },),
                    ),
                  )
                ),
              ),
          ),
          ElevatedButton(
            onPressed: () {
              sfc.selectFiles();
            },
            child: Obx(
                ()=>sfc.storagedoc.isEmpty
                    ? Text('Select File')
                    : Text('Add More to Cart')
            ),
          ),
          ElevatedButton(onPressed: (){

            Get.to(CartPage());
          }, child: Icon(Icons.shopping_cart,size: 30.0,))
        ],
      ),
    );
  }
}
