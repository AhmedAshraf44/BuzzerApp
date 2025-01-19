import 'package:buzzer_app/core/function/build_app_bar.dart';
import 'package:buzzer_app/core/utils/app_router.dart';
import 'package:buzzer_app/feature/login/presentation/manger/cubit/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/function/show_toast.dart';
import 'widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        title: 'Sign In',
        leadingWidth: 0,
      ),
      body: BlocProvider(
        create: (context) => LoginCubit(),
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccessState) {
              GoRouter.of(context)
                  .push(AppRouter.kLoginOtpView, extra: state.model);
            } else if (state is LoginFailureState) {
              showToast(text: state.errorMessage, color: Colors.red);
            }
          },
          builder: (context, state) {
            return LoginViewBody();
          },
        ),
      ),
    );
  }
}
