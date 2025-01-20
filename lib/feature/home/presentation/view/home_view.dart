import 'package:flutter/material.dart';
import 'widgets/build_home_list_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: BuildHomeListView(),
    );
  }
}
