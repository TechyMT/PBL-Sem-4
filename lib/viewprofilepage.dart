import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:printez/homescreenbase.dart";

import "controller.dart";

class ViewProfilePage extends StatelessWidget {
  final Profile prof = Get.put(Profile());
  ViewProfilePage({Key? key}) : super(key: key);
  String? name;
  String? roll;
  String? email;
  String? registration;
  String? classStudent;
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return HomeScreenBase(childUpper: Column(
      children: [
    Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        "PROFILE",
        style: TextStyle(
            fontSize: 50.0,
            fontWeight: FontWeight.bold,
            color: Colors.white),
        textAlign: TextAlign.center,
      ),
    ),
    Padding(
      padding: EdgeInsets.all(screenHeight * 0.01),
      child: CircleAvatar(
        child: Icon(Icons.person, size: 50.0),
        radius: 50.0,
      ),
    ),
    ],),
        childLower: ListView(
          children: [
          ProfileFieldCard(fieldName: 'Username',data: ''),
          ProfileFieldCard(fieldName: 'Roll number',data: prof.rollno.value),
          ProfileFieldCard(fieldName: "Email",data:''),
          ProfileFieldCard(fieldName: "Registration Number",data:''),
          ProfileFieldCard(fieldName: 'Class',data:''),
        ],
      ),
    );
  }
}

class ProfileFieldCard extends StatelessWidget {
  ProfileFieldCard({super.key, required this.fieldName,required this.data});

  final String fieldName;
  final String data;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.only(top: 15.0,bottom: 15.0, left: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
        ),
        child: Text(
          "$fieldName : ${data}",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
          // decoration: InputDecoration(
          //     filled: true,
          //     focusedBorder: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(20.0),
          //     ),
          //     focusColor: Colors.blue,
          //     fillColor: Colors.white,
          //     hintText: fieldName,
          //     hintStyle: TextStyle(
          //       color: Colors.grey,
          //     ),
          //     border: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(20.0),
          //     )),
        ),
      ),
    );
  }
}
