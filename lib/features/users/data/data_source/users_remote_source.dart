import 'package:users/core/network/dio_service.dart';
import 'package:users/features/users/data/models/user_model.dart';
import 'package:users/features/users/data/models/user_response.dart';
import 'package:users/features/users/data/models/users_response.dart';

class UsersRemoteSource {
  final DioService _dio;

  UsersRemoteSource(this._dio);

  Future<UsersResponse> getUsers({int? page}) async {
    try {
      final response = await _dio.get(
        '/users',
        queryParameters: {'page': page},
      );
      print('Response ${response.runtimeType}');
      print('Data2 ${response.data.runtimeType}');
      final UsersResponse usersResponse = UsersResponse.fromJson(response.data);

      return usersResponse;
    } catch (e) {
      print('Current Error 1 $e');
      rethrow;
    }
  }

  Future<UserModel?> getUser({required int id}) async {
    try {
      final response = await _dio.get('/users/$id');
      final UserResponse userResponse = UserResponse.fromJson(response.data);

      return userResponse.user;
    } catch (e) {
      rethrow;
    }
  }
}
