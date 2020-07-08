import 'package:flutter/material.dart';
import 'package:super_app/util/colors.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function onTap;
  final Function onLongPress;

  RoundIconButton({@required this.icon, @required this.onTap, this.onLongPress});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(
        icon,
        color: MyColors.scaffold,
        size: 18.0,
      ),
      onPressed: onTap,
      onLongPress: onLongPress,
      constraints: BoxConstraints.tightFor(
        width: 44.0,
        height: 44.0,
      ),
      shape: CircleBorder(),
      fillColor: MyColors.accent,
      elevation: 4.0,
    );
  }
}
