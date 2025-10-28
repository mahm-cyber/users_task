import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:users/features/trips/data/models/trip_model.dart';
import 'package:users/features/trips/data/models/trips_response.dart';

class MockJsonSource {
  MockJsonSource();

  Future<List<TripModel>> getTrips() async {
    try {
      final String jsonString = await rootBundle.loadString(
        'assets/trips_mock.json',
      );
      final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
      final tripResponse = TripResponse.fromJson(jsonMap);

      return tripResponse.trips;
    } catch (e) {
      print('Current Error 1 $e');
      rethrow;
    }
  }
}
