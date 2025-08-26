import 'package:flutter/material.dart';
import 'package:circle_flags/circle_flags.dart';
import '../widgets/esim_plan_card.dart';

class CountryPlansScreen extends StatelessWidget {
  final String countryName;
  final String countryCode;
  final List<Map<String, String>> plans;

  const CountryPlansScreen({
    super.key,
    required this.countryName,
    required this.countryCode,
    required this.plans,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        titleSpacing: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            CircleFlag(countryCode, size: 50),
            const SizedBox(width: 10),
            Text(
              countryName,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
          ],
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: plans.length,
        separatorBuilder: (_, __) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          final plan = plans[index];
          final bool isLastCard = index == plans.length - 1;

          final bool isSaudi = countryName.toLowerCase() == 'saudi arabia';
          final bool isJordan = countryName.toLowerCase() == 'jordan';

          // Saudi Arabia (solid purple)
          final Color saudiCardColor = const Color(0xFF4B2D7F);
          final Color saudiButtonColor = const Color(0xFF5B448F);
          final Color saudiPriceTagColor = const Color(0xFFD6D6D6);
          final Color saudiTitleColor = Colors.white;

          // Jordan (gradient like screenshot)
          final Gradient jordanGradient = const LinearGradient(
colors: [
  Color(0xFF6157A6), // dark purple (left)
  Color(0xFF4C8DF5), // bright blue (middle)
  Color(0xFF2FBFBE), // teal (right)
],
stops: [0.0, 0.5, 1.0],
begin: Alignment.centerLeft,
end: Alignment.centerRight ,


          );
          final Color jordanButtonColor = Colors.white.withOpacity(0.2);
          final Color jordanPriceTagColor = const Color(0xFFEADBC8);
          final Color jordanTitleColor = Colors.white;

          return EsimPlanCard(
            title: plan['title']!,
            price: plan['price']!,
            coverage: countryName,
            data: plan['data']!,
            validity: plan['validity']!,
            bonus: plan['bonus'],
            isLast: isLastCard,
            onBuy: () {
              // TODO: Handle Buy Now
            },

            // Jordan uses gradient, Saudi uses solid
            cardColor: isSaudi ? saudiCardColor : Colors.transparent,
            cardGradient: isJordan ? jordanGradient : null,
          buttonColor: isJordan 
    ? (isLastCard ? Colors.white : jordanButtonColor)
    : (isLastCard ? Colors.white : saudiButtonColor),
            priceTagColor: isJordan ? jordanPriceTagColor : saudiPriceTagColor,
            titleColor: isJordan ? jordanTitleColor : saudiTitleColor,
            buttonTextColor: isJordan 
    ? (isLastCard ? Colors.black : Colors.white)
    : (isLastCard ? Colors.black : Colors.white),
          );
        },
      ),
    );
  }
}
