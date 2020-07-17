import 'package:flutter/material.dart';
import 'package:super_app/util/constants.dart';

const ROUTE_ABOUT_DEV = '/about-dev';

// Segregate styles
class AboutDevPage extends StatelessWidget {
  Widget getInfoCard(String text, {IconData icon, String imageAsset}) {
    var leadingWidget;
    if (icon != null) leadingWidget = Icon(icon, color: Colors.black);
    if (imageAsset != null) leadingWidget = Image.asset(imageAsset, width: 24.0);

    return Card(
      margin: const EdgeInsets.only(
        bottom: 24.0,
        left: 28.0,
        right: 28.0,
      ),
      child: ListTile(
        leading: leadingWidget,
        title: Text(
          text,
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Montserrat',
            letterSpacing: 2,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 60.0,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage('${Constants.IMAGES_PATH}myself.png'),
            ),
            Text(
              'Firdous',
              style: TextStyle(
                color: Colors.white,
                fontSize: 52.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Merienda',
              ),
            ),
            Text(
              'Mobile & Web Developer'.toUpperCase(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat',
                letterSpacing: 4,
              ),
            ),
            SizedBox(
              height: 36.0,
              width: 150.0,
              child: Divider(color: Colors.white),
            ),
            getInfoCard('+91 00 1234 1234', icon: Icons.phone),
            getInfoCard('firdous@email.com', icon: Icons.email),
            getInfoCard('iamfirdous', imageAsset: '${Constants.IMAGES_PATH}github.png'),
          ],
        ),
      ),
    );
  }
}
