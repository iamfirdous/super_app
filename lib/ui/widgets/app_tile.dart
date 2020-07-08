import 'package:flutter/material.dart';

class AppTile extends StatelessWidget {
  final String imageName;
  final String label;
  final Function onTap;

  const AppTile({@required this.imageName, @required this.label, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 0.4, color: Colors.black),
        borderRadius: BorderRadius.circular(8.0),
      ),
      margin: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Image.asset(
                imageName,
                width: 38.0,
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 11),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
