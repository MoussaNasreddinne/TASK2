import 'package:flutter/material.dart';

class LoginSignupTabs extends StatelessWidget {
  final int selectedTab;
  final Function(int) onTabSelected;
  final Color cardColor;
  final Color secondaryTextColor;

  const LoginSignupTabs({
    super.key,
    required this.selectedTab,
    required this.onTabSelected,
    required this.cardColor,
    required this.secondaryTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Expanded(child: _buildTab('Login', 0)),
          Expanded(child: _buildTab('Sign Up', 1)),
        ],
      ),
    );
  }

  Widget _buildTab(String label, int index) {
    bool isSelected = selectedTab == index;
    const inactiveTabColor = Colors.transparent;

    return GestureDetector(
      onTap: () => onTabSelected(index),
      child: InkWell(
        onTap: () => onTabSelected(index),
        splashColor: Colors.white12,
        borderRadius: BorderRadius.circular(15),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF444444) : inactiveTabColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : secondaryTextColor,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}