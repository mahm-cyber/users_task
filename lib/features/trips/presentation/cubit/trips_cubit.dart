import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users/features/trips/domain/entities/trip.dart';
import 'package:users/features/trips/domain/usecases/get_trips.dart';

part 'trips_state.dart';

class TripsCubit extends Cubit<TripsState> {
  final GetTrips getTrips;

  TripsCubit({required this.getTrips}) : super(TripsInitial());

  Future<void> fetchTrips() async {
    try {
      emit(TripsLoading());
      final trips = await getTrips();
      emit(TripsLoaded(trips));
    } catch (e) {
      emit(TripsError(e.toString()));
    }
  }
}
