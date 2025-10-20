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
  final List<User> users;
  const UsersListLoaded(this.users);

  @override
  List<Object> get props => [users];
}

final class UsersListEmpty extends UsersListStatus {
  const UsersListEmpty();
}

final class UsersListLoadMore extends UsersListStatus {
   

  final List<User> users;
  const UsersListLoadMore(this.users);

  @override
  List<Object> get props => [users];
}

final class UsersListError extends UsersListStatus {
  const UsersListError();
}

class UsersState extends Equatable {
  final UsersListStatus status;
  final bool hasReachedMax;
  final int nextPage;
  const UsersState({this.status = const UsersListInitial(), this.hasReachedMax = false, this.nextPage = 1});

  UsersState copyWith({UsersListStatus? status, bool? hasReachedMax, int? nextPage}) {
    return UsersState(
      status: status ?? this.status,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      nextPage: nextPage ?? this.nextPage,
    );
  }

  @override
  List<Object> get props => [status, hasReachedMax, nextPage];
}
