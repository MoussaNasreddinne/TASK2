import 'package:flutter/material.dart';
import '../constants.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          'Notifications',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.close, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildDateLabel("Today"),
          _buildNotificationItem(
            time: "12:51 PM",
            message: "Zain 1GB plan hit the consumption limit",
            icon: Icons.info_outline,
            iconColor: Colors.yellow,
          ),

          const SizedBox(height: 20),
          _buildDateLabel("Feb 20, 2024"),
          _buildNotificationItem(
            time: "9:05 AM",
            message: "Zain 1GB plan has been activated",
            icon: Icons.check_circle_outline,
            iconColor: Colors.green,
          ),
          _buildNotificationItem(
            time: "08:43 AM",
            message: "STC 1GB plan has expired",
            icon: Icons.cancel_outlined,
            iconColor: Colors.red,
          ),

          const SizedBox(height: 20),
          _buildDateLabel("Feb 19, 2024"),
          _buildNotificationItem(
            time: "06:17 PM",
            message: "STC 1GB plan will expire soon",
            icon: Icons.info_outline,
            iconColor: Colors.yellow,
          ),

          const SizedBox(height: 20),
          _buildDateLabel("Feb 13, 2024"),
          _buildNotificationItem(
            time: "08:43 AM",
            message: "STC 1GB plan has been activated",
            icon: Icons.check_circle_outline,
            iconColor: Colors.green,
          ),
        ],
      ),
    );
  }

  Widget _buildDateLabel(String date, {Color? dotColor}) {
    return Row(
      children: [
        Text(
          date,
          style: const TextStyle(
            color: Colors.white70,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
        if (dotColor != null) ...[
          const SizedBox(width: 8),
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: dotColor,
              shape: BoxShape.circle,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildNotificationItem({
    required String time,
    required String message,
    required IconData icon,
    required Color iconColor,
  }) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
      decoration: BoxDecoration(
        color:Color(0xFF151515),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade800, width: 0.7), // thin border
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left column: time stacked above message
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  time,
                  style: const TextStyle(
                    color: Colors.white60,
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  message,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Icon(icon, color: iconColor, size: 20),
        ],
      ),
    );
  }
}
