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
        children: [
          firstScreen(),
          secondScreen(),
          welcomeThirdScreen(),
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
       //       alignment: Alignment.topLeft,
              child: Text("What are we",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            SizedBox(
              height: screenHeight * 0.1,
            ),
            Container(
              child: Text("""In today's digital age, there are various applications that allow users to store and manage their documents online. However, there are times when a physical copy of a document is required. So this app helps to upload or scan documents or images and then print them according to the user’s specifications.""",
                  textAlign: TextAlign.center,
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
    var cardHeight = screenHeight * 0.22;
    return Container(
      decoration: welcomeDecor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: screenHeight * 0.03,
          ),
          Container(
            alignment: Alignment.center,
              padding: const EdgeInsets.all(15),
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [printEZLogo(fontSize: 50),SizedBox(height: 10,),const Text('Team',style: TextStyle(fontSize: 30),)],)
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
                    AboutCard(name: "Amogh Thakurdesai",title:'App Developer',size: cardHeight,image:"images/amogh.png", ),
                    AboutCard(name: "Rhea Shah",size: cardHeight,image:"images/rhea1.png", title: 'UI/UX Designer',),
                  ],),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AboutCard(name: "Ameya Surana",size: cardHeight,image:"images/surana1.png", title: 'App Developer',),
                    AboutCard(name: "Riya Wani",size: cardHeight,image:"images/riya.png", title: 'Frontend Developer',),
                  ],),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AboutCard(name: "Mustafa Trunkwala",size: cardHeight,image:"images/aunty.png", title: 'Web Developer',),
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
  });

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
