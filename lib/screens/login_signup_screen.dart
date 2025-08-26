import 'package:flutter/material.dart';

class LoginSignupScreen extends StatefulWidget {
  const LoginSignupScreen({super.key});

  @override
  State<LoginSignupScreen> createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  int _selectedTab = 0; // 0 = Login, 1 = Sign Up
  bool _obscurePassword = true;
  bool _agreedToTerms = false;

  // Defining colors as static const to make them compile-time constants
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
        leading: const SizedBox.shrink(), // Hides the back button
        actions: [
          IconButton(
            icon: const Icon(
              Icons.close,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
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
                // Tabs
                Container(
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
                ),
                const SizedBox(height: 30),
                // Conditional fields based on selected tab
                if (_selectedTab == 0) ...[
                  // Login Fields
                  _buildInputField('E-mail Address', false, const Color.fromARGB(255, 19, 21, 24), secondaryTextColor),
                  const SizedBox(height: 20),
                  _buildInputField('Password', true, const Color.fromARGB(255, 19, 21, 24), secondaryTextColor),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        // TODO: Add logic to handle "Forgot Password?"
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
                ] else ...[
                  // Sign Up Fields
                  _buildInputField('First Name', false, const Color.fromARGB(255, 19, 21, 24), secondaryTextColor),
                  const SizedBox(height: 20),
                  _buildInputField('Last Name', false, const Color.fromARGB(255, 19, 21, 24), secondaryTextColor),
                  const SizedBox(height: 20),
                  _buildInputField('E-mail Address', false, const Color.fromARGB(255, 19, 21, 24), secondaryTextColor),
                  const SizedBox(height: 20),
                  _buildInputField('Password', true, const Color.fromARGB(255, 19, 21, 24), secondaryTextColor),
                  const SizedBox(height: 20),
                  _buildInputFieldWithIcon('Confirm Password', true, const Color.fromARGB(255, 19, 21, 24), secondaryTextColor),
                  const SizedBox(height: 20),
                  // Checkbox for terms and conditions
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
                        onTap: () {
                          // TODO: Handle terms and conditions tap
                        },
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
                        onTap: () {
                          // TODO: Handle conditions tap
                        },
                        child: Text(
                          'Conditions',
                          style: TextStyle(color: primaryColor, fontSize: 13),
                        ),
                      ),
                    ],
                  ),
                ],
                const SizedBox(height: 20),
                // Log In Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // TODO: Implement the authentication logic here
                      // e.g., check email and password, sign in the user, and navigate away from this screen.
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
                // Social Icons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildSocialIcon(Icons.apple, cardColor),
                    const SizedBox(width: 20),
                    _buildSocialIcon(Icons.facebook, cardColor),
                    const SizedBox(width: 20),
                    _buildSocialIcon(Icons.g_mobiledata, cardColor),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTab(String label, int index) {
    bool isSelected = _selectedTab == index;
    // The background color for the unselected tabs is now transparent
    const inactiveTabColor = Colors.transparent;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTab = index;
        });
      },
      child: InkWell(
        onTap: () {
          setState(() {
            _selectedTab = index;
          });
        },
        // Changed splash color to better match the visual effect
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

  Widget _buildInputField(String label, bool isPassword, Color fillColor, Color labelColor) {
    return TextField(
      obscureText: isPassword ? _obscurePassword : false,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: labelColor),
        filled: true,
        fillColor: fillColor,
        border: OutlineInputBorder( // This is the change
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: Color(0xFF1F2124), // The new border color
            width: 1.0,
          ),
        ),
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(
                  _obscurePassword ? Icons.visibility_off : Icons.visibility,
                  color: labelColor,
                ),
                onPressed: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
              )
            : null,
      ),
    );
  }

  // A new build method for the text field with a checkmark icon
  Widget _buildInputFieldWithIcon(String label, bool isPassword, Color fillColor, Color labelColor) {
    return TextField(
      obscureText: isPassword ? _obscurePassword : false,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: labelColor),
        filled: true,
        fillColor: fillColor,
        border: OutlineInputBorder( // This is the change
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: Color(0xFF1F2124), // The new border color
            width: 1.0,
          ),
        ),
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(
                  _obscurePassword ? Icons.visibility_off : Icons.visibility,
                  color: labelColor,
                ),
                onPressed: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
              )
            : Icon(Icons.check_circle_outline, color: primaryColor), // The checkmark icon for confirm password
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon, Color color) {
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
