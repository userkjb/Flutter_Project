import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:template/core/themes/app_colors.dart';
import 'package:template/core/themes/app_typography.dart';
import 'package:template/features/food_recommendation/controllers/food_recommendation_controller.dart';
import 'package:template/features/food_recommendation/models/food_category.dart';
import 'package:template/features/food_recommendation/screens/food_detail_screen.dart';
import 'package:template/features/food_recommendation/widgets/food_category_card.dart';
import 'package:template/features/settings/screens/settings_screen.dart';

/// 음식 추천 메인 화면
class FoodRecommendationScreen extends ConsumerWidget {
  /// [FoodRecommendationScreen] 생성자
  const FoodRecommendationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colors;
    final recommendedFood = ref.watch(foodRecommendationControllerProvider);

    return Scaffold(
      backgroundColor: colors.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // 상단 설정 버튼 및 점 3개 영역
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                child: SizedBox(
                  height: 48,
                  child: Stack(
                    children: [
                      // 중앙 점 3개
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
                                color: Color(0xFFF2780D),
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color: const Color(0xFFF2780D).withValues(alpha: 0.3),
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color: const Color(0xFFF2780D).withValues(alpha: 0.3),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // 우측 상단 설정 버튼
                      Positioned(
                        top: 0,
                        right: 0,
                        child: IconButton(
                          icon: Icon(
                            Icons.settings,
                            color: colors.textPrimary,
                            size: 28,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const SettingsScreen(),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // 제목
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 24, 16, 12),
                child: Text(
                  'food.title'.tr(),
                  style: AppTypography.headingJakarta.copyWith(
                    color: colors.textPrimary,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              // 음식 카테고리 그리드
              SizedBox(
                height: 390,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      childAspectRatio: 171 / 143,
                    ),
                    itemCount: FoodCategory.defaultCategories.length,
                    itemBuilder: (context, index) {
                      final category = FoodCategory.defaultCategories[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => FoodDetailScreen(category: category),
                            ),
                          );
                        },
                        child: FoodCategoryCard(
                          category: category,
                          isSelected: recommendedFood?.id == category.id,
                        ),
                      );
                    },
                  ),
                ),
              ),

              // 여백 (Spacer 대신 SizedBox 사용)
              const SizedBox(height: 20),

              // 랜덤 추천 버튼
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
                child: SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () {
                      ref
                          .read(foodRecommendationControllerProvider.notifier)
                          .recommendRandomFood();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF2780D),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                    ),
                    child: Text(
                      'food.random_button'.tr(),
                      style: AppTypography.titleJakarta.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
