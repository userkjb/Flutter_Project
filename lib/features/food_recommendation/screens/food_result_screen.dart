import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:template/core/themes/app_colors.dart';
import 'package:template/core/themes/app_typography.dart';
import 'package:template/features/food_recommendation/models/food_item.dart';
import 'package:template/features/food_recommendation/models/food_subcategory.dart';
import 'package:template/features/food_recommendation/screens/food_final_screen.dart';
import 'package:template/features/food_recommendation/widgets/food_result_card.dart';

/// 음식 추천 결과 화면
class FoodResultScreen extends StatelessWidget {
  /// [FoodResultScreen] 생성자
  const FoodResultScreen({
    required this.subcategory,
    super.key,
  });

  /// 선택된 서브 카테고리
  final FoodSubcategory subcategory;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final foodItems = FoodItem.foodItemsBySubcategory[subcategory.id] ?? [];

    return Scaffold(
      backgroundColor: colors.surface,
      body: SafeArea(
        child: Column(
          children: [
            // 상단 뒤로가기 버튼
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: colors.textPrimary,
                      size: 28,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),

            // 구분선 (점 3개)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                  const SizedBox(width: 12),
                  Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Color(0xFFF2780D),
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
            ),

            // 제목
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'food.result_title'.tr(args: [subcategory.koreanName]),
                  style: AppTypography.headingJakarta.copyWith(
                    color: colors.textPrimary,
                  ),
                ),
              ),
            ),

            // 음식 아이템 그리드
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 12,
                    childAspectRatio: 173 / 227,
                  ),
                  itemCount: foodItems.length,
                  itemBuilder: (context, index) {
                    final foodItem = foodItems[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => FoodFinalScreen(foodItem: foodItem),
                          ),
                        );
                      },
                      child: FoodResultCard(foodItem: foodItem),
                    );
                  },
                ),
              ),
            ),

            // 랜덤 추천 버튼
            Padding(
              padding: const EdgeInsets.all(12),
              child: SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    // 랜덤으로 음식 선택
                    if (foodItems.isNotEmpty) {
                      final randomIndex =
                          DateTime.now().millisecond % foodItems.length;
                      final randomFood = foodItems[randomIndex];

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'food.final_result'
                                .tr(args: [randomFood.koreanName]),
                          ),
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF2780D),
                    foregroundColor: const Color(0xFFFCFAF8),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: Text(
                    'food.recommend_anything'.tr(),
                    style: AppTypography.body.copyWith(
                      color: const Color(0xFFFCFAF8),
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
    );
  }
}
