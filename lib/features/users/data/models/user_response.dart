import 'package:users/features/users/data/models/user_model.dart';

class UserResponse {
  UserResponse({required this.user});

  final UserModel? user;

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      user: json["data"] == null ? null : UserModel.fromJson(json["data"]),
    );
  }
}
