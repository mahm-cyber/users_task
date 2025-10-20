import 'package:users/features/users/domain/entities/user.dart';
import 'package:users/features/users/domain/entities/user_pagination.dart';

abstract class UsersRepository {
  Future<UserPagination> getUsers({int? page});
  Future<User?> getUser({required int id});
}
