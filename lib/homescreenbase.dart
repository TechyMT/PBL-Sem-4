import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:printez/history.dart";
import "package:printez/profilepage.dart";
import "package:printez/homescreen.dart";
import "package:printez/viewprofilepage.dart";

import "controller.dart";

class HomeScreenBase extends StatelessWidget {
  final Profile prof = Get.put(Profile());

  HomeScreenBase({required this.childUpper, required this.childLower});

  final Widget childUpper;
  final Widget childLower;
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Container(
          color: Color(0xFFD0CFCF),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                  onPressed: () {
                    Get.to(() => ViewProfilePage());
                  },
                  child: Icon(Icons.history,
                      color: Colors.grey, size: screenHeight * 0.1)),
              TextButton(
                  onPressed: () {
                    Get.to(() => HomeScreenView());
                  },
                  child: Icon(Icons.home,
                      color: Colors.grey, size: screenHeight * 0.1)),
              TextButton(
                  onPressed: () {
                    Get.to(() => DocumentList(rollNo: prof.rollno.value));
                  },
                  child: Icon(Icons.person,
                      color: Colors.grey, size: screenHeight * 0.1)),
            ],
          ),
        ),

        // appBar: AppBar(
        //    backgroundColor: Colors.transparent,
        //    leading: Icon(Icons.arrow_back,color: Colors.white,),
        //  ),
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: Colors.black,
              child: childUpper,
            ),
            Container(
              color: Color(0xFFD0CFCF),
              child: Image.asset(
                "images/appdesign(inverted)cropped.png",
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Container(color: Color(0xFFD0CFCF), child: childLower),
            )
          ],
        ),
      ),
    );
  }
}
