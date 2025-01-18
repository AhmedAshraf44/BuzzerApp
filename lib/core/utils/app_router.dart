import 'package:buzzer_app/feature/login/presentation/view/login_view.dart';
import 'package:buzzer_app/feature/register/presentation/view/register_view.dart';
import 'package:go_router/go_router.dart';

import '../../feature/login/presentation/view/sign_in_view.dart';

abstract class AppRouter {
  static const kLoginView = '/LoginView';
  static const kRegisterView = '/RegisterView';

  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => SignInView(),
    ),
    GoRoute(
      path: kLoginView,
      builder: (context, state) => LoginView(),
    ),
    GoRoute(
      path: kRegisterView,
      builder: (context, state) => RegisterView(),
    ),
  ]);
}
