import 'package:flutter/material.dart';
import 'package:super_app/models/weather.dart';

class TempCard extends StatelessWidget {
  final Weather weather;
  final bool isCelcius;

  const TempCard({
    @required this.weather,
    @required this.isCelcius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(
        top: 72.0,
        left: 48.0,
        right: 48.0,
      ),
      decoration: BoxDecoration(
        border: Border.all(width: 2.0, color: Colors.white),
        borderRadius: BorderRadius.circular(16.0),
        color: Colors.black.withOpacity(0.6),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            weather.icon,
            scale: 5.0,
          ),
          SizedBox(height: 24.0),
          Column(
            children: <Widget>[
              Text(
                isCelcius ? weather.tempC : weather.tempF,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 42.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                weather.text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
