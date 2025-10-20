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
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          UsersBloc(GetUsersUsecase(di()))..add(const UsersFetched()),
      child: Scaffold(backgroundColor: Colors.grey.shade50, body: UsersBody()),
    );
  }
}

class UsersBody extends StatefulWidget {
  const UsersBody({super.key});

  @override
  State<UsersBody> createState() => _UsersBodyState();
}

class _UsersBodyState extends State<UsersBody> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.7) {
      final bloc = context.read<UsersBloc>();
      final state = bloc.state;

      if (state.status is! UsersListLoading &&
          state.status is! UsersListLoadMore) {
        bloc.add(const UsersLoadMore());
      }
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      physics: const AlwaysScrollableScrollPhysics(),
      slivers: [
        const SliverAppBar(
          title: Text('Users'),
          pinned: true,
          backgroundColor: Colors.white,
          elevation: 1,
        ),

        BlocBuilder<UsersBloc, UsersState>(
          builder: (context, state) {
            final status = state.status;

            if (status is UsersListLoading) {
              return const SliverFillRemaining(
                child: Center(child: CircularProgressIndicator()),
              );
            }

            if (status is UsersListLoaded || status is UsersListLoadMore) {
              final pagination = status is UsersListLoaded
                  ? status.users
                  : (status as UsersListLoadMore).users;

              final users = pagination.users;
              final isLoadingMore = status is UsersListLoadMore;

              return SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  if (index >= users.length) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 24),
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }

                  final user = users[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    child: UserCard(
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
                    ),
                  );
                }, childCount: users.length + (isLoadingMore ? 1 : 0)),
              );
            }

            if (status is UsersListEmpty) {
              return const SliverFillRemaining(
                child: Center(child: Text('No users found')),
              );
            }

            if (status is UsersListError) {
              return SliverFillRemaining(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Error loading users',
                        style: TextStyle(color: Colors.red),
                      ),
                      const SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () {
                          context.read<UsersBloc>().add(const UsersFetched());
                        },
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                ),
              );
            }

            return const SliverFillRemaining(
              child: Center(child: Text('No Users')),
            );
          },
        ),

        SliverToBoxAdapter(child: SizedBox(height: 300)),
      ],
    );
  }
}
