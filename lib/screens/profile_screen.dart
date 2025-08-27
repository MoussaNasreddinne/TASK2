import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import 'login_signup_screen.dart';
import '../widgets/_build_menu_item.dart';
import 'notifications_screen.dart';
import 'account_info_screen.dart'; // <-- import your new screen
import '../providers/auth_provider.dart';
import 'saved_cards_sheet.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: const Text('Profile', style: TextStyle(color: Colors.white)),
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
                child: const Icon(Icons.notifications_none,
                    color: Colors.grey, size: 24),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              children: [
                const SizedBox(height: 20),
                authProvider.isLoggedIn
                    ? _buildLoggedInCard(authProvider)
                    : _buildLoginButton(context),
                const SizedBox(height: 30),
                _buildFirstMenuGroup(),
                const SizedBox(height: 30),
                _buildSecondMenuGroup(),
                const SizedBox(height: 30),
              ],
            ),
          ),
          if (authProvider.isLoggedIn)
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
              child: ElevatedButton(
                onPressed: () {
                  authProvider.logout();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(30, 33, 37, 1),
                  padding:
                      const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Logout',
                      style: TextStyle(color: Colors.red, fontSize: 16),
                    ),
                    Icon(
                      Icons.logout,
                      color: Colors.red,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LoginSignupScreen()),
        );
      },
      onTapDown: (_) => setState(() => _isTapped = true),
      onTapUp: (_) => setState(() => _isTapped = false),
      onTapCancel: () => setState(() => _isTapped = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: _isTapped
                ? [
                    const Color(0xFF3D9B4D).withOpacity(0.5),
                    const Color(0xFF368143).withOpacity(0.5),
                  ]
                : const [Color(0xFF3D9B4D), Color(0xFF368143)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Row(
          children: [
            Icon(Icons.person, color: Colors.white),
            SizedBox(width: 15),
            Text('Log In / Sign Up',
                style: TextStyle(color: Colors.white, fontSize: 16)),
            Spacer(),
            Icon(Icons.chevron_right, color: Colors.white),
          ],
        ),
      ),
    );
  }

  Widget _buildLoggedInCard(AuthProvider authProvider) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF3D9B4D), Color(0xFF368143)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top row: avatar and name/email
          Row(
            children: [
              const CircleAvatar(
                radius: 25,
                backgroundColor: Colors.white24,
                child: Icon(Icons.person, color: Colors.white, size: 30),
              ),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(authProvider.fullName,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                  Text(authProvider.email,
                      style: const TextStyle(
                          color: Colors.white70, fontSize: 14)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Divider between profile info and rows
          Container(
            height: 1,
            color: Colors.white.withOpacity(0.2),
          ),
          const SizedBox(height: 10),

          // First row: Account Information
          InkWell(
            onTap: () {
             showAccountInfoSheet(context);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Row(
                children: const [
                  Text(
                    'Account Information',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  Spacer(),
                  Icon(Icons.chevron_right, color: Colors.white, size: 20),
                ],
              ),
            ),
          ),

          // Divider
          Container(
            height: 1,
            color: Colors.white.withOpacity(0.2),
          ),

          // Second row: Saved Cards
          InkWell(
            onTap: () {
               showSavedCardsSheet(context);// Add navigation to Saved Cards page when ready
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Row(
                children: const [
                  Text(
                    'Saved Cards',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  Spacer(),
                  Icon(Icons.chevron_right, color: Colors.white, size: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFirstMenuGroup() {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromRGBO(30, 33, 37, 1),
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
    );
  }

  Widget _buildSecondMenuGroup() {
    return Container(
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
    );
  }

  Widget _buildDivider() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: 1,
      color: secondaryTextColor.withOpacity(0.2),
    );
  }
}
