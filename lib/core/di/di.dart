import 'package:get_it/get_it.dart';
import 'package:users/core/network/dio_service.dart';
import 'package:users/features/users/data/data_source/users_remote_source.dart';
import 'package:users/features/users/data/repositories/users_repository_impl.dart';
import 'package:users/features/users/domain/repositories/users_repository.dart';

final di = GetIt.instance..allowReassignment;

Future<void> initDi() async {
  di
    ..registerLazySingleton(() => DioService())
    ..registerLazySingleton<UsersRemoteSource>(() => UsersRemoteSource(di()))
    ..registerLazySingleton<UsersRepository>(() => UsersRepositoryImpl(di()));
}
