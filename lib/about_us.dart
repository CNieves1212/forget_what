import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'About Us',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}