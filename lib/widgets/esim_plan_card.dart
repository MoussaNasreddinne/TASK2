import 'package:flutter/material.dart';

class EsimPlanCard extends StatelessWidget {
  final String title;
  final String price;
  final String coverage;
  final String data;
  final String validity;
  final String? bonus;
  final VoidCallback onBuy;
  final bool isLast;

  // Color customization
  final Color cardColor;
  final Gradient? cardGradient;
  final Color buttonColor;
  final Color buttonTextColor;
  final Color priceTagColor;
  final Color titleColor;

  const EsimPlanCard({
    super.key,
    required this.title,
    required this.price,
    required this.coverage,
    required this.data,
    required this.validity,
    required this.onBuy,
    this.bonus,
    this.isLast = false,
    this.cardColor = const Color(0xFF4B2D7F),
    this.cardGradient,
    this.buttonColor = const Color(0xFF5B448F),
    this.buttonTextColor = Colors.white,
    this.priceTagColor = const Color(0xFFD6D6D6),
    this.titleColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: isLast ? const EdgeInsets.only(bottom: 24) : EdgeInsets.zero,
      decoration: BoxDecoration(
        color: cardGradient == null ? cardColor : null,
        gradient: cardGradient,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [Colors.white, Colors.white.withOpacity(0.8)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.4),
                          blurRadius: 6,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(2),
                    child: const CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 18,
                      child: Icon(Icons.sim_card, color: Colors.black, size: 20),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    title,
                    style: TextStyle(
                      color: titleColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: priceTagColor,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 4,
                      offset: const Offset(1, 2),
                    ),
                  ],
                ),
                child: Text(
                  price,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),
          _buildDetail('Coverage', coverage),
          const SizedBox(height: 8),
          _buildDetail('Data', data),
          const SizedBox(height: 8),
          _buildDetail('Validity', validity),
          const SizedBox(height: 20),

          // Buy button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onBuy,
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(vertical: 14),
                elevation: 8,
                side: BorderSide(
                  color: Colors.white,
                  width: isLast ? 2 : 1.5,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Buy Now',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: buttonTextColor,
                    ),
                  ),
                  if (bonus != null) ...[
                    const SizedBox(width: 6),
                    Text(
                      '+ $bonus',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: buttonTextColor,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetail(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label.toUpperCase(),
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 13,
            letterSpacing: 0.5,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}
