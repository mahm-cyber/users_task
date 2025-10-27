import 'package:flutter/material.dart';
import 'package:users/core/utils/responsive_builder.dart';
import 'package:users/core/widgets/core_svg_icons.dart';

class ItemsGrid extends StatelessWidget {
  const ItemsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      ItemData(
        image:
            'https://images.unsplash.com/photo-1518391846015-55a9cc003b25?w=800',
        status: 'Pending Approval',
        title: 'Item title',
        dateRange: 'Jan 16 - Jan 20, 2024',
        avatars: [
          'https://i.pravatar.cc/150?img=1',
          'https://i.pravatar.cc/150?img=2',
          'https://i.pravatar.cc/150?img=3',
        ],
        additionalMembers: 6,
        unfinishedTasks: 4,
      ),
      ItemData(
        image:
            'https://images.unsplash.com/photo-1514214246283-d427a95c5d2f?w=800',
        status: 'Ready for Travel',
        title: 'Long item title highlighting the main points...',
        dateRange: 'Jan 16 - Jan 20, 2024',
        avatars: [
          'https://i.pravatar.cc/150?img=1',
          'https://i.pravatar.cc/150?img=2',
          'https://i.pravatar.cc/150?img=3',
        ],
        additionalMembers: 6,
        unfinishedTasks: 4,
      ),
      ItemData(
        image:
            'https://images.unsplash.com/photo-1518391846015-55a9cc003b25?w=800',
        status: 'Proposal sent',
        title: 'Item title',
        avatars: [
          'https://i.pravatar.cc/150?img=1',
          'https://i.pravatar.cc/150?img=2',
          'https://i.pravatar.cc/150?img=3',
        ],
        additionalMembers: 6,
        unfinishedTasks: 4,
        dateRange: 'Jan 16 - Jan 20, 2024',
      ),
      ItemData(
        image:
            'https://images.unsplash.com/photo-1559827260-dc66d52bef19?w=800',
        status: 'Pending Approval',
        title: 'Item title',
        dateRange: 'Jan 16 - Jan 20, 2024',
        avatars: [
          'https://i.pravatar.cc/150?img=1',
          'https://i.pravatar.cc/150?img=2',
          'https://i.pravatar.cc/150?img=3',
        ],
        additionalMembers: 6,
        unfinishedTasks: 4,
      ),
      ItemData(
        image:
            'https://images.unsplash.com/photo-1518391846015-55a9cc003b25?w=800',
        status: 'Pending Approval',
        title: 'Item title',
        avatars: [
          'https://i.pravatar.cc/150?img=1',
          'https://i.pravatar.cc/150?img=2',
          'https://i.pravatar.cc/150?img=3',
        ],
        additionalMembers: 6,
        unfinishedTasks: 4,
        dateRange: 'Jan 16 - Jan 20, 2024',
      ),
      ItemData(
        image:
            'https://images.unsplash.com/photo-1518391846015-55a9cc003b25?w=800',
        status: 'Pending Approval',
        title: 'Item title',
        avatars: [
          'https://i.pravatar.cc/150?img=1',
          'https://i.pravatar.cc/150?img=2',
          'https://i.pravatar.cc/150?img=3',
        ],
        additionalMembers: 6,
        unfinishedTasks: 4,
        dateRange: 'Jan 16 - Jan 20, 2024',
      ),
      ItemData(
        image:
            'https://images.unsplash.com/photo-1514214246283-d427a95c5d2f?w=800',
        status: 'Pending Approval',
        title: 'Item title',
        avatars: [
          'https://i.pravatar.cc/150?img=1',
          'https://i.pravatar.cc/150?img=2',
          'https://i.pravatar.cc/150?img=3',
        ],
        additionalMembers: 6,
        unfinishedTasks: 4,
        dateRange: 'Jan 16 - Jan 20, 2024',
      ),
      ItemData(
        image:
            'https://images.unsplash.com/photo-1518391846015-55a9cc003b25?w=800',
        status: 'Pending Approval',
        title: 'Item title',
        avatars: [
          'https://i.pravatar.cc/150?img=1',
          'https://i.pravatar.cc/150?img=2',
          'https://i.pravatar.cc/150?img=3',
        ],
        additionalMembers: 6,
        unfinishedTasks: 4,
        dateRange: 'Jan 16 - Jan 20, 2024',
      ),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: ResponsiveBuilder.value(
          context: context,
          initial: 343,
          md: 240,
        ),
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        mainAxisExtent: ResponsiveBuilder.value(
          context: context,
          initial: 314,
          md: 322,
        ),
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ItemCard(item: items[index]);
      },
    );
  }
}

class ItemCard extends StatelessWidget {
  final ItemData item;

  const ItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF171717),
        borderRadius: BorderRadius.circular(16),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image section with overlay
          Stack(
            children: [
              // Main image
              Image.network(
                item.image,
                height: 182,
                width: double.infinity,
                fit: BoxFit.cover,
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
                        item.status,
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
                      item.dateRange,
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
                      width: (item.avatars.length * 16) + 8.0,
                      height: 24,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          for (int i = 0; i < item.avatars.length; i++)
                            Positioned(
                              left: i * 8.0,
                              child: _buildAvatar(item.avatars[i]),
                            ),
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
                                '+${item.additionalMembers}',
                                style: const TextStyle(
                                  color: Color(0xFF888888),
                                  fontSize: 13,
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
          'https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=1470',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class ItemData {
  final String image;
  final String status;
  final String title;
  final String dateRange;
  final List<String> avatars;
  final int additionalMembers;
  final int unfinishedTasks;

  ItemData({
    required this.image,
    required this.status,
    required this.title,
    required this.dateRange,
    required this.avatars,
    required this.additionalMembers,
    required this.unfinishedTasks,
  });
}
