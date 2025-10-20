import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:users/features/users/domain/entities/user.dart';
import 'package:users/features/users/domain/usecases/get_user.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final GetUserUsecase getUserUsecase;
  UserCubit(this.getUserUsecase) : super(const UserState());

  Future<void> fetchUser(int userId) async {
    emit(state.copyWith(status: const UserDataLoading()));
    try {
      final user = await getUserUsecase.call(id: userId);
      emit(state.copyWith(status: UserDataLoaded(user), user: user));
    } catch (e) {
      emit(state.copyWith(status: UserDataError(e.toString())));
    }
  }
}
