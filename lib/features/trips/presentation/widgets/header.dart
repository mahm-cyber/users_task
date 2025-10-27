import 'package:flutter/material.dart';

class AppHeaderContent extends StatelessWidget {
  const AppHeaderContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80),
      child: Row(
        children: [
          // Logo
          RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: 'logo',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFD4A574),
                  ),
                ),
                TextSpan(
                  text: '°',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.normal,
                    color: Color(0xFFD4A574),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          // Navigation items
          _buildNavItem('Items'),
          const SizedBox(width: 40),
          _buildNavItem('Pricing'),
          const SizedBox(width: 40),
          _buildNavItem('Info'),
          const SizedBox(width: 40),
          _buildNavItem('Tasks'),
          const SizedBox(width: 40),
          _buildNavItem('Analytics'),
          const SizedBox(width: 60),
          // Divider
          Container(height: 24, width: 1, color: const Color(0xFF333333)),
          const SizedBox(width: 30),
          // Settings icon
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            color: Colors.white,
            iconSize: 22,
            onPressed: () {},
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
          const SizedBox(width: 25),
          // Notification icon
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            color: Colors.white,
            iconSize: 22,
            onPressed: () {},
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
          const SizedBox(width: 30),
          // Divider
          Container(height: 24, width: 1, color: const Color(0xFF333333)),
          const SizedBox(width: 30),
          // User profile
          Row(
            children: [
              const CircleAvatar(
                radius: 18,
                backgroundImage: NetworkImage(
                  'https://i.pravatar.cc/150?img=12',
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                'John Doe',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(width: 8),
              const Icon(
                Icons.keyboard_arrow_down,
                color: Colors.white,
                size: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 15,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
