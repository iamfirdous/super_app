import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  final Widget child;
  final Function onTap;
  final Function onLongPress;

  CalcButton({
    this.child,
    @required this.onTap,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: child,
      onPressed: onTap,
      onLongPress: onLongPress,
      constraints: BoxConstraints.expand(
        width: double.infinity,
        height: double.infinity,
      ),
      shape: CircleBorder(),
    );
  }
}
