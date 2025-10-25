import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:template/core/themes/app_colors.dart';
import 'package:template/core/themes/app_typography.dart';
import 'package:template/features/food_recommendation/models/food_subcategory.dart';
import 'package:template/features/food_recommendation/models/meat_menu.dart';
import 'package:template/features/food_recommendation/screens/food_final_screen.dart';

/// 고기 요리 선택 화면
class FoodMeatSelectionScreen extends StatelessWidget {
  /// [FoodMeatSelectionScreen] 생성자
  const FoodMeatSelectionScreen({
    required this.subcategory,
    super.key,
  });

  /// 선택된 서브카테고리 (고기)
  final FoodSubcategory subcategory;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

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
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 12),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'food.meat_selection_title'.tr(),
                  style: AppTypography.heading.copyWith(
                    color: const Color(0xFF1C140D),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            // 메뉴 그리드
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 12,
                    childAspectRatio: 173 / 243,
                  ),
                  itemCount: MeatMenu.menus.length,
                  itemBuilder: (context, index) {
                    final menu = MeatMenu.menus[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => FoodFinalScreen(
                              foodItem: menu.toFoodItem(),
                            ),
                          ),
                        );
                      },
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0x00000000),
                              Color(0x66000000),
                            ],
                          ),
                          image: DecorationImage(
                            image: AssetImage(menu.imagePath),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                menu.name,
                                style: AppTypography.body.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
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
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    // 랜덤으로 메뉴 선택
                    final randomIndex =
                        (MeatMenu.menus.length * 0.5).floor() % MeatMenu.menus.length;
                    final randomMenu = MeatMenu.menus[randomIndex];

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'food.random_result'.tr(
                            args: [randomMenu.name],
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
