import 'package:flutter/material.dart';
import '../styles/app_input_decorations.dart';

class AppTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final String? label;
  final Widget? prefixIcon;
  final bool enabled;
  final bool obscureText;
  final Widget? suffixIcon;
  final InputDecoration? decoration;

  const AppTextFormField({
    super.key,
    required this.controller,
    required this.hint,
    this.label,
    this.prefixIcon,
    this.enabled = true,
    this.obscureText = false,
    this.suffixIcon,
    this.decoration,
  });

  factory AppTextFormField.password({
    Key? key,
    required TextEditingController controller,
    required String hint,
    String? label,
    Widget? prefixIcon,
    bool enabled = true,
    bool obscureText = true,
    Widget? suffixIcon,
    InputDecoration? decoration,
  }) {
    return AppTextFormField(
      key: key,
      controller: controller,
      hint: hint,
      label: label,
      prefixIcon: prefixIcon,
      enabled: enabled,
      obscureText: obscureText,
      suffixIcon: suffixIcon,
      decoration: decoration ??
          AppInputDecorations.password(
            hint: hint,
            label: label,
            prefixIcon: prefixIcon,
            enabled: enabled,
            suffixIcon: suffixIcon,
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      enabled: enabled,
      decoration: decoration ??
          AppInputDecorations.regular(
            hint: hint,
            label: label,
            prefixIcon: prefixIcon,
            enabled: enabled,
          ),
    );
  }
}
