import 'package:buzzer_app/core/utils/app_router.dart';
import 'package:flutter/material.dart';

void main() {
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
        fontFamily: 'Cyntho Next',
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white),
        ),
      ),
    );
  }
}
