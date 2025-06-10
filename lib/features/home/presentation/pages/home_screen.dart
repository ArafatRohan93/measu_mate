import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:measu_mate/core/utils/context_localization.dart';

import '../../../../core/colors/app_colors.dart';
import '../../../../core/di/di.dart';
import '../../../../core/styles/app_text_styles.dart';
import '../cubit/project_cubit.dart';
import '../cubit/specialist_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<SpecialistCubit>()..fetchSpecialists()),
        BlocProvider(create: (_) => sl<ProjectCubit>()..fetchProjects()),
      ],
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              const _HomeSliverAppBar(),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(context.l10n.availableSpecialists,
                          style: AppTextStyles.h4Bold
                              .copyWith(color: AppColors.blackBlueDark)),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 140,
                      child: BlocBuilder<SpecialistCubit, SpecialistState>(
                        builder: (context, state) {
                          if (state is SpecialistLoading) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (state is SpecialistLoaded) {
                            return ListView.separated(
                              scrollDirection: Axis.horizontal,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              itemCount: state.specialists.length,
                              separatorBuilder: (_, __) =>
                                  const SizedBox(width: 16),
                              itemBuilder: (context, index) {
                                final specialist = state.specialists[index];
                                return Container(
                                  width: 120,
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: AppColors.grayLight
                                            .withOpacity(0.2),
                                        blurRadius: 16,
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ClipOval(
                                        child: Image.asset(
                                          specialist.imagePath,
                                          width: 56,
                                          height: 56,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      const SizedBox(height: 12),
                                      Text(
                                        specialist.degree,
                                        style: AppTextStyles.h6Regular.copyWith(
                                            color: AppColors.blackBlueDark),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          } else if (state is SpecialistFailure) {
                            return Center(
                                child:
                                    Text(context.l10n.failedToLoadSpecialists));
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                    ),
                    const SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.yellowPastel,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 18),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                context.l10n.watchAdForCoins,
                                style: AppTextStyles.h5Medium
                                    .copyWith(color: AppColors.blackBlueDark),
                              ),
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                color: AppColors.yellowMild,
                                shape: BoxShape.circle,
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(6.0),
                                child: Icon(Icons.play_arrow,
                                    color: AppColors.orange, size: 28),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    BlocBuilder<ProjectCubit, ProjectState>(
                      builder: (context, state) {
                        if (state is ProjectLoading) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (state is ProjectLoaded) {
                          return Column(
                            children: state.projects.map((project) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 8),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: AppColors.grayLight
                                            .withOpacity(0.2),
                                        blurRadius: 8,
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                        ),
                                        child: Image.asset(
                                          project.imagePath,
                                          height: 160,
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              project.title,
                                              style: AppTextStyles.h4Bold
                                                  .copyWith(
                                                      color: AppColors
                                                          .blackBlueDark),
                                            ),
                                            const SizedBox(height: 4),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  project.subtitle,
                                                  style: AppTextStyles.h6Regular
                                                      .copyWith(
                                                          color: AppColors
                                                              .grayBlueDark),
                                                ),
                                                Text(
                                                  '${project.cost.toStringAsFixed(1)}M',
                                                  style: AppTextStyles
                                                      .h6SemiBold
                                                      .copyWith(
                                                          color:
                                                              AppColors.orange),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 12),
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              child: LinearProgressIndicator(
                                                value: project.progress,
                                                minHeight: 8,
                                                backgroundColor:
                                                    AppColors.grayLight,
                                                valueColor:
                                                    const AlwaysStoppedAnimation(
                                                        AppColors.yellowMild),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }).toList(),
                          );
                        } else if (state is ProjectFailure) {
                          return Center(
                              child: Text(context.l10n.failedToLoadProjects));
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: const _HomeBottomNavBar(),
      ),
    );
  }
}

class _HomeSliverAppBar extends StatelessWidget {
  const _HomeSliverAppBar();

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: false,
      snap: false,
      backgroundColor: AppColors.white,
      elevation: 0,
      automaticallyImplyLeading: false,
      flexibleSpace: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
          child: Row(
            children: [
              const Icon(Icons.menu, size: 28, color: AppColors.blackBlueDark),
              const SizedBox(width: 12),
              Text(context.l10n.hi('Yousuf'),
                  style: AppTextStyles.h4Bold
                      .copyWith(color: AppColors.blackBlueDark)),
              const Spacer(),
              Icon(Icons.star, color: AppColors.orange, size: 26),
              const SizedBox(width: 4),
              Text('320',
                  style: AppTextStyles.h5Bold
                      .copyWith(color: AppColors.blackBlueDark)),
              const SizedBox(width: 16),
              const Icon(Icons.settings,
                  size: 26, color: AppColors.blackBlueDark),
            ],
          ),
        ),
      ),
    );
  }
}

class _HomeBottomNavBar extends StatelessWidget {
  const _HomeBottomNavBar();

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 1,
      onTap: (index) {},
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.build_outlined),
          label: context.l10n.projects,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.home, color: AppColors.orange),
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
    );
  }
}
