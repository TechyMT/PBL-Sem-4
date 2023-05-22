import "package:flutter/material.dart";
import "package:printez/printezlogo.dart";

import "aboutcard.dart";

class developersScreen extends StatelessWidget {
  const developersScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var cardHeight = screenHeight * 0.22;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              SizedBox(
                height: screenHeight * 0.08,
              ),
              Container(
                color: Colors.transparent,
                child: Image.asset(
                  "images/appdesigncropped.png",
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: screenHeight * 0.03,
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    printEZLogo(fontSize: 50),
                    SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Team',
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          AboutCard(
                            name: "Amogh Thakurdesai",
                            title: 'App Developer',
                            size: cardHeight,
                            image: "images/amogh.png",
                          ),
                          AboutCard(
                            name: "Rhea Shah",
                            size: cardHeight,
                            image: "images/rhea1.png",
                            title: 'UI/UX Designer',
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          AboutCard(
                            name: "Ameya Surana",
                            size: cardHeight,
                            image: "images/surana1.png",
                            title: 'App Developer',
                          ),
                          AboutCard(
                            name: "Riya Wani",
                            size: cardHeight,
                            image: "images/riya.png",
                            title: 'Frontend Developer',
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          AboutCard(
                            name: "Mustafa Trunkwala",
                            size: cardHeight,
                            image: "images/aunty.png",
                            title: 'Web Developer',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.03,
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
