import 'package:flutter/material.dart'; 
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users/core/di/di.dart';
import 'package:users/features/users/domain/usecases/get_user.dart';
import 'package:users/features/users/presentation/managers/user/user_cubit.dart';
import 'package:users/features/users/presentation/widgets/user_avatar.dart';

class UserDetailsScreen extends StatelessWidget {
  const UserDetailsScreen({super.key, required this.userId});
  final int userId;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocProvider(
      create: (context) => UserCubit(GetUserUsecase(di()))..fetchUser(userId),
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text('User Details'),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
              gradient: LinearGradient(
                colors: [Colors.white, Colors.grey.shade100],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.08),
                  blurRadius: 16,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: BlocBuilder<UserCubit, UserState>(
              builder: (context, state) {
                final status = state.status;
                if (status is UserDataLoading) {
                  return Center(child: CircularProgressIndicator());
                }

                if (status is UserDataError) {
                  return Center(child: Text('Error loading user'));
                }
                if (status is UserDataLoaded) {
                  final user = status.user;
                  final avatarUrl = user.avatar;
                  final fullName = user.fullName;
                  final email = user.email;
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      /// Avatar with subtle animation & rounded border
                      Hero(
                        tag: avatarUrl,
                        child: UserAvatar(
                          avatarSize: 120,
                          avatarUrl: avatarUrl,
                        ),
                      ),

                      const SizedBox(height: 20),

                   
                      Text(
                        fullName,
                        style: theme.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),

                      const SizedBox(height: 8),
 
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.email_outlined,
                            size: 18,
                            color: Colors.grey,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            email,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: Colors.grey.shade700,
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                }
                return SizedBox.shrink();
              },
            ),
          ),
        ),
      ),
    );
  }
}
