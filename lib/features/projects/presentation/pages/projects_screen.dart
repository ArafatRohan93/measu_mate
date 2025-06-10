import 'package:flutter/material.dart';
import 'package:measu_mate/core/colors/app_colors.dart';
import 'package:measu_mate/core/styles/app_text_styles.dart';
import 'package:measu_mate/core/utils/context_localization.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        elevation: 0,
        title: Text(
          context.l10n.projects,
          style:
              AppTextStyles.h3Medium.copyWith(color: AppColors.blackBlueDark),
        ),
      ),
      body: const Center(
        child: Text('Projects Screen'),
      ),
    );
  }
}
