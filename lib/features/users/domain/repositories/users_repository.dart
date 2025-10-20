import 'package:users/features/users/domain/entities/user.dart';

abstract class UsersRepository {
  Future<List<User>> getUsers({int? page});
  Future<User?> getUser({required int id});
}
