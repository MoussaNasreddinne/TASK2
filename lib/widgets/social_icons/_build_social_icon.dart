import 'package:flutter/material.dart';
import '../../constants.dart';

class BuildSocialIcon extends StatelessWidget {
  final IconData icon;

  const BuildSocialIcon({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 55,
      decoration: BoxDecoration(
        color: lightGrey,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Center(
        child: Icon(
          icon,
          color: Colors.white,
          size: 45,
        ),
      ),
    );
  }
}