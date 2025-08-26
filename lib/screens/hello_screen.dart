import 'package:flutter/material.dart';
import '../constants.dart';
import '../widgets/_build_country_card.dart';
import '../widgets/_build_regional_card.dart';
import '../widgets/_build_global_card.dart';
import 'country_plans_screen.dart';
import 'notifications_screen.dart';
import 'ops_screen.dart'; // contains showOopsScreen(context)

class HelloScreen extends StatefulWidget {
  const HelloScreen({super.key});

  @override
  State<HelloScreen> createState() => _HelloScreenState();
}

class _HelloScreenState extends State<HelloScreen> {
  String _selectedTab = 'Country';
  String _searchQuery = '';

  final List<Map<String, String>> _regionalData = [
    {'name': 'Asia', 'plans': '7 Plans', 'icon': '🗺️'},
    {'name': 'Africa', 'plans': '5 Plans', 'icon': '🌍'},
    {'name': 'North America', 'plans': '9 Plans', 'icon': '🌎'},
    {'name': 'South America', 'plans': '3 Plans', 'icon': '🌎'},
    {'name': 'Antarctica', 'plans': '5 Plans', 'icon': '🧊'},
    {'name': 'Europe', 'plans': '8 Plans', 'icon': '🌍'},
    {'name': 'Australia', 'plans': '4 Plans', 'icon': '🇦🇺'},
    {'name': 'Middle East', 'plans': '6 Plans', 'icon': '🐪'},
  ];

  final List<Map<String, String>> _countryData = [
    {'name': 'Saudi Arabia', 'plans': '4 Plans Available', 'code': 'sa'},
    {'name': 'Jordan', 'plans': '3 Plans Available', 'code': 'jo'},
    {'name': 'United Arab Emirates', 'plans': '7 Plans Available', 'code': 'ae'},
    {'name': 'Iraq', 'plans': '3 Plans Available', 'code': 'iq'},
    {'name': 'Oman', 'plans': '5 Plans Available', 'code': 'om'},
    {'name': 'Syria', 'plans': '2 Plans Available', 'code': 'sy'},
    {'name': 'Egypt', 'plans': '6 Plans Available', 'code': 'eg'},
    {'name': 'Lebanon', 'plans': '2 Plans Available', 'code': 'lb'},
    {'name': 'Qatar', 'plans': '4 Plans Available', 'code': 'qa'},
    {'name': 'Kuwait', 'plans': '3 Plans Available', 'code': 'kw'},
    {'name': 'Bahrain', 'plans': '2 Plans Available', 'code': 'bh'},
    {'name': 'Turkey', 'plans': '5 Plans Available', 'code': 'tr'},
    {'name': 'Morocco', 'plans': '4 Plans Available', 'code': 'ma'},
    {'name': 'Algeria', 'plans': '3 Plans Available', 'code': 'dz'},
    {'name': 'Tunisia', 'plans': '2 Plans Available', 'code': 'tn'},
    {'name': 'Libya', 'plans': '2 Plans Available', 'code': 'ly'},
    {'name': 'Yemen', 'plans': '2 Plans Available', 'code': 'ye'},
    {'name': 'Pakistan', 'plans': '6 Plans Available', 'code': 'pk'},
    {'name': 'India', 'plans': '10 Plans Available', 'code': 'in'},
    {'name': 'Bangladesh', 'plans': '4 Plans Available', 'code': 'bd'},
    {'name': 'Nepal', 'plans': '2 Plans Available', 'code': 'np'},
    {'name': 'Sri Lanka', 'plans': '3 Plans Available', 'code': 'lk'},
    {'name': 'Maldives', 'plans': '2 Plans Available', 'code': 'mv'},
    {'name': 'Indonesia', 'plans': '8 Plans Available', 'code': 'id'},
    {'name': 'Malaysia', 'plans': '7 Plans Available', 'code': 'my'},
    {'name': 'Singapore', 'plans': '5 Plans Available', 'code': 'sg'},
    {'name': 'Thailand', 'plans': '6 Plans Available', 'code': 'th'},
    {'name': 'Vietnam', 'plans': '4 Plans Available', 'code': 'vn'},
    {'name': 'Philippines', 'plans': '5 Plans Available', 'code': 'ph'},
    {'name': 'South Korea', 'plans': '7 Plans Available', 'code': 'kr'},
  ];

  final List<Map<String, String>> _globalData = [
    {'name': 'Global', 'plans': '20 Plans'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
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
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/image1.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildSegmentedTabs(),
                  const SizedBox(height: 15),

                  // Search bar is hidden when Global tab is active
                  if (_selectedTab != 'Global')
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF3A3A3A),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextField(
                        onChanged: (val) {
                          setState(() {
                            _searchQuery = val;
                          });
                        },
                        decoration: const InputDecoration(
                          hintText: 'Search for your destination',
                          hintStyle: TextStyle(color: secondaryTextColor),
                          prefixIcon: Icon(Icons.search, color: Colors.white),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                        ),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),

                  const SizedBox(height: 20),
                  if (_selectedTab == 'Country') ..._buildCountrySection()
                  else if (_selectedTab == 'Regional') ..._buildRegionalSection()
                  else if (_selectedTab == 'Global') ..._buildGlobalSection(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildCountrySection() {
    final filtered = _countryData.where((data) {
      return data['name']!.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();

    return [
      const Text(
        'Popular Countries',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      const SizedBox(height: 10),
      ...filtered.map((data) {
        return GestureDetector(
          onTap: () {
            if (data['name'] == 'Saudi Arabia') {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CountryPlansScreen(
                    countryName: 'Saudi Arabia',
                    countryCode: 'sa',
                    plans: [
                      {
                        'title': 'STC eSIM',
                        'price': '\$4.5',
                        'data': '1 GB',
                        'validity': '7 Days',
                      },
                      {
                        'title': 'STC eSIM',
                        'price': '\$7.0',
                        'data': '2 GB',
                        'validity': '15 Days',
                      },
                      {
                        'title': 'STC eSIM',
                        'price': '\$9.5',
                        'data': '3 GB',
                        'validity': '30 Days',
                      },
                      {
                        'title': 'STC eSIM',
                        'price': '\$13.0',
                        'data': '7 GB',
                        'validity': '30 Days',
                        'bonus': '3 GB FREE',
                      },
                    ],
                  ),
                ),
              );
            } else if (data['name'] == 'Jordan') {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CountryPlansScreen(
                    countryName: 'Jordan',
                    countryCode: 'jo',
                    plans: [
                      {
                        'title': 'Zain eSIM',
                        'price': '\$3.0',
                        'data': '1 GB',
                        'validity': '7 Days',
                      },
                      {
                        'title': 'Zain eSIM',
                        'price': '\$6.0',
                        'data': '2 GB',
                        'validity': '15 Days',
                      },
                      {
                        'title': 'Zain eSIM',
                        'price': '\$7.5',
                        'data': '3 GB',
                        'validity': '30 Days',
                        'bonus': '10 Days FREE'
                      },
                    ],
                  ),
                ),
              );
            }
          },
          child: BuildCountryCard(
            name: data['name']!,
            plans: data['plans']!,
            countryCode: data['code']!,
          ),
        );
      }).toList(),
    ];
  }

  List<Widget> _buildRegionalSection() {
    final filtered = _regionalData.where((data) {
      return data['name']!.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();

    return [
      const Text(
        'Browse Plans By Continent',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      const SizedBox(height: 10),
      ...filtered.map((data) {
        return GestureDetector(
          onTap: () {
            if (data['name'] == 'Asia') {
              showOopsScreen(context);
            }
          },
          child: BuildRegionalCard(
            name: data['name']!,
            plans: data['plans']!,
            icon: data['icon']!,
          ),
        );
      }).toList(),
    ];
  }

  List<Widget> _buildGlobalSection() {
    return [
      const Text(
        'Global Plans',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      const SizedBox(height: 10),
      ..._globalData.map((data) {
        return GestureDetector(
          onTap: () {
            showOopsScreen(context);
          },
          child: BuildGlobalCard(
            name: data['name']!,
            plans: data['plans']!,
          ),
        );
      }).toList(),
    ];
  }

  Widget _buildSegmentedTabs() {
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
    final bool isSelected = _selectedTab == title;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedTab = title;
          });
        },
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
