import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:printez/history.dart";
import "package:printez/profilepage.dart";
import "package:printez/homescreen.dart";
import "package:printez/viewprofilepage.dart";

import "controller.dart";

class HomeScreenBase extends StatefulWidget {
  final Profile prof = Get.put(Profile());

  HomeScreenBase({required this.childUpper, required this.childLower});

  final Widget childUpper;
  final Widget childLower;

  @override
  State<HomeScreenBase> createState() => _HomeScreenBaseState();
}

class _HomeScreenBaseState extends State<HomeScreenBase> {
  // List<Widget> pages = [ViewProfilePage(),HomeScreenView(),ViewProfilePage()];
  // int _selectedindex = 0;
  // Widget onicontapped(int index) {
  //   print(_selectedindex);
  //   setState(() {
  //     _selectedindex = index;
  //   });
  //   print(pages[_selectedindex]);
  //   return pages[_selectedindex];
  // }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        // bottomNavigationBar: BottomNavigationBar(
        //   items: const <BottomNavigationBarItem>[
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.home),
        //       label: 'Home',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.business),
        //       label: 'Business',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.school),
        //       label: 'School',
        //     ),
        //   ],
        //   currentIndex: _selectedindex,
        //   onTap: onicontapped,
        // ),
        bottomNavigationBar: Container(
          color: Color(0xFFD3C9F6),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                    child: IconButton(
                        icon: Icon(Icons.person, size: 40.0),
                        onPressed: () {
                          Get.to(ViewProfilePage());
                        })),
                Expanded(
                    child: IconButton(
                        icon: Icon(Icons.home, size: 40.0),
                        onPressed: () {
                          Get.to(HomeScreenView());
                        })),
                Expanded(
                  child: IconButton(
                      icon: Icon(Icons.history, size: 40.0),
                      onPressed: () {
                        Get.to(DocumentList(rollNo: widget.prof.rollno.value,));
                      }),
                ),
              ],
            ),
          ),
        ),
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: Colors.black,
              child: widget.childUpper,
            ),
            Container(
              color: Color(0xFFD0CFCF),
              child: Image.asset(
                "images/appdesign(inverted)cropped.png",
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Container(
                color: Color(0xFFD0CFCF),
                child: widget.childLower,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
