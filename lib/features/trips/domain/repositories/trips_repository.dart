import 'package:users/features/trips/domain/entities/trip.dart';

abstract class TripsRepository {
  Future<List<Trip>> getTrips();
}
