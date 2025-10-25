import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:template/core/themes/app_colors.dart';
import 'package:template/core/themes/app_typography.dart';
import 'package:template/features/food_recommendation/controllers/food_recommendation_controller.dart';
import 'package:template/features/food_recommendation/models/food_category.dart';
import 'package:template/features/food_recommendation/screens/food_detail_screen.dart';
import 'package:template/features/food_recommendation/widgets/food_category_card.dart';

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
              // 상단 이미지 영역
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/blueberry.svg',
                    width: 48,
                    height: 48,
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
