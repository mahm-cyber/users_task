import 'package:flutter/material.dart';
import 'package:users/features/trips/domain/entities/trip.dart';
import 'package:users/features/trips/presentation/widgets/participant_avatar.dart';

class TripCardFooter extends StatelessWidget {
  const TripCardFooter({super.key, required this.item});

  final Trip item;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Avatar stack
        SizedBox(
          width: (item.participants.length * 16),
          height: 24,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              for (int i = 0; i < item.participants.length.clamp(0, 3); i++)
                Positioned(
                  left: i * 8.0,
                  child: ParticipantAvatar(
                    url: item.participants[i].avatarUrl ?? "",
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
                      border: Border.all(width: 0.6, color: Color(0xff262626)),
                    ),
                    child: Text(
                      '+${item.participants.length - 3}',
                      style: const TextStyle(
                        color: Color(0xFFFFC268),
                        fontSize: 8.4,
                        fontFamily: 'Inter',
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),

        Text(
          '${item.unfinishedTasks} unfinished tasks',
          maxLines: 2,
          style: const TextStyle(color: Color(0xFF888888), fontSize: 12),
        ),
      ],
    );
  }
}
