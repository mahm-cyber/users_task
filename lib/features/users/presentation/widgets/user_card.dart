import 'package:flutter/material.dart'; 
import 'package:users/features/users/presentation/widgets/user_avatar.dart';
import 'package:users/features/users/presentation/widgets/user_email.dart';
import 'package:users/features/users/presentation/widgets/user_name.dart';

class UserCard extends StatelessWidget {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatarUrl;
  final VoidCallback? onTap;
  const UserCard({
    super.key,
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatarUrl,
    this.onTap,
  });

  String get fullName => '$firstName $lastName';

  @override
  Widget build(BuildContext context) {
    final double avatarSize = 64;
    final double spacing = 8;
    BorderRadius radius() => BorderRadius.circular(16);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: radius(),
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(spacing),
          decoration: BoxDecoration(
            borderRadius: radius(),
            gradient: LinearGradient(
              colors: [Colors.white, Colors.grey.shade50],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.06),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
            border: Border.all(color: Colors.grey.shade100),
          ),
          child: Row(
            children: [
              UserAvatar(avatarSize: avatarSize, avatarUrl: avatarUrl),

              SizedBox(width: spacing),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    UserName(fullName: fullName),

                    const SizedBox(height: 6),

                    UserEmail(email: email),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
