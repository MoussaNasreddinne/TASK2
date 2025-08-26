import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import '../providers/navigation_provider.dart';

class BuildNavItem extends StatelessWidget {
  final BuildContext context;
  final IconData icon;
  final String label;
  final int index;

  const BuildNavItem(this.context, this.icon, this.label, this.index);

  @override
  Widget build(BuildContext context) {
    final navProvider = Provider.of<NavigationProvider>(context);
    bool isSelected = navProvider.currentIndex == index;

    return GestureDetector(
      onTap: () => navProvider.setIndex(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? primaryColor : Colors.white,
          ),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? primaryColor : secondaryTextColor,
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: 4,
            width: isSelected ? 24 : 0,
            margin: const EdgeInsets.only(top: 4),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ],
      ),
    );
  }
}