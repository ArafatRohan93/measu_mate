import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/colors/app_colors.dart';
import '../../../../core/di/di.dart';
import '../../../../core/styles/app_text_styles.dart';
import '../../../../core/utils/context_localization.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import '../cubit/login_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(sl()),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
          if (state is LoginSuccess) {
            context.go('/home');
          }
        },
        builder: (context, state) {
          final isLoading = state is LoginLoading;
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 48),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: AppColors.grayUltraLight,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.language,
                                  size: 18, color: AppColors.grayBlueDark),
                              const SizedBox(width: 4),
                              Text('EN',
                                  style: AppTextStyles.h6Regular
                                      .copyWith(color: AppColors.grayBlueDark)),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 48),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.straighten,
                              color: AppColors.yellowDarker, size: 36),
                          SizedBox(width: 12),
                          Icon(Icons.calculate,
                              color: AppColors.yellowDarker, size: 36),
                        ],
                      ),
                      const SizedBox(height: 24),
                      Text(context.l10n.appTitle,
                          textAlign: TextAlign.center,
                          style: AppTextStyles.h2Bold.copyWith(
                            color: AppColors.blackBlueDark,
                            fontSize: 32,
                          )),
                      const SizedBox(height: 8),
                      Text(
                        context.l10n.smartConstruction,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.h5Regular
                            .copyWith(color: AppColors.grayBlueDark),
                      ),
                      const SizedBox(height: 40),
                      Text(context.l10n.email,
                          style: AppTextStyles.h6SemiBold
                              .copyWith(color: AppColors.blackBlueDark)),
                      const SizedBox(height: 8),
                      AppTextFormField(
                        controller: emailController,
                        hint: context.l10n.enterEmail,
                        label: context.l10n.email,
                        prefixIcon: const Icon(Icons.mail_outline,
                            color: AppColors.grayBlueDark),
                        enabled: !isLoading,
                      ),
                      const SizedBox(height: 20),
                      Text(context.l10n.password,
                          style: AppTextStyles.h6SemiBold
                              .copyWith(color: AppColors.blackBlueDark)),
                      const SizedBox(height: 8),
                      AppTextFormField.password(
                        controller: passwordController,
                        hint: context.l10n.enterPassword,
                        label: context.l10n.password,
                        prefixIcon: Icon(Icons.lock_outline,
                            color: AppColors.grayBlueDark),
                        enabled: !isLoading,
                        obscureText: obscurePassword,
                        suffixIcon: IconButton(
                          icon: Icon(
                            obscurePassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: AppColors.grayBlueDark,
                          ),
                          onPressed: isLoading
                              ? null
                              : () {
                                  setState(() {
                                    obscurePassword = !obscurePassword;
                                  });
                                },
                        ),
                      ),
                      const SizedBox(height: 28),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: AppColors.yellowMild,
                          foregroundColor: AppColors.blackBlueDark,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          textStyle: AppTextStyles.h5Bold,
                        ),
                        onPressed: isLoading
                            ? null
                            : () {
                                context.read<LoginCubit>().login(
                                      emailController.text.trim(),
                                      passwordController.text.trim(),
                                    );
                              },
                        child: isLoading
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 18,
                                    height: 18,
                                    child: CircularProgressIndicator(
                                      color: AppColors.blackBlueDark,
                                      strokeWidth: 2,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Text('Loading...'),
                                ],
                              )
                            : Text(context.l10n.login),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          const Expanded(child: Divider()),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(context.l10n.or,
                                style: AppTextStyles.h6Regular
                                    .copyWith(color: AppColors.grayBlueDark)),
                          ),
                          const Expanded(child: Divider()),
                        ],
                      ),
                      const SizedBox(height: 16),
                      OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          side: BorderSide(color: AppColors.grayLight),
                          textStyle: AppTextStyles.h5Regular,
                        ),
                        icon: Icon(Icons.g_mobiledata,
                            color: AppColors.grayBlueDark, size: 28),
                        label: Text(context.l10n.signInWithGoogle),
                        onPressed: isLoading ? null : () {},
                      ),
                      const SizedBox(height: 24),
                      TextButton(
                        onPressed: isLoading ? null : () {},
                        child: Text(context.l10n.forgotPassword,
                            style: AppTextStyles.h6Regular
                                .copyWith(color: AppColors.grayBlueDark)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(context.l10n.dontHaveAccount,
                              style: AppTextStyles.h6Regular
                                  .copyWith(color: AppColors.grayBlueDark)),
                          TextButton(
                            onPressed: isLoading
                                ? null
                                : () {
                                    context.go('/signup');
                                  },
                            child: Text(context.l10n.signUp,
                                style: AppTextStyles.h6Regular
                                    .copyWith(color: AppColors.orange)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
