import 'package:flutter/material.dart';
import '../constants.dart';
import 'notifications_screen.dart';
import 'package:provider/provider.dart';
import '../providers/navigation_provider.dart';
import '../providers/auth_provider.dart';
import '../widgets/active_esim_list.dart';
import '../widgets/finished_esim_list.dart';

class EsimsScreen extends StatefulWidget {
  const EsimsScreen({super.key});

  @override
  State<EsimsScreen> createState() => _EsimsScreenState();
}

class _EsimsScreenState extends State<EsimsScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);

    return Scaffold(
      body: Container(
        decoration: !auth.isLoggedIn
            ? BoxDecoration(
                gradient: RadialGradient(
                  center: _selectedIndex == 0
                      ? const Alignment(0.9, 0)
                      : const Alignment(0.8, 0.7),
                  radius: 0.3,
                  colors: const [
                    Color.fromRGBO(65, 95, 62, 0.6),
                    Color.fromRGBO(10, 10, 10, 1.0),
                  ],
                  stops: const [0.0, 1.0],
                ),
              )
            : const BoxDecoration(color: Colors.black),
        child: SafeArea(
          child: Column(
            children: [
              _buildAppBar(context),
              const SizedBox(height: 20),

              // Segmented control
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  decoration: BoxDecoration(
                    color: cardColor,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    children: [
                      _buildSegment('Current eSIMs', 0),
                      _buildSegment('Finished eSIMs', 1),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: _selectedIndex == 0
                      ? auth.isLoggedIn
                          ? const ActiveEsimsWidget()
                          : _buildEmptyMessage(
                              'No Active eSIMs',
                              "Looks like you don't have any active eSIMs. Discover the convenience of digital SIM cards for your device.",
                            )
                      : auth.isLoggedIn
                          ? const FinishedEsimsWidget()
                          : _buildEmptyMessage(
                              'No Archived eSIMs',
                              "Looks like you don't have any archived eSIMs. Discover the convenience of digital SIM cards for your device.",
                            ),
                ),
              ),

              // Buy A Plan button when logged out
              if (!auth.isLoggedIn)
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: ElevatedButton(
                    onPressed: () {
                      Provider.of<NavigationProvider>(context, listen: false)
                          .setIndex(0);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 120, vertical: 15),
                    ),
                    child: const Text(
                      'Buy A Plan',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  // AppBar
  Widget _buildAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'My eSIMs',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
          ),
          GestureDetector(
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
        ],
      ),
    );
  }

  // Segmented control item
  Widget _buildSegment(String title, int index) {
    bool isSelected = _selectedIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedIndex = index;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? Colors.grey.shade800 : Colors.transparent,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.grey.shade600,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Empty state
  Widget _buildEmptyMessage(String title, String description) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          description,
          textAlign: TextAlign.center,
          style: const TextStyle(color: secondaryTextColor),
        ),
      ],
    );
  }
}
