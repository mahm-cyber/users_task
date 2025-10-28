import 'package:flutter/material.dart';
import 'package:users/core/widgets/core_svg_icons.dart';
import 'package:users/features/trips/domain/entities/trip.dart';
import 'package:users/features/trips/dto/mappers.dart';

class TripCardImage extends StatelessWidget {
  const TripCardImage({super.key, required this.item});

  final Trip item;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Main image
        Image.network(
          item.coverImage,
          height: 182,
          width: double.infinity,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return const Center(
              child: SizedBox(
                height: 182,
                child: Icon(Icons.image, color: Colors.white, size: 40),
              ),
            );
          },
        ),
        // Full overlay with gradient
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, const Color(0xFF171717)],
              ),
            ),
          ),
        ),
        // Three dots menu button
        Positioned(
          top: 12,
          right: 12,
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.more_horiz, color: Colors.white, size: 20),
          ),
        ),
        // Status badge
        Positioned(
          bottom: 16,
          left: 16,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: item.status.toColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: item.status.toColor, width: 1),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 6,
              children: [
                Text(
                  item.status.label,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                CoreSvgIcons.arrowDown(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
