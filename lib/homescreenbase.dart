import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:printez/profilepage.dart";
import "package:printez/homescreen.dart";
import "package:printez/viewprofilepage.dart";

class HomeScreenBase extends StatefulWidget {
  HomeScreenBase({required this.childUpper, required this.childLower});

  final Widget childUpper;
  final Widget childLower;

  @override
  State<HomeScreenBase> createState() => _HomeScreenBaseState();
}

class _HomeScreenBaseState extends State<HomeScreenBase> {
  int _selectedindex = 0;
  List<Widget> pages = [ViewProfilePage(),HomeScreenView(),ViewProfilePage()];

  Widget onicontapped(int index) {
    print(_selectedindex);
    setState(() {
      _selectedindex = index;
    });
    return pages[_selectedindex];
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Business',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'School',
            ),
          ],
          currentIndex: _selectedindex,
          onTap: onicontapped,
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
              child:
                  Container(color: Color(0xFFD0CFCF), child: widget.childLower,
            ),
            ),
          ],
        ),
      ),
    );
  }
}
