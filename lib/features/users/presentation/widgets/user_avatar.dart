import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({
    super.key,
    required this.avatarSize,
    required this.avatarUrl,
  });

  final double avatarSize;
  final String avatarUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: avatarSize,
      height: avatarSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [Colors.blueAccent.withValues(alpha:0.12), Colors.purpleAccent.withValues(alpha:0.08)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: ClipOval(
        child: CachedNetworkImage(
          imageUrl: avatarUrl,
          fit: BoxFit.cover,
          width: avatarSize,
          height: avatarSize,
          placeholder: (ctx, url) => Container(
            color: Colors.grey.shade200,
            child: Center(
              child: Icon(
                Icons.person,
                size: avatarSize * 0.45,
                color: Colors.grey.shade400,
              ),
            ),
          ),
          errorWidget: (ctx, url, err) => Container(
            color: Colors.grey.shade200,
            child: Center(
              child: Icon(
                Icons.broken_image,
                size: avatarSize * 0.45,
                color: Colors.grey.shade400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
