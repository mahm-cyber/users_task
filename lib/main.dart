import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:users/core/di/di.dart';
import 'package:users/features/trips/presentation/trips_screen.dart';
import 'package:users/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDi();
  // di<DioService>().init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trips',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Inter'),
      routes: {'/': (context) => const TripsScreen()},
    );
  }
}
