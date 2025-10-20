import 'package:users/features/users/domain/entities/user.dart';
import 'package:users/features/users/data/models/user_model.dart';

extension UserModelToUser on UserModel? {
  User toUser() {
    final userModel = this;
    if (userModel == null) return User.empty;
    return User(
      id: userModel.id ?? 0,
      email: userModel.email ?? '',
      firstName: userModel.firstName ?? '',
      lastName: userModel.lastName ?? '',
      avatar: userModel.avatar ?? '',
    );
  }
}

extension UserModelListToUserList on List<UserModel>? {
  List<User> toUserList() {
    final userModelList = this;
    if (userModelList == null) return [];
    return userModelList.map((userModel) => userModel.toUser()).toList();
  }
}
