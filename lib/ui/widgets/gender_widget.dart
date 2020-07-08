import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:super_app/util/colors.dart';

enum Gender { male, female }

class GenderWidget extends StatelessWidget {
  final Gender gender;

  GenderWidget({@required this.gender});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          gender == Gender.male ? FontAwesomeIcons.mars : FontAwesomeIcons.venus,
          size: 56.0,
          color: MyColors.accent,
        ),
        SizedBox(height: 12.0),
        Text(gender == Gender.male ? 'MALE' : 'FEMALE'),
      ],
    );
  }
}
