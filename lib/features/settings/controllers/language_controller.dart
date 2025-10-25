import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 언어 상태를 관리하는 프로바이더
final languageControllerProvider =
    NotifierProvider<LanguageController, Locale>(
  LanguageController.new,
);

/// 언어 상태 관리 클래스
class LanguageController extends Notifier<Locale> {
  @override
  Locale build() {
    return const Locale('ko');
  }

  /// 언어를 변경하는 메소드
  void changeLanguage(BuildContext context, Locale locale) {
    context.setLocale(locale);
    state = locale;
  }

  /// 언어를 토글하는 메소드 (한글 <-> 영어)
  void toggleLanguage(BuildContext context) {
    final newLocale = state.languageCode == 'ko'
        ? const Locale('en')
        : const Locale('ko');
    changeLanguage(context, newLocale);
  }
}
