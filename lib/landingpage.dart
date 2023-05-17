import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:printez/aboutcard.dart';
import 'package:printez/loginview.dart';
import 'package:printez/registerview.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:get/get.dart';
import "constants.dart";
import 'developerspage.dart';
import "printezlogo.dart";

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: PageView(
          children: [
            firstScreen(),
            developersScreen(),
            welcomeThirdScreen(),
          ],
        ),
      ),
    );
  }
}

class firstScreen extends StatelessWidget {
  const firstScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          color: Colors.transparent,
            alignment: Alignment.topRight,
            child: printEZLogo(
              fontSize: screenHeight * 0.05,
            )),

        Container(
          color: Colors.transparent,
          child: Image.asset(
            "images/appdesigncropped.png",
            fit: BoxFit.cover,
          ),
        ),
        Container(
       //       alignment: Alignment.topLeft,
          child: Text("What are we",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 50.0,
                fontWeight: FontWeight.bold,
              )),
        ),
        SizedBox(
          height: screenHeight * 0.1,
        ),
        Expanded(
          child: Container(
            child: Text("""In today's digital age, there are various applications that allow users to store and manage their documents online. However, there are times when a physical copy of a document is required. So this app helps to upload or scan documents or images and then print them according to the user’s specifications.""",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                )),
          ),
        )
      ],
    );
  }
}


class welcomeThirdScreen extends StatelessWidget {
  const welcomeThirdScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Column(
          children: [
            SizedBox(
              height: screenHeight * 0.05,
            ),
            Container(
              color: Colors.transparent,
              child: Image.asset(
                "images/appdesigncropped.png",
                fit: BoxFit.cover,
              ),
            )
          ],
        ),
        Column(
          children: [
            SizedBox(
              height: screenHeight * 0.3,
            ),
            Container(
              alignment: Alignment.center,
              width: screenWidth,
              height: screenHeight * 0.45,
              color: Colors.black,
              // decoration: const BoxDecoration(
              //   borderRadius: BorderRadius.only(
              //     topLeft: Radius.circular(30),
              //     topRight: Radius.circular(30),
              //   ),

              //),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: screenHeight * 0.45 - 50,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(
                          height: 30,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Welcome To ",
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.white,
                                  ),
                                ),
                                printEZLogo(fontSize: 30.0,),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              'Print At Your Ease',
                              style: TextStyle(fontSize: 25,color: Colors.white,),
                            ),
                            SizedBox(
                              height: screenHeight * 0.09,
                            ),
                            Container(
                              color: Colors.orange,
                              height: 50,
                              width: 250,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.orange,
                                ),
                                onPressed: () {
                                  Get.to(() => const RegisterView());
                                },
                                child: const Text('GET STARTED',style:TextStyle(fontSize: 20.0,)),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'ALREADY HAVE AN ACCOUNT?  ',
                                  style: TextStyle(fontSize: 15, color: Colors.white),
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: 'LOG IN',
                                    style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.teal,
                                      decoration: TextDecoration.underline,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Get.to(() => LoginView());
                                      },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
