import 'package:flutter/material.dart';
import 'package:super_app/util/colors.dart';

class BottomButton extends StatelessWidget {
  final String label;
  final Function onTap;

  const BottomButton({this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: MyColors.accent,
        margin: const EdgeInsets.only(top: 12.0),
        width: double.infinity,
        height: 56.0,
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: MyColors.scaffold,
              fontSize: 18.0,
            ),
          ),
        ),
      ),
    );
  }
}
