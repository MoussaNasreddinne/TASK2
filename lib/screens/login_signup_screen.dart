import 'package:flutter/material.dart';
import '../widgets/_login_signup_tabs.dart';
import '../widgets/_custom_text_field.dart';

class LoginSignupScreen extends StatefulWidget {
  const LoginSignupScreen({super.key});

  @override
  State<LoginSignupScreen> createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  int _selectedTab = 0; // 0 = Login, 1 = Sign Up
  bool _agreedToTerms = false;

  static const backgroundColor = Color(0xFF131518);
  static const cardColor = Color(0xFF1E2125);
  static const primaryColor = Color(0xFF1BC98E);
  static const secondaryTextColor = Color(0xFF868B9D);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        leading: const SizedBox.shrink(),
        actions: [
          IconButton(
            icon: const Icon(Icons.close, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Let's Sign You In",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                LoginSignupTabs(
                  selectedTab: _selectedTab,
                  onTabSelected: (index) {
                    setState(() {
                      _selectedTab = index;
                    });
                  },
                  cardColor: cardColor,
                  secondaryTextColor: secondaryTextColor,
                ),
                const SizedBox(height: 30),
                if (_selectedTab == 0) ..._buildLoginFields(),
                if (_selectedTab == 1) ..._buildSignUpFields(),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // TODO: Implement the authentication logic here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF444444),
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Text(
                      _selectedTab == 0 ? 'Log In' : 'Sign Up',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                const Center(
                  child: Text(
                    'Or Connect With',
                    style: TextStyle(color: secondaryTextColor),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildSocialIcon(Icons.apple),
                    const SizedBox(width: 20),
                    _buildSocialIcon(Icons.facebook),
                    const SizedBox(width: 20),
                    _buildSocialIcon(Icons.g_mobiledata),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildLoginFields() {
    return [
      CustomTextField(
        label: 'E-mail Address',
        isPassword: false,
        fillColor: backgroundColor,
        labelColor: secondaryTextColor,
        primaryColor: primaryColor,
      ),
      const SizedBox(height: 20),
      CustomTextField(
        label: 'Password',
        isPassword: true,
        fillColor: backgroundColor,
        labelColor: secondaryTextColor,
        primaryColor: primaryColor,
      ),
      const SizedBox(height: 10),
      Align(
        alignment: Alignment.centerRight,
        child: TextButton(
          onPressed: () {
            // TODO: Add logic for "Forgot Password?"
          },
          child: Text(
            'Forgot Password?',
            style: TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ];
  }

  List<Widget> _buildSignUpFields() {
    return [
      CustomTextField(
        label: 'First Name',
        isPassword: false,
        fillColor: backgroundColor,
        labelColor: secondaryTextColor,
        primaryColor: primaryColor,
      ),
      const SizedBox(height: 20),
      CustomTextField(
        label: 'Last Name',
        isPassword: false,
        fillColor: backgroundColor,
        labelColor: secondaryTextColor,
        primaryColor: primaryColor,
      ),
      const SizedBox(height: 20),
      CustomTextField(
        label: 'E-mail Address',
        isPassword: false,
        fillColor: backgroundColor,
        labelColor: secondaryTextColor,
        primaryColor: primaryColor,
      ),
      const SizedBox(height: 20),
      CustomTextField(
        label: 'Password',
        isPassword: true,
        fillColor: backgroundColor,
        labelColor: secondaryTextColor,
        primaryColor: primaryColor,
      ),
      const SizedBox(height: 20),
      CustomTextField(
        label: 'Confirm Password',
        isPassword: true,
        showCheckmark: true,
        fillColor: backgroundColor,
        labelColor: secondaryTextColor,
        primaryColor: primaryColor,
      ),
      const SizedBox(height: 20),
      Row(
        children: [
          Checkbox(
            value: _agreedToTerms,
            onChanged: (bool? newValue) {
              setState(() {
                _agreedToTerms = newValue!;
              });
            },
            activeColor: primaryColor,
            checkColor: Colors.white,
          ),
          const Text(
            'I agree to the ',
            style: TextStyle(color: Colors.white, fontSize: 13),
          ),
          GestureDetector(
            onTap: () {},
            child: Text(
              'Terms',
              style: TextStyle(color: primaryColor, fontSize: 13),
            ),
          ),
          const Text(
            ' and ',
            style: TextStyle(color: Colors.white, fontSize: 13),
          ),
          GestureDetector(
            onTap: () {},
            child: Text(
              'Conditions',
              style: TextStyle(color: primaryColor, fontSize: 13),
            ),
          ),
        ],
      ),
    ];
  }

  Widget _buildSocialIcon(IconData icon) {
    return Container(
      width: 55,
      height: 55,
      decoration: BoxDecoration(
        color: const Color(0xFF444444),
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