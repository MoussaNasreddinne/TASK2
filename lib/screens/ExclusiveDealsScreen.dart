import 'package:flutter/material.dart';

void showExclusiveDealsScreen(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return FractionallySizedBox(
        heightFactor: 0.95, // same height as Oops screen
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: SafeArea(
            top: false,
            child: Stack(
              children: [
                // Close button at top-right
                Positioned(
                  top: 16,
                  right: 16,
                  child: IconButton(
                    icon: const Icon(Icons.close, color: Colors.black, size: 28),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),

                // Main content
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 60), // space for close button
                      const Text(
                        'Exclusive Deals',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 30),

                      _buildDealCard(
                        color: Colors.deepPurple,
                        title: 'Get 3 GB Free',
                        subtitle1: 'With each purchase of the ',
                        boldPart: 'STC 7 GB Plan',
                        subtitle2: ' in Saudi Arabia',
                        hasDot: true,
                      ),
                      const SizedBox(height: 12),
                      _buildDealCard(
                        color: Colors.teal,
                        title: 'Get 10 Days Free',
                        subtitle1: 'With each purchase of the ',
                        boldPart: 'Zain 3 GB Plan',
                        subtitle2: ' in Jordan',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

Widget _buildDealCard({
  required Color color,
  required String title,
  required String subtitle1,
  required String boldPart,
  required String subtitle2,
  bool hasDot = false,
}) {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Color(0xFFF0F0F0),
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: Colors.grey.shade300),
      boxShadow: [
        BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
      ],
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Leading square color box
        Container(
          width: 48,
          height: 60,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        const SizedBox(width: 12),

        // Title and subtitle
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  if (hasDot)
                    const Padding(
                      padding: EdgeInsets.only(left: 6.0),
                      child: Icon(Icons.circle, size: 8, color: Colors.red),
                    ),
                ],
              ),
              const SizedBox(height: 4),
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 13,
                  ),
                  children: [
                    TextSpan(text: subtitle1),
                    TextSpan(
                      text: boldPart,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: subtitle2),
                  ],
                ),
              ),
            ],
          ),
        ),

        const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black54),
      ],
    ),
  );
}
