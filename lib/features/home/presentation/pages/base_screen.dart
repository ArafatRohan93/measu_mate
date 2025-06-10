import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:measu_mate/core/colors/app_colors.dart';
import 'package:measu_mate/core/utils/context_localization.dart';
import 'package:measu_mate/features/home/presentation/cubit/navigation_cubit.dart';
import 'package:measu_mate/features/home/presentation/pages/home_screen.dart';
import 'package:measu_mate/features/projects/presentation/pages/projects_screen.dart';
import 'package:measu_mate/features/convert/presentation/pages/convert_screen.dart';
import 'package:measu_mate/features/home/presentation/widgets/app_drawer.dart';

enum BaseScreenTab {
  projects,
  home,
  convert,
}

class BaseScreen extends StatelessWidget {
  final BaseScreenTab tab;
  const BaseScreen({super.key, required this.tab});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NavigationCubit(tab.index),
      child: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          return Scaffold(
            drawer: const AppDrawer(),
            body: IndexedStack(
              index: state.currentIndex,
              children: const [
                ProjectsScreen(),
                HomeScreen(),
                ConvertScreen(),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: state.currentIndex,
              onTap: (index) =>
                  context.read<NavigationCubit>().changeIndex(index),
              items: [
                BottomNavigationBarItem(
                  icon: const Icon(Icons.build_outlined),
                  label: context.l10n.projects,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(
                    Icons.home,
                  ),
                  label: context.l10n.home,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.calculate_outlined),
                  label: context.l10n.convert,
                ),
              ],
              selectedItemColor: AppColors.orange,
              unselectedItemColor: AppColors.grayBlueDark,
              showUnselectedLabels: true,
              backgroundColor: AppColors.white,
              elevation: 0,
              type: BottomNavigationBarType.fixed,
            ),
          );
        },
      ),
    );
  }
}
