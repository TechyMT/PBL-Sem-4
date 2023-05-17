import "package:flutter/material.dart";

class printEZLogo extends StatelessWidget {
  printEZLogo({required this.fontSize});

  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Row(
       mainAxisAlignment: MainAxisAlignment.center,
        children: [
      Text(
        'Prin',
        style: TextStyle(
          fontSize: fontSize,
          color: Colors.purple,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.normal,
        ),
      ),
      Text(
        'TeZ',
        style: TextStyle(
          fontSize: fontSize,
          color: Colors.orange[500],
          fontWeight: FontWeight.bold,
        ),
      ),
    ]);
  }
}
