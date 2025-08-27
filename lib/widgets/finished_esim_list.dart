import 'package:flutter/material.dart';
import 'esim_card_widget.dart';

class FinishedEsimsWidget extends StatelessWidget {
  const FinishedEsimsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              SizedBox(width: 6),
              Text(
                'Feb 19, 2024',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 10),
          EsimCardWidget(
            providerColor: Colors.deepPurple.shade800,
            providerName: 'STC',
            esimName: 'STC eSIM',
            price: '5.0\$',
            onTopUp: () {},
            onViewPlan: () {},
          ),
        ],
      ),
    );
  }
}
