import 'package:buzzer_app/core/services/firesore_service.dart';
import 'package:buzzer_app/feature/layout/data/repos/app_layout_repo_impl.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetit() {
  getIt.registerSingleton<FireStoreService>(FireStoreService());
  getIt.registerSingleton<AppLayoutRepoImpl>(
    AppLayoutRepoImpl(
      getIt.get<FireStoreService>(),
    ),
  );
}
