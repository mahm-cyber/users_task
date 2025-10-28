import 'package:get_it/get_it.dart';
import 'package:users/features/trips/data/data_source/mock_json_source.dart';
import 'package:users/features/trips/data/repositories/trips_repository_impl.dart';
import 'package:users/features/trips/domain/repositories/trips_repository.dart';
import 'package:users/features/trips/domain/usecases/get_trips.dart';

final di = GetIt.instance..allowReassignment;

Future<void> initDi() async {
  // di
  //   ..registerLazySingleton(() => DioService())
  //   ..registerLazySingleton<UsersRemoteSource>(() => UsersRemoteSource(di()))
  //   ..registerLazySingleton<UsersRepository>(() => UsersRepositoryImpl(di()));

  di
    ..registerLazySingleton(() => GetTrips(di()))
    ..registerLazySingleton<TripsRepository>(() => TripsRepositoryImpl(di()))
    ..registerLazySingleton<MockJsonSource>(() => MockJsonSource());
}
