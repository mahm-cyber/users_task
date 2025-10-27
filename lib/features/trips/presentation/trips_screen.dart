import 'package:flutter/material.dart';
import 'package:users/core/utils/responsive_builder.dart';
import 'package:users/features/trips/presentation/views/trips_web.dart';

class TripsScreen extends StatelessWidget {
  const TripsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveBuilder.responsive(context: context, child: TripsWeb()),
    );
  }
}
