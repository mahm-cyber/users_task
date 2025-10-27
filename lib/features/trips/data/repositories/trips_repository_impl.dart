import 'package:users/features/trips/data/data_source/mock_json_source.dart';
import 'package:users/features/trips/domain/entities/trip.dart';
import 'package:users/features/trips/domain/repositories/trips_repository.dart';
import 'package:users/features/trips/dto/mappers.dart';

class TripsRepositoryImpl implements TripsRepository {
  final MockJsonSource mockJsonSource;

  TripsRepositoryImpl(this.mockJsonSource);

  @override
  Future<List<Trip>> getTrips() async {
    try {
      final tripsModels = await mockJsonSource.getTrips();
      return tripsModels.toTrips();
    } catch (e) {
      rethrow;
    }
  }
}
