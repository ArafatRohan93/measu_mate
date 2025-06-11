import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:measu_mate/core/colors/app_colors.dart';
import 'package:measu_mate/core/styles/app_text_styles.dart';
import 'package:measu_mate/features/consultant/domain/entities/consultant.dart';
import 'package:measu_mate/features/consultant/presentation/bloc/consultant_details_bloc/consultant_details_bloc.dart';
import 'package:measu_mate/features/consultant/presentation/bloc/consultants_list_bloc/consultants_bloc.dart';
import 'package:measu_mate/features/consultant/presentation/bloc/consultants_list_bloc/consultants_state.dart';
import 'package:measu_mate/features/consultant/presentation/pages/consultant_details_screen.dart';
import 'package:shimmer/shimmer.dart';
import 'package:measu_mate/core/di/di.dart';

class ConsultantsScreen extends StatelessWidget {
  const ConsultantsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ConsultantsBloc(sl())
        ..add(const LoadConsultants(ConsultantTab.engineer)),
      child: const _ConsultantsView(),
    );
  }
}

class _ConsultantsView extends StatelessWidget {
  const _ConsultantsView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grayUltraLight,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 24, bottom: 16),
              color: AppColors.goldLight,
              child: Center(
                child: Text(
                  'Consultants',
                  style: AppTextStyles.h3Medium
                      .copyWith(color: AppColors.blackBlueDark),
                ),
              ),
            ),
            BlocBuilder<ConsultantsBloc, ConsultantsState>(
              buildWhen: (previous, current) => previous.tab != current.tab,
              builder: (context, state) {
                return _ConsultantTabBar(tab: state.tab);
              },
            ),
            const Expanded(child: _ConsultantList()),
          ],
        ),
      ),
    );
  }
}

class _ConsultantTabBar extends StatelessWidget {
  final ConsultantTab tab;
  const _ConsultantTabBar({required this.tab});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.grayVeryLight,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          _TabButton(
            label: 'Engineer',
            selected: tab == ConsultantTab.engineer,
            onTap: () => context
                .read<ConsultantsBloc>()
                .add(const LoadConsultants(ConsultantTab.engineer)),
          ),
          const SizedBox(
            width: 8,
          ),
          _TabButton(
            label: 'Architect',
            selected: tab == ConsultantTab.architect,
            onTap: () => context
                .read<ConsultantsBloc>()
                .add(const LoadConsultants(ConsultantTab.architect)),
          ),
        ],
      ),
    );
  }
}

class _TabButton extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;
  const _TabButton(
      {required this.label, required this.selected, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 14),
          decoration: BoxDecoration(
            color: selected ? AppColors.goldLight : Colors.transparent,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Center(
            child: Text(
              label,
              style: AppTextStyles.h5Bold.copyWith(
                color:
                    selected ? AppColors.blackBlueDark : AppColors.grayBlueDark,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ConsultantList extends StatelessWidget {
  const _ConsultantList();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConsultantsBloc, ConsultantsState>(
      builder: (context, state) {
        if (state is ConsultantsLoading) {
          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: 4,
            separatorBuilder: (_, __) => const SizedBox(height: 16),
            itemBuilder: (_, __) => const _ConsultantCardShimmer(),
          );
        } else if (state is ConsultantsLoaded) {
          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: state.consultants.length,
            separatorBuilder: (_, __) => const SizedBox(height: 16),
            itemBuilder: (_, i) =>
                _ConsultantCard(consultant: state.consultants[i]),
          );
        } else if (state is ConsultantsError) {
          return Center(child: Text(state.error.message));
        }
        return const SizedBox.shrink();
      },
    );
  }
}

class _ConsultantCard extends StatelessWidget {
  final Consultant consultant;
  const _ConsultantCard({required this.consultant});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => ConsultantDetailsBloc(sl())
                ..add(FetchConsultantDetails(consultant.name)),
              child: ConsultantDetailsScreen(consultantId: consultant.name),
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: AppColors.grayLight.withOpacity(0.15),
              blurRadius: 12,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.yellowBright, width: 3),
              ),
              child: ClipOval(
                child: Image.asset(
                  consultant.imageUrl,
                  width: 64,
                  height: 64,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    consultant.name,
                    style: AppTextStyles.h4Bold,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    consultant.degree1,
                    style: AppTextStyles.h6Regular
                        .copyWith(color: AppColors.grayBlueDark),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    consultant.degree2,
                    style: AppTextStyles.h6Regular
                        .copyWith(color: AppColors.grayBlueDark),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.yellowLightest,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      consultant.specialistTitle,
                      style: AppTextStyles.h6SemiBold
                          .copyWith(color: AppColors.yellowDark),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ConsultantCardShimmer extends StatelessWidget {
  const _ConsultantCardShimmer();
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.gray.withOpacity(0.2),
      highlightColor: AppColors.gray.withOpacity(0.08),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: AppColors.grayLight,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      height: 18,
                      width: 120,
                      color: AppColors.grayLight,
                      margin: const EdgeInsets.only(bottom: 8)),
                  Container(
                      height: 14,
                      width: 80,
                      color: AppColors.grayLight,
                      margin: const EdgeInsets.only(bottom: 4)),
                  Container(
                      height: 14,
                      width: 80,
                      color: AppColors.grayLight,
                      margin: const EdgeInsets.only(bottom: 8)),
                  Container(height: 18, width: 100, color: AppColors.grayLight),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
