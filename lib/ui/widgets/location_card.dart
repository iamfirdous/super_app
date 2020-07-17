import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:super_app/models/weather.dart';

class LocationCard extends StatelessWidget {
  final Weather weather;
  final Function onTap;

  const LocationCard({
    @required this.onTap,
    @required this.weather,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(24.0),
        decoration: BoxDecoration(
          border: Border.all(width: 2.0, color: Colors.white),
          borderRadius: BorderRadius.circular(16.0),
          color: Colors.black.withOpacity(0.6),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              FontAwesomeIcons.mapMarkerAlt,
              size: 28.0,
              color: Colors.white,
            ),
            SizedBox(width: 12.0),
            Text(
              weather.city,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
