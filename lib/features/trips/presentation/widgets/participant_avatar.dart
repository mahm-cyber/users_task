import 'package:flutter/material.dart';

class ParticipantAvatar extends StatelessWidget {
  const ParticipantAvatar({super.key, required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
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
