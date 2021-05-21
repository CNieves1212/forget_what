import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double titleFontSize = 32;
    double textFontSize = 24;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'About Us',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: titleFontSize,
          ),
        ),
      ),
      body: Container(
        child: SizedBox.expand(
          child: Column(
            children: [
              Text(
                'This app was made by two Middlebury College students as their main project for their CS701 Senior Seminar class.\n\n' + 
                'Kaylee Thumann \'2022 (kthumann@middlebury.edu) - Computer Science and Italian \n\n' + 
                'Christian Nieves \'2021 (cnieves@middlebury.edu) - Computer Science and Psychology \n\n',
                style: TextStyle(fontSize: textFontSize),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
