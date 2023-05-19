import "package:flutter/material.dart";

class AboutCard extends StatelessWidget {
  AboutCard({super.key,required this.title,required this.image, required this.name, required this.size});

  final size;
  final String name;
  final String image;
  final String title;
  @override
  Widget build(BuildContext context) {
    var screenHeight = size;
    return Container(
      height: size,
      width: size,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 3,
              child: CircleAvatar(
                  radius: size * 0.2,
                  backgroundImage: AssetImage(image)),
            ),
            Expanded(
              child: Text(name),
            ),
            Expanded(
              child: Text(title,textAlign: TextAlign.center,),
            ),
            Expanded(
              flex: 2,
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
          ],
        ),
      ),
    );
  }
}
