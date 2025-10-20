import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:users/features/users/domain/entities/user.dart';
import 'package:users/features/users/domain/usecases/get_users.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final GetUsersUsecase getUsersUsecase;

  UsersBloc(this.getUsersUsecase) : super(const UsersState()) {
    on<UsersFetched>(_onUsersFetched);

    on<UsersLoadMore>(_onUsersLoadMore, transformer: droppable());
    on<UsersRefreshed>(_onUsersRefreshed);
  }

  Future<void> _onUsersFetched(
    UsersFetched event,
    Emitter<UsersState> emit,
  ) async {
    // Prevent multiple simultaneous calls
    if (state.status is UsersListLoading || state.hasReachedMax) return;

    final currentUsers = state.status is UsersListLoaded
        ? (state.status as UsersListLoaded).users
        : <User>[];

    emit(state.copyWith(status: const UsersListLoading()));

    try {
      final result = await getUsersUsecase.call(page: state.nextPage);

      if (result.isEmpty) {
        emit(
          state.copyWith(status: const UsersListEmpty(), hasReachedMax: true),
        );
      } else {
        emit(
          state.copyWith(
            status: UsersListLoaded([...currentUsers, ...result]),
            hasReachedMax: result.isEmpty,
            nextPage: state.nextPage + 1,
          ),
        );
      }
    } catch (e) {
      emit(state.copyWith(status: const UsersListError()));
    }
  }

  Future<void> _onUsersRefreshed(
    UsersRefreshed event,
    Emitter<UsersState> emit,
  ) async {
    emit(const UsersState(status: UsersListLoading()));

    try {
      final result = await getUsersUsecase.call(page: 1);

      if (result.isEmpty) {
        emit(
          state.copyWith(status: const UsersListEmpty(), hasReachedMax: true),
        );
      } else {
        emit(
          state.copyWith(
            status: UsersListLoaded(result),
            hasReachedMax: false,
            nextPage: 2,
          ),
        );
      }
    } catch (e) {
      emit(state.copyWith(status: const UsersListError()));
    }
  }

  Future<void> _onUsersLoadMore(
    UsersLoadMore event,
    Emitter<UsersState> emit,
  ) async {
    // Prevent multiple simultaneous calls
    if (state.status is UsersListLoading || state.hasReachedMax) return;

    final currentUsers = state.status is UsersListLoaded
        ? (state.status as UsersListLoaded).users
        : <User>[];

    emit(state.copyWith(status: UsersListLoadMore(currentUsers)));

    try {
      final result = await getUsersUsecase.call(page: state.nextPage);

      if (result.isEmpty) {
        emit(
          state.copyWith(status: const UsersListEmpty(), hasReachedMax: true),
        );
      } else {
        emit(
          state.copyWith(
            status: UsersListLoaded([...currentUsers, ...result]),
            hasReachedMax: result.isEmpty,
            nextPage: state.nextPage + 1,
          ),
        );
      }
    } catch (e) {
      emit(state.copyWith(status: const UsersListError()));
    }
  }
}
