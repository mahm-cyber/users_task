import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users/core/di/di.dart';
import 'package:users/features/users/domain/usecases/get_users.dart';
import 'package:users/features/users/presentation/managers/users/users_bloc.dart';
import 'package:users/features/users/presentation/widgets/user_card.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_onScroll);
  }

  void _onScroll() {
    // trigger fetch when user scrolls near bottom
    // if (_scrollController.position.pixels >=
    //     _scrollController.position.maxScrollExtent - 200) {
    //   final bloc = context.read<UsersBloc>();
    //   if (!(bloc.state.hasReachedMax) && bloc.state.status is! UsersListLoading) {
    //     bloc.add(const UsersFetched());
    //   }
    // }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          UsersBloc(GetUsersUsecase(di()))..add(const UsersFetched()),
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        body: CustomScrollView(
          controller: _scrollController,
          slivers: [
            const SliverAppBar(title: Text('Users') ,backgroundColor: Colors.transparent,),
            BlocBuilder<UsersBloc, UsersState>(
              builder: (context, state) {
                final status = state.status;

                if (status is UsersListLoading && state.nextPage == 1) {
                  return const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else if (status is UsersListLoaded) {
                  final users = status.users;

                  return SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final user = users[index];
                      return UserCard(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/user-detail',
                            arguments: user.id,
                          );
                        },
                        id: user.id,
                        email: user.email,
                        firstName: user.firstName,
                        lastName: user.lastName,
                        avatarUrl: user.avatar,
                      );
                    }, childCount: users.length),
                  );
                } else if (status is UsersListEmpty) {
                  return const SliverFillRemaining(
                    child: Center(child: Text('No users found')),
                  );
                } else if (status is UsersListError) {
                  return const SliverFillRemaining(
                    child: Center(child: Text('Error loading users')),
                  );
                } else {
                  return const SliverFillRemaining(
                    child: Center(child: Text('No Users')),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
