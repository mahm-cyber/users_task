import 'package:users/features/trips/domain/entities/trip.dart';
import 'package:users/features/trips/domain/repositories/trips_repository.dart';

class GetTrips {
  final TripsRepository tripsRepository;

  GetTrips(this.tripsRepository);

  Future<List<Trip>> call() async {
    try {
      return await tripsRepository.getTrips();
    } catch (e) {
      rethrow;
    }
  }
}
