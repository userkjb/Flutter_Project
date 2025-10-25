import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// 앱 전체에서 사용되는 텍스트 스타일을 정의하는 클래스
class AppTypography {
  /// 큰 제목 스타일 (32px, 일반)
  static const heading = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w400,
    fontFamily: 'Noto Sans KR',
  );

  /// 중간 제목 스타일 (20px, 볼드)
  static const title = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    fontFamily: 'Noto Sans KR',
  );

  /// 일반 본문 스타일 (16px, 일반)
  static const body = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontFamily: 'Noto Sans KR',
  );

  /// 작은 텍스트 스타일 (14px, 일반)
  static const caption = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: 'Noto Sans KR',
  );

  /// Plus Jakarta Sans 큰 제목 스타일 (30px, 볼드, -2.5% letter spacing)
  static TextStyle get headingJakarta => GoogleFonts.plusJakartaSans(
        fontSize: 30,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.75, // -2.5% of 30px
        height: 1.25,
      );

  /// Plus Jakarta Sans 타이틀 스타일 (18px, 볼드, 2.5% letter spacing)
  static TextStyle get titleJakarta => GoogleFonts.plusJakartaSans(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.45, // 2.5% of 18px
        height: 1.5,
      );

  /// Plus Jakarta Sans 카드 텍스트 스타일 (18px, 볼드)
  static TextStyle get cardTextJakarta => GoogleFonts.plusJakartaSans(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        height: 1.5555555555555556,
      );
}
