import 'package:buzzer_app/core/utils/app_router.dart';
import 'package:buzzer_app/feature/login/data/model/login_data_model.dart';
import 'package:buzzer_app/feature/login/presentation/manger/cubit/otp/otp_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/function/build_app_bar.dart';
import '../../../../core/function/show_toast.dart';
import 'widgets/otp_view_body.dart';

class OtpView extends StatelessWidget {
  const OtpView({super.key, required this.model});
  final LoginDataModel model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'Login Code', leadingWidth: 20),
      body: BlocProvider(
        create: (context) => OtpCubit(),
        child: BlocConsumer<OtpCubit, OtpState>(
          listener: (context, state) {
            if (state is OtpSuccessState) {
              GoRouter.of(context).push(AppRouter.kRegisterView);
            } else if (state is OtpFailureState) {
              showToast(text: state.errorMessage, color: Colors.red);
            }
          },
          builder: (context, state) {
            return OtpViewBody(
              model: model,
            );
          },
        ),
      ),
    );
  }
}
