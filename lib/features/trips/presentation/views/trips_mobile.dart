import 'package:flutter/material.dart';
import 'package:users/features/trips/presentation/widgets/grid_items.dart';

class TripsMobile extends StatelessWidget {
  const TripsMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: false,
            toolbarHeight: kToolbarHeight,
            backgroundColor: Colors.black,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.menu),
              color: Colors.white,
              onPressed: () {},
            ),
            title: RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'logo',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFD4A574),
                    ),
                  ),
                  TextSpan(
                    text: '°',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.normal,
                      color: Color(0xFFD4A574),
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.settings_outlined),
                color: Colors.white,
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.notifications_outlined),
                color: Colors.white,
                onPressed: () {},
              ),
              VerticalDivider(endIndent: 16, indent: 16),
              Padding(
                padding: const EdgeInsets.only(right: 16, left: 8),
                child: CircleAvatar(
                  radius: 18,
                  backgroundImage: const NetworkImage(
                    'https://i.pravatar.cc/150?img=12',
                  ),
                ),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Items',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1a1a1a),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.tune,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),

          SliverToBoxAdapter(child: const ItemsGrid()),
        ],
      ),
    );
  }
}
