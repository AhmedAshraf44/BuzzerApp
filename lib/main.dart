import 'package:buzzer_app/bloc_observer.dart';
import 'package:buzzer_app/core/utils/app_router.dart';
import 'package:buzzer_app/feature/layout/presentation/manger/cubit/app_cubit.dart';
import 'package:buzzer_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/function/build_theme_data.dart';
import 'core/services/get_it_service.dart';
import 'core/utils/cache_helper.dart';
import 'feature/layout/data/repos/app_layout_repo_impl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupGetit();
  runApp(const BuzzerApp());
}

class BuzzerApp extends StatelessWidget {
  const BuzzerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(
        getIt.get<AppLayoutRepoImpl>(),
      )
        ..getRestaurnatsData()
        ..addRestaurant(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
        theme: buildThemeData(),
      ),
    );
  }
}
