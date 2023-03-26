import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'landingpage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
      if (snapshot.connectionState == ConnectionState.active) {
        return CircularProgressIndicator();
      } else {
        if (snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              title: Text('fs'),
            ),
          );
        } else {
          return LandingPage();
        }
      }
    });
  }
}
