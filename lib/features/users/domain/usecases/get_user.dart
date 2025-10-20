import 'package:users/features/users/domain/entities/user.dart';
import 'package:users/features/users/domain/repositories/users_repository.dart';

class GetUserUsecase {
  final UsersRepository _usersRepository;

  GetUserUsecase(this._usersRepository);

  Future<User> call({required int id}) async {
    try {
      final user = await _usersRepository.getUser(id: id);
      if (user == null) {
        throw Exception('User not found');
      }
      return user;
    } catch (e) {
      rethrow;
    }
  }
}
