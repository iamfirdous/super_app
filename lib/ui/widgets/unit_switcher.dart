import 'package:flutter/material.dart';
import 'package:super_app/util/constants.dart';

class UnitSwitcher extends StatelessWidget {
  final bool isCelcius;
  final Function onChanged;

  const UnitSwitcher({
    @required this.onChanged,
    @required this.isCelcius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 74.0,
      height: 74.0,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: ShapeDecoration(
        shape: CircleBorder(
          side: BorderSide(
            width: 2.0,
            color: Colors.white,
          ),
        ),
        color: Colors.black.withOpacity(0.6),
      ),
      child: Transform.scale(
        scale: 1.6,
        child: Switch(
          activeThumbImage: AssetImage('${Constants.IMAGES_PATH}celcius.png'),
          inactiveThumbImage: AssetImage('${Constants.IMAGES_PATH}farenheit.png'),
          activeTrackColor: Color(0xFFaecdf9),
          inactiveTrackColor: Color(0xFFf3c3b0),
          value: isCelcius,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
