import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:template/core/themes/app_typography.dart';
import 'package:template/features/food_recommendation/models/food_category.dart';
import 'package:template/features/food_recommendation/models/food_subcategory.dart';
import 'package:template/features/food_recommendation/screens/food_noodle_selection_screen.dart';
import 'package:template/features/food_recommendation/screens/food_result_screen.dart';
import 'package:template/features/food_recommendation/widgets/food_subcategory_card.dart';

/// 음식 상세 카테고리 화면
class FoodDetailScreen extends StatelessWidget {
  /// [FoodDetailScreen] 생성자
  const FoodDetailScreen({
    required this.category,
    super.key,
  });

  /// 선택된 음식 카테고리
  final FoodCategory category;

  @override
  Widget build(BuildContext context) {
    final subcategories =
        FoodSubcategory.subcategoriesByCategory[category.id] ?? [];

    return Scaffold(
      backgroundColor: const Color(0xFFF8F7F5),
      body: SafeArea(
        child: Column(
          children: [
            // 상단 헤더 (뒤로가기 버튼 + 제목)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 64, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // 뒤로가기 버튼
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: SvgPicture.asset(
                      'assets/images/back_button.svg',
                      width: 48,
                      height: 48,
                    ),
                  ),
                  // 제목
                  Expanded(
                    child: Text(
                      'food.detail_title'.tr(args: [category.name]),
                      style: AppTypography.title.copyWith(
                        color: const Color(0xFF1F2937),
                        fontSize: 18,
                        letterSpacing: -0.015 * 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),

            // 구분선 아이콘
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: SvgPicture.asset(
                'assets/images/divider_dots.svg',
                width: 390,
                height: 48,
              ),
            ),

            // 서브 카테고리 그리드
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 12,
                    childAspectRatio: 173 / 115,
                  ),
                  itemCount: subcategories.length,
                  itemBuilder: (context, index) {
                    final subcategory = subcategories[index];
                    // 마지막 항목(채소)은 전체 너비로 표시
                    if (index == subcategories.length - 1 &&
                        subcategories.length.isOdd) {
                      return GridTile(
                        child: GestureDetector(
                          onTap: () {
                            // 면(noodles)을 선택한 경우 면 선택 화면으로 이동
                            if (subcategory.id == 'noodles') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => FoodNoodleSelectionScreen(
                                    subcategory: subcategory,
                                  ),
                                ),
                              );
                            } else {
                              // 다른 카테고리는 기존대로 결과 화면으로 이동
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => FoodResultScreen(
                                    subcategory: subcategory,
                                  ),
                                ),
                              );
                            }
                          },
                          child: FoodSubcategoryCard(
                            subcategory: subcategory,
                            isFullWidth: true,
                          ),
                        ),
                      );
                    }
                    return GestureDetector(
                      onTap: () {
                        // 면(noodles)을 선택한 경우 면 선택 화면으로 이동
                        if (subcategory.id == 'noodles') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => FoodNoodleSelectionScreen(
                                subcategory: subcategory,
                              ),
                            ),
                          );
                        } else {
                          // 다른 카테고리는 기존대로 결과 화면으로 이동
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => FoodResultScreen(
                                subcategory: subcategory,
                              ),
                            ),
                          );
                        }
                      },
                      child: FoodSubcategoryCard(
                        subcategory: subcategory,
                        isFullWidth: false,
                      ),
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
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    // 랜덤으로 서브카테고리 선택
                    final randomIndex =
                        (subcategories.length * 0.5).floor() % subcategories.length;
                    final randomSubcategory = subcategories[randomIndex];

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'food.random_result'.tr(
                            args: [randomSubcategory.koreanName],
                          ),
                        ),
                        duration: const Duration(seconds: 2),
                      ),
                    );
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
                    'food.recommend_anything'.tr(),
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
    );
  }
}
