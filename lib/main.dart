import 'package:flutter/material.dart';
import 'package:users/core/di/di.dart';
import 'package:users/core/network/dio_service.dart';
import 'package:users/features/users/presentation/user_details_screen.dart';
import 'package:users/features/users/presentation/users_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDi();
  di<DioService>().init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Users',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const UsersScreen(),
        '/user-detail': (context) => UserDetailsScreen(
          userId: 
            ModalRoute.of(context)?.settings.arguments  as int,
           
        ),
      },
    );
  }
}
