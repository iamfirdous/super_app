import 'package:flutter/material.dart';
import 'package:super_app/util/colors.dart';

class MyCard extends StatelessWidget {
  final Color color;
  final Widget child;
  final Function onTap;

  MyCard({this.color = MyColors.activeCard, this.child, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: child,
      ),
    );
  }
}
