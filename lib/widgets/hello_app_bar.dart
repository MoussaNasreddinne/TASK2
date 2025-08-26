import 'package:flutter/material.dart';
import '../constants.dart';
import '../screens/notifications_screen.dart';

class HelloAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HelloAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 0,
      title: const Text(
        'Hello',
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NotificationsScreen()),
              );
            },
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey.shade800,
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Icon(
                  Icons.notifications_none,
                  color: Colors.grey,
                  size: 24,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}