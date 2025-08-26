// app_data.dart

class AppData {
  static final Map<String, List<Map<String, dynamic>>> sectionData = {
    'Country': [
      {'name': 'Saudi Arabia', 'plans': '4 Plans Available', 'code': 'sa', 'route': 'saudi_plans'},
      {'name': 'Jordan', 'plans': '3 Plans Available', 'code': 'jo', 'route': 'jordan_plans'},
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
    ],
    'Regional': [
      {'name': 'Asia', 'plans': '7 Plans', 'icon': '🗺️'},
      {'name': 'Africa', 'plans': '5 Plans', 'icon': '🌍'},
      {'name': 'North America', 'plans': '9 Plans', 'icon': '🌎'},
      {'name': 'South America', 'plans': '3 Plans', 'icon': '🌎'},
      {'name': 'Antarctica', 'plans': '5 Plans', 'icon': '🧊'},
      {'name': 'Europe', 'plans': '8 Plans', 'icon': '🌍'},
      {'name': 'Australia', 'plans': '4 Plans', 'icon': '🇦🇺'},
      {'name': 'Middle East', 'plans': '6 Plans', 'icon': '🐪'},
    ],
    'Global': [
      {'name': 'Global', 'plans': '20 Plans'},
    ],
  };

  static final Map<String, List<Map<String, String>>> planData = {
    'saudi_plans': [
      {'title': 'STC eSIM', 'price': '\$4.5', 'data': '1 GB', 'validity': '7 Days'},
      {'title': 'STC eSIM', 'price': '\$7.0', 'data': '2 GB', 'validity': '15 Days'},
      {'title': 'STC eSIM', 'price': '\$9.5', 'data': '3 GB', 'validity': '30 Days'},
      {'title': 'STC eSIM', 'price': '\$13.0', 'data': '7 GB', 'validity': '30 Days', 'bonus': '3 GB FREE'},
    ],
    'jordan_plans': [
      {'title': 'Zain eSIM', 'price': '\$3.0', 'data': '1 GB', 'validity': '7 Days'},
      {'title': 'Zain eSIM', 'price': '\$6.0', 'data': '2 GB', 'validity': '15 Days'},
      {'title': 'Zain eSIM', 'price': '\$7.5', 'data': '3 GB', 'validity': '30 Days', 'bonus': '10 Days FREE'},
    ],
  };
}