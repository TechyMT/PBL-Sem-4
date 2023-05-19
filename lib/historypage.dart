// ignore_for_file: avoid_print

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:printez/cartpage.dart';
import 'package:printez/homescreenbase.dart';

import 'controller.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  //List<PlatformFile?> pickedfile = [];

  @override
  Widget build(BuildContext context) {
    var height2 = MediaQuery.of(context).size.height;
    var width2 = MediaQuery.of(context).size.width;
    return HomeScreenBase(
      childUpper: Container(
        child: Text(
          "History Page",
          style: TextStyle(
              color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold),
        ),
      ),
      childLower: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                height: height2 * 0.5,
                child:  Container(
                  child: ListView.builder(
                    itemCount: 5,
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
                                "File Name",
                                style: TextStyle(color: Colors.black, fontSize: height2 * 0.02),
                              ),
                            ],
                          ),
                        ),
                      );
                    },),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
