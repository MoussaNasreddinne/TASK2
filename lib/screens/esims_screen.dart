import 'package:flutter/material.dart';
import '../constants.dart';
import 'notifications_screen.dart';
import 'package:provider/provider.dart';
import '../providers/navigation_provider.dart';

class EsimsScreen extends StatefulWidget {
  const EsimsScreen({super.key});

  @override
  State<EsimsScreen> createState() => _EsimsScreenState();
}

class _EsimsScreenState extends State<EsimsScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: const Text(
          'My eSIMs',
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
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            // Change center dynamically based on selected tab
            center: _selectedIndex == 0
                ? const Alignment(0.9, 0)     // Current eSIMs
                : const Alignment(0.8, 0.7),  // Finished eSIMs (shifted lower right)
            radius: 0.3,
            colors: const [
              Color.fromRGBO(65, 95, 62, 0.6),
              Color.fromRGBO(10, 10, 10, 1.0),
            ],
            stops: const [0.0, 1.0],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Container(
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
              const Spacer(),
              if (_selectedIndex == 0)
                Column(
                  children: const [
                    Text(
                      'No Active eSIMs',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Looks like you don't have any active eSIMs. Discover the convenience of digital SIM cards for your device.",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: secondaryTextColor),
                    ),
                  ],
                )
              else
                Column(
                  children: const [
                    Text(
                      'No Archived eSIMs',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Looks like you don't have any archived eSIMs. Discover the convenience of digital SIM cards for your device.",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: secondaryTextColor),
                    ),
                  ],
                ),
              const SizedBox(height: 30),
              ElevatedButton(
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
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

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
}
