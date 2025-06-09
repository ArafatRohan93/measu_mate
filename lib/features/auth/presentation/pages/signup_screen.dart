import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/colors/app_colors.dart';
import '../../../../core/styles/app_text_styles.dart';
import '../../../../core/utils/context_localization.dart';
import '../cubit/signup_cubit.dart';
import '../../../../core/di/di.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import 'package:go_router/go_router.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool obscurePassword = true;
  String countryCode = '+1';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<SignupCubit>(),
      child: BlocConsumer<SignupCubit, SignupState>(
        listener: (context, state) {
          if (state is SignupFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
          if (state is SignupSuccess) {
            context.go('/home');
          }
        },
        builder: (context, state) {
          final isLoading = state is SignupLoading;
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          Icon(Icons.straighten,
                              color: AppColors.yellowDarker, size: 28),
                          const SizedBox(width: 8),
                          Text(
                            context.l10n.appTitle,
                            style: AppTextStyles.h4Bold
                                .copyWith(color: AppColors.blackBlueDark),
                          ),
                          const Spacer(),
                          Container(
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
                                    style: AppTextStyles.h6Regular.copyWith(
                                        color: AppColors.grayBlueDark)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      Divider(color: AppColors.grayLight, height: 1),
                      const SizedBox(height: 24),
                      Text(
                        context.l10n.createAccount,
                        style: AppTextStyles.h3Bold.copyWith(
                            fontSize: 28, color: AppColors.blackBlueDark),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        context.l10n.createAccountSubtitle,
                        style: AppTextStyles.h5Regular
                            .copyWith(color: AppColors.grayBlueDark),
                      ),
                      const SizedBox(height: 28),
                      Text(context.l10n.fullName,
                          style: AppTextStyles.h6SemiBold
                              .copyWith(color: AppColors.blackBlueDark)),
                      const SizedBox(height: 8),
                      AppTextFormField(
                        controller: nameController,
                        hint: context.l10n.enterFullName,
                        label: context.l10n.fullName,
                        enabled: !isLoading,
                      ),
                      const SizedBox(height: 20),
                      Text(context.l10n.email,
                          style: AppTextStyles.h6SemiBold
                              .copyWith(color: AppColors.blackBlueDark)),
                      const SizedBox(height: 8),
                      AppTextFormField(
                        controller: emailController,
                        hint: context.l10n.enterEmail,
                        label: context.l10n.email,
                        enabled: !isLoading,
                      ),
                      const SizedBox(height: 20),
                      Text(context.l10n.phoneNumber,
                          style: AppTextStyles.h6SemiBold
                              .copyWith(color: AppColors.blackBlueDark)),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          IntrinsicWidth(
                            child: DropdownButtonFormField<String>(
                              value: countryCode,
                              items: ['+1', '+880', '+91', '+44']
                                  .map((code) => DropdownMenuItem(
                                        value: code,
                                        child: Text(code),
                                      ))
                                  .toList(),
                              onChanged: isLoading
                                  ? null
                                  : (val) =>
                                      setState(() => countryCode = val ?? '+1'),
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 18, horizontal: 8),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16)),
                                    borderSide:
                                        BorderSide(color: AppColors.grayLight)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16)),
                                    borderSide:
                                        BorderSide(color: AppColors.grayLight)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16)),
                                    borderSide: BorderSide(
                                        color: AppColors.yellowBright)),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: AppTextFormField(
                              controller: phoneController,
                              hint: context.l10n.enterPhoneNumber,
                              label: context.l10n.phoneNumber,
                              enabled: !isLoading,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text(context.l10n.password,
                          style: AppTextStyles.h6SemiBold
                              .copyWith(color: AppColors.blackBlueDark)),
                      const SizedBox(height: 8),
                      AppTextFormField.password(
                        controller: passwordController,
                        hint: context.l10n.createPassword,
                        label: context.l10n.password,
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
                                context.read<SignupCubit>().signup(
                                      name: nameController.text.trim(),
                                      email: emailController.text.trim(),
                                      phone:
                                          '$countryCode${phoneController.text.trim()}',
                                      password: passwordController.text.trim(),
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
                            : Text(context.l10n.signUp),
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
                        label: Text(context.l10n.signUpWithGoogle),
                        onPressed: isLoading ? null : () {},
                      ),
                      const SizedBox(height: 24),
                      Text.rich(
                        TextSpan(
                          text: context.l10n.bySigningUp,
                          style: AppTextStyles.h6Regular
                              .copyWith(color: AppColors.grayBlueDark),
                          children: [
                            TextSpan(
                              text: context.l10n.termsOfService,
                              style: AppTextStyles.h6Regular
                                  .copyWith(color: AppColors.orange),
                            ),
                            TextSpan(
                              text: ' ${context.l10n.and} ',
                              style: AppTextStyles.h6Regular
                                  .copyWith(color: AppColors.grayBlueDark),
                            ),
                            TextSpan(
                              text: context.l10n.privacyPolicy,
                              style: AppTextStyles.h6Regular
                                  .copyWith(color: AppColors.orange),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(context.l10n.alreadyHaveAccount,
                              style: AppTextStyles.h6Regular
                                  .copyWith(color: AppColors.grayBlueDark)),
                          TextButton(
                            onPressed: isLoading
                                ? null
                                : () {
                                    context.go('/login');
                                  },
                            child: Text(context.l10n.signIn,
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
