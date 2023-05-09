import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:printez/aboutcard.dart';
import 'package:printez/loginview.dart';
import 'package:printez/registerview.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:get/get.dart';
import "constants.dart";
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
    return Scaffold(
      body: PageView(
        onPageChanged: (index) {
          setState(() {
            activeIndex = index;
          });
        },
        children: [
          firstScreen(),
          secondScreen(),
          welcomeThirdScreen(activeIndex: activeIndex),
        ],
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
    return Container(
        decoration: welcomeDecor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: screenHeight * 0.1,
            ),
            Container(
                alignment: Alignment.topRight,
                child: printEZLogo(
                  fontSize: screenHeight * 0.05,
                )),
            SizedBox(
              height: screenHeight * 0.2,
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text("What are we",
                  style: TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            SizedBox(
              height: screenHeight * 0.1,
            ),
            Container(
              child: Text("""lejsvaslkjflkjvkdasjvfkjs
a;vnalskjdvnfnds;kn
dsfvkljsfdnvkjdnflkjvn
dskjvfkljnvkldsjnvfkljnvsdlk""",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 20.0,
                  )),
            )
          ],
        ));
  }
}

class secondScreen extends StatelessWidget {
  const secondScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height ;
    var cardHeight = screenHeight * 0.2;
    return Container(
      decoration: welcomeDecor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: screenHeight * 0.03,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "DKFNLSKNDLKVNS",
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: screenHeight * 0.03,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AboutCard(name: "1",size: cardHeight),
                    AboutCard(name: "1",size: cardHeight),
                  ],),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AboutCard(name: "1",size: cardHeight),
                    AboutCard(name: "1",size: cardHeight),
                  ],),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AboutCard(name: "1",size: cardHeight),
                  ],),
                SizedBox(
                  height: screenHeight * 0.03,
                )
              ],),
          )
        ],
      ),
    );
  }
}

class welcomeThirdScreen extends StatelessWidget {
  const welcomeThirdScreen({
    super.key,
    required this.activeIndex,
  });

  final int activeIndex;

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(
          height: screenHeight * 0.55,
        ),
        Container(
          alignment: Alignment.center,
          height: screenHeight * 0.45,
          width: screenWidth,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            color: Colors.grey,
          ),
          child: PageView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  AnimatedSmoothIndicator(
                    activeIndex: activeIndex,
                    count: 3,
                    effect: WormEffect(
                      dotColor: Colors.white,
                    ),
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
                                    fontSize: 23,
                                  ),
                                ),
                                printEZLogo(fontSize: 23.0),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              'Print At Your Ease',
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(
                              height: screenHeight * 0.09,
                            ),
                            SizedBox(
                              height: 50,
                              width: 250,
                              child: ElevatedButton(
                                onPressed: () {
                                  Get.to(() => const RegisterView());
                                },
                                child: const Text('Get Started'),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Already Have An Account ?  ',
                                  style: TextStyle(fontSize: 15),
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: 'Log In',
                                    style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
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
            ],
          ),
        ),
      ],
    );
  }
}
