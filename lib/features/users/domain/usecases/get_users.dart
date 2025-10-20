import 'package:users/features/users/domain/entities/user_pagination.dart';
import 'package:users/features/users/domain/repositories/users_repository.dart';

class GetUsersUsecase {
  final UsersRepository _usersRepository;

  GetUsersUsecase(this._usersRepository);

  Future<UserPagination> call({int? page}) async {
    try {
      return await _usersRepository.getUsers(page: page);
    } catch (e) {
      print('Current Error 2 $e');
      rethrow;
    }
  }
}
