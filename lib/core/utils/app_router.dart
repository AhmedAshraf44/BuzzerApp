import 'package:buzzer_app/feature/login/data/model/login_data_model.dart';
import 'package:buzzer_app/feature/login/presentation/view/otp_view.dart';
import 'package:buzzer_app/feature/login/presentation/view/login_view.dart';
import 'package:go_router/go_router.dart';
import '../../feature/cart/presentation/view/cart_view.dart';
import '../../feature/layout/data/model/restaurant_model/product.dart';
import '../../feature/layout/presentation/view/app_layout.dart';
import '../../feature/product/presentation/view/product_view.dart';
import '../../feature/product_dateils/presentation/view/product_detials.dart';
import '../../feature/splash/presentation/view/splash_view.dart';

abstract class AppRouter {
  static const kLoginView = '/LoginView';
  static const kLoginOtpView = '/LoginOtpView';
  static const kAppLayoutView = '/AppLayoutView';
  static const kProductView = '/ProductView';
  static const kProductDetialsView = '/ProductDetialsView';
  //static const kCartView = '/kCartView';

  static final router = GoRouter(routes: [
    // GoRoute(
    //   path: '/',
    //   builder: (context, state) => SplashView(),
    // ),
    GoRoute(
      path: kLoginView,
      builder: (context, state) => LoginView(),
    ),
    GoRoute(
        path: kLoginOtpView,
        builder: (context, state) {
          final model = state.extra as LoginDataModel;
          return OtpView(
            model: model,
          );
        }),
    GoRoute(
      path: '/',
      // path: kAppLayoutView,
      builder: (context, state) => AppLayoutView(),
    ),
    GoRoute(
        path: kProductView,
        builder: (context, state) {
          final products = state.extra as List<Product>;
          return ProductView(products: products);
        }),
    GoRoute(
        path: kProductDetialsView,
        builder: (context, state) {
          final product = state.extra as Product;
          return ProductDetialsView(product: product);
        }),
    // GoRoute(
    //   path: kCartView,
    //   builder: (context, state) => CartView(),
    // ),
  ]);
}
