import "package:flutter/material.dart";

class AboutCard extends StatelessWidget {
  AboutCard({super.key, required this.name, required this.size});

  final size;
  final String name;
  @override
  Widget build(BuildContext context) {
    var screenHeight = size;
    return Container(
      decoration: BoxDecoration(),
      height: size,
      width: size,
      child: Card(
        color: Colors.grey.shade400,
        child: Column(
          children: [
            SizedBox(
              height: screenHeight * 0.58,
              child: CircleAvatar(
                child: Icon(Icons.person),
                  radius: screenHeight * 0.25,
                  backgroundImage: AssetImage("images/openingimage.png")),
            ),
            SizedBox(
              child: Text(name),
              height: screenHeight * 0.1,
            ),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: ImageIcon(
                      AssetImage("images/icons8-gmail-96.png"),
                      size: screenHeight*0.3
                    ),
                    onPressed: (){}
                  ),
                  IconButton(
                      icon: ImageIcon(
                          AssetImage("images/icons8-github-150.png"),
                          size: screenHeight*0.3
                      ),
                      onPressed: (){}
                  ),
                  IconButton(
                      icon: ImageIcon(
                          AssetImage("images/icons8-linkedin-144.png"),
                          size: screenHeight*0.3
                      ),
                      onPressed: (){}
                  ),
                ],
              ),
            ),
            SizedBox(
              height: screenHeight * 0.01,
            ),
          ],
        ),
      ),
    );
  }
}
