import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'constants.dart';
import 'providers/navigation_provider.dart';
import 'screens/hello_screen.dart';
import 'screens/esims_screen.dart';
import 'screens/profile_screen.dart';
import 'widgets/_build_nav_item.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => NavigationProvider(),
      child: const EsimApp(),
    ),
  );
}

class EsimApp extends StatelessWidget {
  const EsimApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: backgroundColor,
        fontFamily: 'Montserrat',
        brightness: Brightness.dark,
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  static final List<Widget> _screens = [
    const HelloScreen(),   // Index 0
    const EsimsScreen(),   // Index 1
    const ProfileScreen(), // Index 2
  ];

  @override
  Widget build(BuildContext context) {
    final navProvider = Provider.of<NavigationProvider>(context);

    return Scaffold(
      body: _screens[navProvider.currentIndex],
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BuildNavItem(context, Icons.store, 'Store', 0),
            BuildNavItem(context, Icons.sim_card, 'eSIMs', 1),
            BuildNavItem(context, Icons.person, 'Profile', 2),
          ],
        ),
      ),
    );
  }
}
