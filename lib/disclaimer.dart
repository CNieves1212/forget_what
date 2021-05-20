import 'package:flutter/material.dart';

class Disclaimer extends StatelessWidget {
  const Disclaimer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Disclaimer Page',
                  style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                  ),
                ),
      ),
      body: Container(
        child: SizedBox.expand(
          child: Column(
            children: [
              Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam non odio venenatis, eleifend metus eu, dignissim urna. Sed commodo libero sit amet iaculis bibendum. Integer placerat justo quis eros ultricies facilisis. Nam sit amet elit et sem porttitor malesuada ac id lacus. Ut a fermentum arcu, non hendrerit orci. Etiam interdum turpis eu sapien consectetur, nec lobortis odio rutrum. Curabitur pellentesque turpis in diam hendrerit, sed efficitur dolor convallis. Curabitur faucibus imperdiet lectus a accumsan.',
                    style: TextStyle(fontSize: 24,),
                  ),
              Text(
                'Known Bugs:',
                style: TextStyle(fontSize: 24,),
              ),
            ],
          ),

        ),
      ),
    );
  }
}
