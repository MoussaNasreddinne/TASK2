import 'package:flutter/material.dart';
import '../constants.dart';
import '../widgets/_build_country_card.dart';
import '../widgets/_build_regional_card.dart';
import '../widgets/_build_global_card.dart';
import '../widgets/hello_app_bar.dart';
import '../widgets/custom_search_bar.dart';
import '../widgets/segmented_tabs.dart';
import 'country_plans_screen.dart';
import 'ops_screen.dart';
import '../app_data.dart'; // Import the new data file
import 'ExclusiveDealsScreen.dart';

class HelloScreen extends StatefulWidget {
  const HelloScreen({super.key});

  @override
  State<HelloScreen> createState() => _HelloScreenState();
}

class _HelloScreenState extends State<HelloScreen> {
  String _selectedTab = 'Country';
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final currentData = AppData.sectionData[_selectedTab] ?? [];
    final filteredData = currentData.where((data) {
      final name = data['name']!.toLowerCase();
      return name.contains(_searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: const HelloAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            GestureDetector(
  onTap: () {
   showExclusiveDealsScreen(context);
  },
  child: ClipRRect(
    borderRadius: BorderRadius.circular(20),
    child: Image.asset(
      'assets/image1.png',
      fit: BoxFit.cover,
    ),
  ),
),
            const SizedBox(height: 20),
            SegmentedTabs(
              selectedTab: _selectedTab,
              onTabSelected: (tab) {
                setState(() {
                  _selectedTab = tab;
                  _searchQuery = ''; // Clear search when tab changes
                });
              },
            ),
            const SizedBox(height: 15),
            if (_selectedTab != 'Global')
              CustomSearchBar(
                onChanged: (val) {
                  setState(() {
                    _searchQuery = val;
                  });
                },
              ),
            const SizedBox(height: 20),
            _buildListSection(filteredData),
          ],
        ),
      ),
    );
  }

  Widget _buildListSection(List<Map<String, dynamic>> data) {
    String title;
    Widget Function(Map<String, dynamic>) cardBuilder;
    
    switch (_selectedTab) {
      case 'Country':
        title = 'Popular Countries';
        cardBuilder = (data) => BuildCountryCard(name: data['name']!, plans: data['plans']!, countryCode: data['code']!);
        break;
      case 'Regional':
        title = 'Browse Plans By Continent';
        cardBuilder = (data) => BuildRegionalCard(name: data['name']!, plans: data['plans']!, icon: data['icon']!);
        break;
      case 'Global':
        title = 'Global Plans';
        cardBuilder = (data) => BuildGlobalCard(name: data['name']!, plans: data['plans']!);
        break;
      default:
        return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 10),
        ...data.map((data) {
          return GestureDetector(
            onTap: () => _handleTap(data),
            child: cardBuilder(data),
          );
        }).toList(),
      ],
    );
  }

  void _handleTap(Map<String, dynamic> data) {
    if (data.containsKey('route')) {
      final route = data['route'];
      final plans = AppData.planData[route]; // Access data from AppData
      if (plans != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => CountryPlansScreen(
              countryName: data['name']!,
              countryCode: data['code']!,
              plans: plans,
            ),
          ),
        );
      } else {
        showOopsScreen(context);
      }
    } else {
      showOopsScreen(context);
    }
  }
}