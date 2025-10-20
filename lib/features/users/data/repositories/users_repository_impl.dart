import 'package:users/core/network/dto/user_model_to_user.dart';
import 'package:users/features/users/data/data_source/users_remote_source.dart';
import 'package:users/features/users/domain/entities/user.dart';
import 'package:users/features/users/domain/repositories/users_repository.dart';

class UsersRepositoryImpl implements UsersRepository {
  final UsersRemoteSource _remoteSource;

  UsersRepositoryImpl(this._remoteSource);

  @override
  Future<List<User>> getUsers({int? page}) async {
    final userModels = await _remoteSource.getUsers(page: page);
    return userModels.toUserList();
  }

  @override
  Future<User?> getUser({required int id}) async {
    final userModel = await _remoteSource.getUser(id: id);
    return userModel?.toUser();
  }
}
