import 'package:flutter/material.dart';
import '../constants.dart';

class BuildGlobalCard extends StatelessWidget {
  final String name;
  final String plans;

  const BuildGlobalCard({
    Key? key,
    required this.name,
    required this.plans,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF000000),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFF444444),
          width: 0.8,
        ),
      ),
      clipBehavior: Clip.hardEdge, // Ensures children stay inside border radius
      child: Stack(
        children: [
          // --- Transparent Map Image on the right ---
          Positioned.fill(
            child: Align(
              alignment: Alignment.centerRight,
              child: Image.asset(
                'assets/global_map.png',
                width: 180,
                fit: BoxFit.contain, // Keeps aspect ratio without overflow
              ),
            ),
          ),

          // --- Main label moved to top-left ---
          Positioned(
            top: 12,
            left: 20,
            child: Row(
              children: [
                // --- Fixed button with outer + inner circle ---
                Container(
                  width: 40, // slightly larger than before
                  height: 40,
                  decoration: const BoxDecoration(
                    color: Color(0xFF333333), // outer dark gray
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: const BoxDecoration(
                        color: Color(0xFF4DFF6F), // inner bright green
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    Text(
                      plans,
                      style: const TextStyle(
                        color: secondaryTextColor,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
