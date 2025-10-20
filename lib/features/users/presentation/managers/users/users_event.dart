part of 'users_bloc.dart';

sealed class UsersEvent extends Equatable {
  const UsersEvent();

  @override
  List<Object> get props => [];
}

final class UsersFetched extends UsersEvent {
  const UsersFetched();
}

final class UsersLoadMore extends UsersEvent {
  const UsersLoadMore();
}
