import 'package:flutter/material.dart';
import '../constants.dart';

class SegmentedTabs extends StatelessWidget {
  final String selectedTab;
  final Function(String) onTabSelected;

  const SegmentedTabs({
    super.key,
    required this.selectedTab,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(15),
      ),
      height: 42,
      child: Row(
        children: [
          _buildSegmentButton('Country'),
          _buildSegmentButton('Regional'),
          _buildSegmentButton('Global'),
        ],
      ),
    );
  }

  Widget _buildSegmentButton(String title) {
    final bool isSelected = selectedTab == title;

    return Expanded(
      child: GestureDetector(
        onTap: () => onTabSelected(title),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF3A3A3A) : Colors.transparent,
            borderRadius: BorderRadius.circular(15),
          ),
          alignment: Alignment.center,
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 13,
            ),
          ),
        ),
      ),
    );
  }
}