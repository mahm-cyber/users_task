import 'package:flutter/material.dart';
import 'package:users/core/utils/responsive_builder.dart';
import 'package:users/core/widgets/core_svg_icons.dart';
import 'package:users/features/trips/domain/entities/trip.dart';
import 'package:users/features/trips/presentation/widgets/trip_card_footer.dart';
import 'package:users/features/trips/presentation/widgets/trip_card_image.dart';

class ItemCard extends StatelessWidget {
  final Trip item;

  const ItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF171717),
        borderRadius: BorderRadius.circular(16),
      ),
      clipBehavior: Clip.antiAlias,
      margin: ResponsiveBuilder.value(
        context: context,
        initial: EdgeInsets.symmetric(horizontal: 16),
        md: EdgeInsets.zero,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image section with overlay
          TripCardImage(item: item),
          // Content section
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 16, 15, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 6,
              children: [
                // Title
                Text(
                  item.title,
                  maxLines: 1,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                // Date range
                Row(
                  spacing: 6,
                  children: [
                    CoreSvgIcons.calendar(),

                    Text(
                      item.dates.formattedRangeWithNights,
                      maxLines: 2,
                      style: const TextStyle(
                        color: Color(0xFF888888),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),

                Divider(height: 12, thickness: 0.5, color: Color(0xFF262626)),
                // Avatars and tasks
                TripCardFooter(item: item),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
