import 'package:flutter/material.dart';
import '../constants.dart';

class BuildMenuItem extends StatelessWidget {
  final String title;
  final IconData icon;

  const BuildMenuItem({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(color: secondaryTextColor, fontSize: 16),
          ),
          const Spacer(),
          const Icon(Icons.chevron_right, color: secondaryTextColor),
        ],
      ),
    );
  }
}