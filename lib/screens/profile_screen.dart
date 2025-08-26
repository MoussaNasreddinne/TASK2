import 'package:flutter/material.dart';
import '../constants.dart';
import 'login_signup_screen.dart';
import '../widgets/_build_menu_item.dart';
import 'notifications_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: const Text(
          'Profile',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
      Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const NotificationsScreen(),
              ),
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
  ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              // Log In / Sign Up Button
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginSignupScreen(),
                    ),
                  );
                },
                onTapDown: (_) {
                  setState(() {
                    _isTapped = true;
                  });
                },
                onTapUp: (_) {
                  setState(() {
                    _isTapped = false;
                  });
                },
                onTapCancel: () {
                  setState(() {
                    _isTapped = false;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                  decoration: BoxDecoration(
                   gradient: LinearGradient(
        colors: _isTapped
            ? [
                const Color(0xFF3D9B4D).withOpacity(0.5), // light left
                const Color(0xFF368143).withOpacity(0.5), // dark right
              ]
            : const [
                Color(0xFF3D9B4D), // light left
                Color(0xFF368143), // dark right
              ],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.person, color: Colors.white),
                      SizedBox(width: 15),
                      Text(
                        'Log In / Sign Up',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Spacer(),
                      Icon(Icons.chevron_right, color: Colors.white),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              // First Group of Menu Items
              Container(
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    BuildMenuItem(title: 'Languages', icon: Icons.language),
                    _buildDivider(),
                    BuildMenuItem(title: 'Help Center', icon: Icons.help_outline),
                    _buildDivider(),
                    BuildMenuItem(title: 'Contact Us', icon: Icons.mail_outline),
                    _buildDivider(),
                    BuildMenuItem(title: 'More Info', icon: Icons.info_outline),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              // Second Group of Menu Items
              Container(
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    BuildMenuItem(title: 'Share With Friends', icon: Icons.share_outlined),
                    _buildDivider(),
                    BuildMenuItem(title: 'Rate App', icon: Icons.star_border_outlined),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildDivider() {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 20),
    height: 1,
    color: secondaryTextColor.withOpacity(0.2),
  );
}