import 'package:bloc/bloc.dart';
import 'package:buzzer_app/bloc_observer.dart';
import 'package:buzzer_app/constants.dart';
import 'package:buzzer_app/core/utils/app_router.dart';
import 'package:buzzer_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const BuzzerApp());
}

class BuzzerApp extends StatelessWidget {
  const BuzzerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
      theme: ThemeData(
        fontFamily: 'Cairo',
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: kButtonColor,
        ),
      ),
    );
  }
}
