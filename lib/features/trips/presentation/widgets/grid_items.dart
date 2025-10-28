import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users/core/utils/responsive_builder.dart';
import 'package:users/core/widgets/core_svg_icons.dart';
import 'package:users/features/trips/domain/entities/trip.dart';
import 'package:users/features/trips/presentation/cubit/trips_cubit.dart';

class ItemsGrid extends StatelessWidget {
  const ItemsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TripsCubit, TripsState>(
      builder: (context, state) {
        final items = state is TripsLoaded ? state.trips : [];

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: ResponsiveBuilder.value(
            context: context,
            initial: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              crossAxisCount: ResponsiveBuilder.value(
                context: context,
                initial: 1,
                md: 3,
              ),
              mainAxisExtent: 322,
            ),
            lg: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 240,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              mainAxisExtent: 322,
            ),
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ItemCard(item: items[index]);
          },
        );
      },
    );
  }
}

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
          Stack(
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
                      child: Icon(Icons.error, color: Colors.white, size: 40),
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
                  child: const Icon(
                    Icons.more_horiz,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
              // Status badge
              Positioned(
                bottom: 16,
                left: 16,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white, width: 1),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        item.status.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.white,
                        size: 16,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
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
                      style: const TextStyle(
                        color: Color(0xFF888888),
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),

                Divider(height: 12, thickness: 0.5, color: Color(0xFF262626)),
                // Avatars and tasks
                Row(
                  children: [
                    // Avatar stack
                    SizedBox(
                      width: (item.participants.length * 16) + 8.0,
                      height: 24,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          for (
                            int i = 0;
                            i < item.participants.length.clamp(0, 3);
                            i++
                          )
                            Positioned(
                              left: i * 8.0,
                              child: _buildAvatar(
                                item.participants[i].avatarUrl ?? "",
                              ),
                            ),
                          if (item.participants.length - 3 != 0 &&
                              item.participants.length > 3)
                            Positioned(
                              left: 3 * 8.0,
                              child: Container(
                                width: 24,
                                height: 24,
                                alignment: AlignmentGeometry.center,
                                decoration: BoxDecoration(
                                  color: Color(0xff262626),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    width: 0.6,
                                    color: Color(0xff262626),
                                  ),
                                ),
                                child: Text(
                                  '+${item.participants.length - 3}',
                                  style: const TextStyle(
                                    color: Color(0xFFFFC268),
                                    fontSize: 8.4,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),

                    const Spacer(),
                    Text(
                      '${item.unfinishedTasks} unfinished tasks',
                      style: const TextStyle(
                        color: Color(0xFF888888),
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAvatar(String url) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(width: 0.6, color: Color(0xff262626)),
      ),
      child: ClipOval(
        child: Image.network(
          url,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return const Center(
              child: Icon(Icons.person, color: Colors.white, size: 24),
            );
          },
        ),
      ),
    );
  }
}
