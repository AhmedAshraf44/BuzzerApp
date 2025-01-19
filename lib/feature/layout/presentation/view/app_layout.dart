import 'package:buzzer_app/constants.dart';
import 'package:buzzer_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manger/cubit/app_cubit.dart';

class AppLayoutView extends StatelessWidget {
  const AppLayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return Scaffold(
            // backgroundColor: Color(0xffF5F5F5),
            appBar: AppBar(
              backgroundColor: kPrimaryColor,
              title: const Text(
                'Buzzer App',
                style: AppStyles.textStyle20Bold,
              ),
              leading: IconButton(
                onPressed: () {},
                icon: Icon(Icons.menu),
              ),
            ),
            bottomNavigationBar: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xffE5E5E5),
                      blurRadius: 10,
                    ),
                  ]),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
                child: BottomNavigationBar(
                    onTap: (index) {
                      cubit.changeBottomNavIndex(index);
                    },
                    currentIndex: cubit.currentIndex,
                    items: const [
                      BottomNavigationBarItem(
                          icon: Icon(Icons.home), label: 'Home'),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.apps), label: 'Categories'),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.favorite), label: 'profile'),
                    ]),
              ),
            ),
            body: cubit.pages[cubit.currentIndex],
          );
        },
      ),
    );
  }
}
