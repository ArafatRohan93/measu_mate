import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:measu_mate/core/colors/app_colors.dart';
import 'package:measu_mate/core/styles/app_text_styles.dart';
import 'package:measu_mate/features/consultant/domain/entities/consultant_details.dart';
import 'package:measu_mate/features/consultant/presentation/bloc/consultant_details_bloc/consultant_details_bloc.dart';
import 'package:measu_mate/features/consultant/presentation/bloc/consultant_details_bloc/consultant_details_state.dart';
import 'package:shimmer/shimmer.dart';

class ConsultantDetailsScreen extends StatelessWidget {
  final String consultantId;
  const ConsultantDetailsScreen({super.key, required this.consultantId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: BlocBuilder<ConsultantDetailsBloc, ConsultantDetailsState>(
        builder: (context, state) {
          if (state is ConsultantDetailsLoading) {
            return const _ConsultantDetailsShimmer();
          } else if (state is ConsultantDetailsError) {
            return Center(child: Text(state.error.message));
          } else if (state is ConsultantDetailsLoaded) {
            final details = state.details;
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  backgroundColor: AppColors.yellowBright,
                  elevation: 0,
                  automaticallyImplyLeading: true,
                  centerTitle: true,
                  title: Text(
                    'Consultant',
                    style: AppTextStyles.h3Medium
                        .copyWith(color: AppColors.blackBlueDark),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 38,
                              backgroundColor: AppColors.yellowBright,
                              child: CircleAvatar(
                                radius: 35,
                                backgroundImage: AssetImage(details.imageUrl),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(details.name,
                                      style: AppTextStyles.h4Bold),
                                  const SizedBox(height: 4),
                                  Text(details.degree1,
                                      style: AppTextStyles.h6Regular.copyWith(
                                          color: AppColors.grayBlueDark)),
                                  Text(details.degree2,
                                      style: AppTextStyles.h6Regular.copyWith(
                                          color: AppColors.grayBlueDark)),
                                  const SizedBox(height: 8),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: AppColors.yellowLightest,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(details.specialistTitle,
                                        style: AppTextStyles.h6Regular),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        _SectionTitle(
                          icon: Icons.school_rounded,
                          title: 'Education',
                        ),
                        const SizedBox(height: 8),
                        ...details.educationList.map((e) => Padding(
                              padding: const EdgeInsets.only(bottom: 4),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(e.title, style: AppTextStyles.h5Bold),
                                  Text(e.subtitle,
                                      style: AppTextStyles.h6Regular.copyWith(
                                          color: AppColors.grayBlueDark)),
                                ],
                              ),
                            )),
                        const SizedBox(height: 20),
                        _SectionTitle(
                          icon: Icons.folder_copy_rounded,
                          title: 'Areas of Expertise',
                        ),
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: details.expertise
                              .map((x) => Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 6),
                                    decoration: BoxDecoration(
                                      color: AppColors.yellowLightest,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child:
                                        Text(x, style: AppTextStyles.h6Regular),
                                  ))
                              .toList(),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            _SectionTitle(
                              icon: Icons.folder_copy_rounded,
                              title: 'Recent Projects',
                            ),
                            const Spacer(),
                            Text('View All',
                                style: AppTextStyles.h6SemiBold
                                    .copyWith(color: AppColors.yellowDark)),
                          ],
                        ),
                        const SizedBox(height: 8),
                        ...details.projects.map((p) => Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(
                                      p.imageUrl,
                                      width: 56,
                                      height: 56,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(p.title,
                                            style: AppTextStyles.h5Bold),
                                        Text(p.subtitle,
                                            style: AppTextStyles.h6Regular
                                                .copyWith(
                                                    color: AppColors
                                                        .grayBlueDark)),
                                        Text(p.duration,
                                            style: AppTextStyles.h6Regular
                                                .copyWith(
                                                    color: AppColors
                                                        .grayBlueDark)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        const SizedBox(height: 20),
                        _SectionTitle(
                          icon: Icons.calendar_month,
                          title: 'Available Time Slots',
                        ),
                        const SizedBox(height: 8),
                        ...details.timeSlots.map((slot) => Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
                                decoration: BoxDecoration(
                                  color: AppColors.grayLight.withOpacity(0.12),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('${slot.day}, ${slot.date}',
                                              style: AppTextStyles.h6SemiBold),
                                          Text(slot.time,
                                              style: AppTextStyles.h6Regular
                                                  .copyWith(
                                                      color: AppColors
                                                          .grayBlueDark)),
                                        ],
                                      ),
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.yellowBright,
                                        foregroundColor:
                                            AppColors.blackBlueDark,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 24, vertical: 8),
                                        elevation: 0,
                                      ),
                                      onPressed: () {},
                                      child: const Text('Select'),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.yellowBright,
                              foregroundColor: AppColors.blackBlueDark,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              elevation: 0,
                            ),
                            onPressed: () {},
                            child: const Text('Schedule Consultation'),
                          ),
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final IconData icon;
  final String title;
  const _SectionTitle({required this.icon, required this.title});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: AppColors.yellow, size: 22),
        const SizedBox(width: 8),
        Text(title, style: AppTextStyles.h5Bold),
      ],
    );
  }
}

class _ConsultantDetailsShimmer extends StatelessWidget {
  const _ConsultantDetailsShimmer();
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.grayLight.withOpacity(0.3),
      highlightColor: AppColors.grayLight.withOpacity(0.1),
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        children: [
          Container(
              height: 32,
              width: 120,
              color: Colors.white,
              margin: const EdgeInsets.only(bottom: 24)),
          Row(
            children: [
              Container(
                  width: 76,
                  height: 76,
                  decoration: BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle)),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        height: 18,
                        width: 120,
                        color: Colors.white,
                        margin: const EdgeInsets.only(bottom: 8)),
                    Container(
                        height: 14,
                        width: 80,
                        color: Colors.white,
                        margin: const EdgeInsets.only(bottom: 4)),
                    Container(
                        height: 14,
                        width: 80,
                        color: Colors.white,
                        margin: const EdgeInsets.only(bottom: 8)),
                    Container(height: 18, width: 100, color: Colors.white),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Container(
              height: 18,
              width: 100,
              color: Colors.white,
              margin: const EdgeInsets.only(bottom: 12)),
          Container(
              height: 14,
              width: double.infinity,
              color: Colors.white,
              margin: const EdgeInsets.only(bottom: 4)),
          Container(
              height: 14,
              width: double.infinity,
              color: Colors.white,
              margin: const EdgeInsets.only(bottom: 20)),
          Container(
              height: 18,
              width: 100,
              color: Colors.white,
              margin: const EdgeInsets.only(bottom: 12)),
          Row(
            children: [
              Container(
                  height: 28,
                  width: 100,
                  color: Colors.white,
                  margin: const EdgeInsets.only(right: 8)),
              Container(height: 28, width: 100, color: Colors.white),
            ],
          ),
          const SizedBox(height: 20),
          Container(
              height: 18,
              width: 100,
              color: Colors.white,
              margin: const EdgeInsets.only(bottom: 12)),
          Row(
            children: [
              Container(
                  width: 56,
                  height: 56,
                  color: Colors.white,
                  margin: const EdgeInsets.only(right: 12)),
              Expanded(child: Container(height: 40, color: Colors.white)),
            ],
          ),
          const SizedBox(height: 20),
          Container(
              height: 18,
              width: 100,
              color: Colors.white,
              margin: const EdgeInsets.only(bottom: 12)),
          Container(
              height: 48,
              width: double.infinity,
              color: Colors.white,
              margin: const EdgeInsets.only(bottom: 12)),
          Container(
              height: 48,
              width: double.infinity,
              color: Colors.white,
              margin: const EdgeInsets.only(bottom: 12)),
          Container(
              height: 48,
              width: double.infinity,
              color: Colors.white,
              margin: const EdgeInsets.only(bottom: 20)),
          Container(height: 48, width: double.infinity, color: Colors.white),
        ],
      ),
    );
  }
}
