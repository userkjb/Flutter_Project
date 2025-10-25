import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:template/core/controllers/theme_controller.dart';
import 'package:template/core/themes/app_colors.dart';
import 'package:template/core/themes/app_typography.dart';
import 'package:template/features/settings/controllers/language_controller.dart';

/// 설정 화면
class SettingsScreen extends ConsumerWidget {
  /// [SettingsScreen] 생성자
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colors;
    final themeMode = ref.watch(themeControllerProvider);
    final currentLocale = ref.watch(languageControllerProvider);

    return Scaffold(
      backgroundColor: colors.surface,
      appBar: AppBar(
        title: Text(
          'settings.title'.tr(),
          style: AppTypography.title.copyWith(
            color: colors.textPrimary,
          ),
        ),
        backgroundColor: colors.surface,
        elevation: 0,
        iconTheme: IconThemeData(color: colors.textPrimary),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // 테마 설정 섹션
          Text(
            'settings.theme'.tr(),
            style: AppTypography.body.copyWith(
              color: colors.textSecondary,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: SwitchListTile(
              title: Text(
                'settings.dark_mode'.tr(),
                style: AppTypography.body.copyWith(
                  color: const Color(0xFF1C140D),
                ),
              ),
              subtitle: Text(
                themeMode == ThemeMode.dark
                    ? 'settings.dark_mode_on'.tr()
                    : 'settings.dark_mode_off'.tr(),
                style: AppTypography.caption.copyWith(
                  color: colors.textSecondary,
                ),
              ),
              value: themeMode == ThemeMode.dark,
              onChanged: (value) {
                ref.read(themeControllerProvider.notifier).toggleTheme();
              },
              activeThumbColor: colors.primary,
              activeTrackColor: colors.primary.withValues(alpha: 0.5),
            ),
          ),

          const SizedBox(height: 32),

          // 언어 설정 섹션
          Text(
            'settings.language'.tr(),
            style: AppTypography.body.copyWith(
              color: colors.textSecondary,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: SwitchListTile(
              title: Text(
                'settings.english_mode'.tr(),
                style: AppTypography.body.copyWith(
                  color: const Color(0xFF1C140D),
                ),
              ),
              subtitle: Text(
                currentLocale.languageCode == 'en'
                    ? 'settings.language_english'.tr()
                    : 'settings.language_korean'.tr(),
                style: AppTypography.caption.copyWith(
                  color: colors.textSecondary,
                ),
              ),
              value: currentLocale.languageCode == 'en',
              onChanged: (value) {
                ref
                    .read(languageControllerProvider.notifier)
                    .toggleLanguage(context);
              },
              activeThumbColor: colors.primary,
              activeTrackColor: colors.primary.withValues(alpha: 0.5),
            ),
          ),

          const SizedBox(height: 32),

          // 앱 정보
          Text(
            'settings.about'.tr(),
            style: AppTypography.body.copyWith(
              color: colors.textSecondary,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'settings.app_name'.tr(),
                  style: AppTypography.body.copyWith(
                    color: const Color(0xFF1C140D),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'settings.version'.tr(),
                  style: AppTypography.caption.copyWith(
                    color: colors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
