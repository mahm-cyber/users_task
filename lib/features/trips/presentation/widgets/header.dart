import 'package:flutter/material.dart';

class AppHeaderContent extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const AppHeaderContent({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

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
                    color: Color(0xFFFFC268),
                  ),
                ),
                TextSpan(
                  text: '°',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.normal,
                    color: Color(0xFFFFC268),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          // Navigation items
          _buildNavItem('Items', 0),
          const SizedBox(width: 40),
          _buildNavItem('Pricing', 1),
          const SizedBox(width: 40),
          _buildNavItem('Info', 2),
          const SizedBox(width: 40),
          _buildNavItem('Tasks', 3),
          const SizedBox(width: 40),
          _buildNavItem('Analytics', 4),
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

  Widget _buildNavItem(String text, int index) {
    final isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () => onItemSelected(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Spacer(),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            height: 2,
            width: 60,
            decoration: BoxDecoration(
              color: isSelected ? Color(0xFFFFC268) : Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }
}
