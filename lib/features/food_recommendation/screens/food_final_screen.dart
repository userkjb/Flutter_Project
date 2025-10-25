import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:template/core/themes/app_typography.dart';
import 'package:template/features/food_recommendation/models/food_item.dart';

/// 최종 음식 추천 화면
class FoodFinalScreen extends StatelessWidget {
  /// [FoodFinalScreen] 생성자
  const FoodFinalScreen({
    required this.foodItem,
    super.key,
  });

  /// 선택된 음식 아이템
  final FoodItem foodItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F7F5),
      body: SafeArea(
        child: Column(
          children: [
            // 상단 헤더 (뒤로가기 버튼 + 제목)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // 뒤로가기 버튼
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: SvgPicture.asset(
                      'assets/images/food/back_icon.svg',
                      width: 48,
                      height: 48,
                    ),
                  ),
                  // 제목
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 48),
                      child: Text(
                        'food.lunch_menu'.tr(),
                        style: AppTypography.title.copyWith(
                          color: const Color(0xFF1C140D),
                          fontSize: 18,
                          letterSpacing: -0.015 * 18,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // 메인 컨텐츠 영역 (이미지 + 텍스트)
            Expanded(
              child: Stack(
                children: [
                  // 배경 이미지 (10% 투명도)
                  Positioned.fill(
                    child: Opacity(
                      opacity: 0.1,
                      child: Image.asset(
                        'assets/images/food/ramen_bg-7f8f3a.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // 메인 컨텐츠
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 12),
                        // 음식 이미지
                        Expanded(
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x1A000000),
                                  blurRadius: 6,
                                  offset: Offset(0, 4),
                                  spreadRadius: -4,
                                ),
                                BoxShadow(
                                  color: Color(0x1A000000),
                                  blurRadius: 15,
                                  offset: Offset(0, 10),
                                  spreadRadius: -3,
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(24),
                              child: Image.asset(
                                foodItem.imagePath,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        // 텍스트
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 24, 0, 12),
                          child: Text(
                            'food.final_lunch_suggestion'
                                .tr(args: [foodItem.koreanName]),
                            style: AppTypography.heading.copyWith(
                              color: const Color(0xFF1C140D),
                              letterSpacing: -0.025 * 30,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // 하단 버튼들
            Padding(
              padding: const EdgeInsets.only(bottom: 32),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color(0xFFF2780D).withValues(alpha: 0.2),
                          foregroundColor: const Color(0xFFF2780D),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                        child: Text(
                          'food.select_again'.tr(),
                          style: AppTypography.body.copyWith(
                            color: const Color(0xFFF2780D),
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.015 * 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {
                          // 처음부터 다시 시작
                          Navigator.popUntil(context, (route) => route.isFirst);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFF2780D),
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                        child: Text(
                          'food.random_button'.tr(),
                          style: AppTypography.body.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.015 * 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
