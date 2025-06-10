import 'package:flutter/material.dart';
import 'package:measu_mate/core/colors/app_colors.dart';
import 'package:measu_mate/core/styles/app_text_styles.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 48, bottom: 32),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.yellowBright, AppColors.yellow],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 72,
                  height: 72,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
                    child: Icon(Icons.build_rounded,
                        color: AppColors.yellow, size: 40),
                  ),
                ),
                const SizedBox(height: 16),
                Text('Measu Mate',
                    style: AppTextStyles.h3Medium.copyWith(
                        color: AppColors.white, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          const SizedBox(height: 32),
          _DrawerItem(
            icon: Icons.folder_open_rounded,
            label: 'Projects',
            onTap: () {},
          ),
          _DrawerItem(
            icon: Icons.groups_rounded,
            label: 'Consultants',
            onTap: () {},
          ),
          _DrawerItem(
            icon: Icons.swap_horiz_rounded,
            label: 'Unit Conversions',
            onTap: () {},
          ),
          _DrawerItem(
            icon: Icons.person_outline_rounded,
            label: 'Profile',
            onTap: () {},
          ),
          _DrawerItem(
            icon: Icons.shopping_bag_outlined,
            label: 'Purchase History/Packages',
            onTap: () {},
          ),
          _DrawerItem(
            icon: Icons.description_outlined,
            label: 'Terms -Privacy Policy',
            onTap: () {},
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text('Follow on Social Media',
                style: AppTextStyles.h6SemiBold
                    .copyWith(color: AppColors.grayBlueDark)),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _SocialIcon(
                  color: Color(0xFF1877F3),
                  icon: Icons.facebook,
                  onTap: () {},
                ),
                const SizedBox(width: 12),
                _SocialIcon(
                  color: Color(0xFFFF0000),
                  icon: Icons.play_circle_fill,
                  onTap: () {},
                ),
                const SizedBox(width: 12),
                _SocialIcon(
                  color: Color(0xFFE4405F),
                  icon: Icons.camera_alt,
                  onTap: () {},
                ),
                const SizedBox(width: 12),
                _SocialIcon(
                  color: Color(0xFF0A66C2),
                  icon: Icons.business_center,
                  onTap: () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  const _DrawerItem(
      {required this.icon, required this.label, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: AppColors.yellow, size: 28),
      title: Text(label,
          style: AppTextStyles.h5Regular.copyWith(
              color: AppColors.blackBlueDark, fontWeight: FontWeight.w500)),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
      horizontalTitleGap: 16,
      minLeadingWidth: 0,
    );
  }
}

class _SocialIcon extends StatelessWidget {
  final Color color;
  final IconData icon;
  final VoidCallback onTap;
  const _SocialIcon(
      {required this.color, required this.icon, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(100),
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white, size: 24),
      ),
    );
  }
}
