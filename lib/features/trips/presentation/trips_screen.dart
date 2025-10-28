import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users/core/di/di.dart';
import 'package:users/core/utils/responsive_builder.dart';
import 'package:users/features/trips/presentation/cubit/trips_cubit.dart';
import 'package:users/features/trips/presentation/views/trips_mobile.dart';
import 'package:users/features/trips/presentation/views/trips_web.dart';

class TripsScreen extends StatelessWidget {
  const TripsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TripsCubit(getTrips: di())..fetchTrips(),
      child: Scaffold(
        body: ResponsiveBuilder.responsive(
          context: context,
          child: TripsMobile(),
          lg: TripsWeb(),
        ),
      ),
    );
  }
}
