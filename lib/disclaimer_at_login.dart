import 'package:flutter/material.dart';

class DisclaimerAtLogin extends StatelessWidget {
  const DisclaimerAtLogin({Key key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    double titleFontSize = 32;
    double textFontSize = 24;
    return Scaffold(
      appBar: AppBar(
        title: Text('Disclaimer Page',
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
                    'This mobile app is intended to be used to keep track of personal items and give reminders. It is not, and is not intended, to be relied upon for users’ critical medications. Please be aware that there are bugs occuring and may result in numbers being changed without the user’s knowledge, notifications going off at the incorrect times, or item lists being lost upon restarting the app. This app has not been tested enough to verify that these errors will not occur, so please use it at your own discretion.',
                    style: TextStyle(fontSize: textFontSize,),
                  ),
              ElevatedButton(
                child: Text('I have read and understand the uses and potential risks with Forget What?',
                style: TextStyle(fontSize: textFontSize)),
                onPressed: () {
                  Navigator.pushNamed(context, '/sign_up');
                },
              ),
            ],
          ),

        ),
      ),
    );
  }
}
