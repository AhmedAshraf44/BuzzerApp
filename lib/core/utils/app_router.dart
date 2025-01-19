import 'package:buzzer_app/feature/login/data/model/login_data_model.dart';
import 'package:buzzer_app/feature/login/presentation/view/Login_otp_view.dart';
import 'package:buzzer_app/feature/login/presentation/view/login_view.dart';
import 'package:buzzer_app/feature/register/presentation/view/register_view.dart';
import 'package:go_router/go_router.dart';
import '../../feature/splash/presentation/view/splash_view.dart';

abstract class AppRouter {
  static const kLoginView = '/LoginView';
  static const kLoginOtpView = '/LoginOtpView';
  static const kRegisterView = '/RegisterView';

  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => SplashView(),
    ),
    GoRoute(
      path: kLoginView,
      builder: (context, state) => LoginView(),
    ),
    GoRoute(
        path: kLoginOtpView,
        builder: (context, state) {
          final model = state.extra as LoginDataModel;
          return LoginOtpView(
            model: model,
          );
        }),
    GoRoute(
      path: kRegisterView,
      builder: (context, state) => RegisterView(),
    ),
  ]);
}
