import 'package:flutter/material.dart';

const ROUTE_PLAY_GROUND = '/play-ground';

class PlayGroundPage extends StatelessWidget {
  List<Widget> _images() {
    return [
      Padding(
        padding: const EdgeInsets.all(24),
        child: Text(
          'Meditation - Image from web',
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        child: Image.network(
            'https://miro.medium.com/max/788/1*X4DyybmnbI3ImjC9XpyvYQ.png'),
      ),
      Padding(
        padding: const EdgeInsets.all(24),
        child: Text(
          'Super App Icon - Image from assets',
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        child: Center(
          child: Image.asset(
            'assets/images/super-icon.png',
            height: 180,
          ),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ..._images(),
            ],
          ),
        ),
      ),
    );
  }
}
