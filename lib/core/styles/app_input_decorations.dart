import 'package:flutter/material.dart';
import 'package:measu_mate/core/colors/app_colors.dart';

import 'app_text_styles.dart';

class AppInputDecorations {
  static InputDecoration regular({
    required String hint,
    Widget? prefixIcon,
    String? label,
    bool enabled = true,
  }) {
    return InputDecoration(
      hintText: hint,
      hintStyle:
          AppTextStyles.h6Regular.copyWith(color: AppColors.grayBlueDark),
      labelStyle:
          AppTextStyles.h6SemiBold.copyWith(color: AppColors.blackBlueDark),
      prefixIcon: prefixIcon,
      enabled: enabled,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.grayLight),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.grayLight),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.yellowBright),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
      label: null,
    );
  }

  static InputDecoration password({
    required String hint,
    Widget? prefixIcon,
    String? label,
    bool enabled = true,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      hintText: hint,
      hintStyle:
          AppTextStyles.h6Regular.copyWith(color: AppColors.grayBlueDark),
      labelStyle:
          AppTextStyles.h6SemiBold.copyWith(color: AppColors.blackBlueDark),
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      enabled: enabled,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.grayLight),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.grayLight),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.yellowBright),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
    );
  }
}
