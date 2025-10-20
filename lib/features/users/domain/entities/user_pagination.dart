import 'package:equatable/equatable.dart';
import 'package:users/features/users/domain/entities/user.dart';

class UserPagination extends Equatable {
  final int page;
  final int perPage;
  final int total;
  final int totalPages;
  final List<User> users;

  const UserPagination({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.users,
  });

  bool get hasNextPage => page < totalPages;

  UserPagination copyWith({
    int? page,
    int? perPage,
    int? total,
    int? totalPages,
    List<User>? users,
  }) {
    return UserPagination(
      page: page ?? this.page,
      perPage: perPage ?? this.perPage,
      total: total ?? this.total,
      totalPages: totalPages ?? this.totalPages,
      users: users ?? this.users,
    );
  }

  @override
  List<Object?> get props => [page, perPage, total, totalPages, users];
}
