// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import "package:get/get.dart";
import "package:printez/developerspage.dart";
import 'package:printez/homescreenbase.dart';
import "package:printez/controller.dart";
import "package:printez/defaultdocs.dart";
import "package:printez/storagedocs.dart";
import "package:printez/cartpage.dart";
import "package:shared_preferences/shared_preferences.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:printez/landingpage.dart";

class HomeScreenView extends StatefulWidget {
  HomeScreenView({super.key});

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  final Profile prof = Get.put(Profile());

  final DefaultDocsController ddc = Get.find();

  final StorageFilesController sfc = Get.find();

  Future getData() async {
    // final SharedPreferences sharedPreferences =
    //     await SharedPreferences.getInstance();
    // var obtainedmail = sharedPreferences.getString('email');
    // var obtainedroll = sharedPreferences.getString('rollno');
    // setState(() {
    //   roll = obtainedroll;
    // });
    // print(mail);
    // print(roll);
    prof.loadRollno();
    String rollno = prof.rollno.value.toString();
    print("Rollno ${prof.rollno.value.toString()}");
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    var screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    return Obx(
        () => HomeScreenBase(
        childUpper: Text("Home for ${prof.rollno.value.toString()}", style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold,color: Colors.white),),
        childLower: Column(
          children:
          [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(screenHeight * 0.01),
                  child: TextButton(
                    onPressed: () {
                      Get.to(() => const DefaultDocs());
                    },
                    child: Text('Default Docs',style: TextStyle(fontSize: 20.0,)),
                    style: buildButtonStyle(screenWidth, screenHeight),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(screenHeight * 0.01),
                  child: TextButton(
                      onPressed: () {
                        Get.to(() => const StorageDocs());
                      },
                      child: Text('Storage Document',style: TextStyle(fontSize: 20.0,)),
                      style: buildButtonStyle(screenWidth, screenHeight)),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(screenHeight * 0.01),
                  child: TextButton(
                      onPressed: () {
                        Get.to(() => CartPage());
                      },
                      child: Text('Cart Page',style: TextStyle(fontSize: 20.0,)),
                ),
                ),
                Padding(
                  padding: EdgeInsets.all(screenHeight * 0.01),
                  child: TextButton(
                      onPressed: () async {
                        try {
                          final SharedPreferences sharedPreferences =
                          await SharedPreferences.getInstance();
                          final userCredential =
                          await FirebaseAuth.instance.signOut();
                          sharedPreferences.clear();
                          Get.offAll(() => const LandingPage());
                        } catch (e) {
                          print(e.toString());
                        }
                      },
                      child: Text('Log Out',style: TextStyle(fontSize: 20.0,)),
                      style: buildButtonStyle(screenWidth * 1, screenHeight)),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(screenHeight * 0.01),
              child: TextButton(
                  onPressed: () {
                    Get.to(() => developersScreen());
                  },
                  child: Text('Developers',style: TextStyle(fontSize: 20.0,)),
                  style: buildButtonStyle(screenWidth * 1, screenHeight)),
            ),
          ],
        ),
      ),
    );
  }

  ButtonStyle buildButtonStyle(double screenWidth, double screenHeight) {
    return ButtonStyle(
      minimumSize: MaterialStateProperty.all<Size>(
          Size(screenWidth * 0.45, screenHeight * 0.15)),
      backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
      foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
          side: BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}
