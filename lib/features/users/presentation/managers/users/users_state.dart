part of 'users_bloc.dart';

sealed class UsersListStatus extends Equatable {
  const UsersListStatus();

  @override
  List<Object> get props => [];
}

final class UsersListInitial extends UsersListStatus {
  const UsersListInitial();
}

final class UsersListLoading extends UsersListStatus {
  const UsersListLoading();
}

final class UsersListLoaded extends UsersListStatus {
  final UserPagination users;
  const UsersListLoaded(this.users);

  @override
  List<Object> get props => [users];
}

final class UsersListEmpty extends UsersListStatus {
  const UsersListEmpty();
}

final class UsersListLoadMore extends UsersListStatus {
  final bool hasNextPage;
  final UserPagination users;

  const UsersListLoadMore(this.hasNextPage, this.users);

  @override
  List<Object> get props => [hasNextPage, users];
}

final class UsersListError extends UsersListStatus {
  const UsersListError();
}

class UsersState extends Equatable {
  final UsersListStatus status;

  const UsersState({this.status = const UsersListInitial()});

  UsersState copyWith({
    UsersListStatus? status,
    bool? hasReachedMax,
    int? nextPage,
  }) {
    return UsersState(status: status ?? this.status);
  }

  @override
  List<Object> get props => [status];
}
