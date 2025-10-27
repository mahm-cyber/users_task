import 'package:users/features/trips/data/models/trip_model.dart';

class TripResponse {
  TripResponse({required this.trips});

  final List<TripModel> trips;

  factory TripResponse.fromJson(Map<String, dynamic> json) {
    return TripResponse(
      trips: json["trips"] == null
          ? []
          : List<TripModel>.from(
              json["trips"]!.map((x) => TripModel.fromJson(x)),
            ),
    );
  }
}
