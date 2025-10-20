part of 'user_cubit.dart';
 

/// Represents the various loading states of a single user data fetch.
sealed class UserDataStatus extends Equatable {
  const UserDataStatus();

  @override
  List<Object?> get props => [];
}

/// Initial idle state (before any fetch)
final class UserDataInit extends UserDataStatus {
  const UserDataInit();
}

/// Loading state while fetching user data
final class UserDataLoading extends UserDataStatus {
  const UserDataLoading();
}

/// Successfully loaded user data
final class UserDataLoaded extends UserDataStatus {
  final User user;
  const UserDataLoaded(this.user);

  @override
  List<Object?> get props => [user];
}

/// Error state in case fetching fails
final class UserDataError extends UserDataStatus {
  final String message;
  const UserDataError(this.message);

  @override
  List<Object?> get props => [message];
}

class UserState extends Equatable {
  final UserDataStatus status;

  /// You might want to keep user data directly here
  /// for quick access even across rebuilds
  final User? user;

  const UserState({
    this.status = const UserDataInit(),
    this.user,
  });

  UserState copyWith({
    UserDataStatus? status,
    User? user,
  }) {
    return UserState(
      status: status ?? this.status,
      user: user ?? this.user,
    );
  }

  @override
  List<Object?> get props => [status, user];
}
