import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:users/features/users/domain/entities/user_pagination.dart';
import 'package:users/features/users/domain/usecases/get_users.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final GetUsersUsecase getUsersUsecase;

  UsersBloc(this.getUsersUsecase) : super(const UsersState()) {
    on<UsersFetched>(_onUsersFetched, transformer: droppable());
    on<UsersLoadMore>(_onUsersLoadMore, transformer: droppable());
  }

  Future<void> _onUsersFetched(
    UsersFetched event,
    Emitter<UsersState> emit,
  ) async {
    if (state.status is UsersListLoading) return;

    emit(
      state.copyWith(
        status: const UsersListLoading(),
        nextPage: 1,
        hasReachedMax: false,
      ),
    );

    try {
      final pagination = await getUsersUsecase.call(page: 1);

      if (pagination.users.isEmpty) {
        emit(
          state.copyWith(status: const UsersListEmpty(), hasReachedMax: true),
        );
      } else {
        emit(
          state.copyWith(
            status: UsersListLoaded(pagination),
            nextPage: pagination.page + 1,
            hasReachedMax: !pagination.hasNextPage,
          ),
        );
      }
    } catch (_) {
      emit(state.copyWith(status: const UsersListError()));
    }
  }

  Future<void> _onUsersLoadMore(
    UsersLoadMore event,
    Emitter<UsersState> emit,
  ) async {
    if (state.status is! UsersListLoaded) return;

    final currentState = state.status as UsersListLoaded;
    final currentPagination = currentState.users;
    final currentUsers = currentPagination.users;
    final hasNextPage = currentPagination.hasNextPage;

    emit(
      state.copyWith(status: UsersListLoadMore(hasNextPage, currentPagination)),
    );

    try {
      final newPagination = await getUsersUsecase.call(
        page: currentPagination.page + 1,
      );
      final newUsers = [...currentUsers, ...newPagination.users];

      final mergedPagination = currentPagination.copyWith(
        users: newUsers,
        page: newPagination.page,
        totalPages: newPagination.totalPages,
      );

      emit(
        state.copyWith(
          status: UsersListLoaded(mergedPagination),
          nextPage: mergedPagination.page + 1,
          hasReachedMax: !mergedPagination.hasNextPage,
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: UsersListError()));
    }
  }
}
