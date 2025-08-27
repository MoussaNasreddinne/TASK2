import 'package:flutter/material.dart';
import 'esim_card_widget.dart';

class ActiveEsimsWidget extends StatelessWidget {
  const ActiveEsimsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.circle, color: Colors.green, size: 10),
              SizedBox(width: 6),
              Text(
                'Active (1)',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 10),
          EsimCardWidget(
            providerColor: Colors.blue.shade900,
            providerName: 'Zain',
            esimName: 'Zain eSIM',
            price: '3.0\$',
            onTopUp: () {},
            onViewPlan: () {},
          ),
          const SizedBox(height: 20),
          Row(
            children: const [
              Icon(Icons.circle, color: Colors.red, size: 10),
              SizedBox(width: 6),
              Text(
                'Not Active (0)',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
