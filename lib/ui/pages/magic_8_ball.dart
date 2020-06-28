import 'dart:math';
import 'package:flutter/material.dart';
import 'package:super_app/ui/components/custom_app_bar.dart';

const ROUTE_MAGIC_8_BALL = '/magic-8-ball';

class Magic8BallPage extends StatefulWidget {
  @override
  _Magic8BallPageState createState() => _Magic8BallPageState();
}

class _Magic8BallPageState extends State<Magic8BallPage> {
  int ballNumber = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(titleText: 'Magic 8 Ball'),
      body: OrientationBuilder(builder: (context, orientation) {
        return Flex(
          direction: orientation == Orientation.portrait
              ? Axis.vertical
              : Axis.horizontal,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Text(
                    'Tap the ball to know the answer',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: FlatButton(
                padding: const EdgeInsets.all(36.0),
                onPressed: () => setState(() => ballNumber = Random().nextInt(5)),
                child: Image.asset('assets/images/ball$ballNumber.png'),
              ),
            ),
          ],
        );
      }),
    );
  }
}
