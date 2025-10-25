import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:template/core/themes/app_typography.dart';
import 'package:template/features/food_recommendation/models/food_subcategory.dart';
import 'package:template/features/food_recommendation/models/noodle_menu.dart';
import 'package:template/features/food_recommendation/screens/food_final_screen.dart';

/// 면 요리 선택 화면
class FoodNoodleSelectionScreen extends StatelessWidget {
  /// [FoodNoodleSelectionScreen] 생성자
  const FoodNoodleSelectionScreen({
    required this.subcategory,
    super.key,
  });

  /// 선택된 서브카테고리 (면)
  final FoodSubcategory subcategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F7F5),
      body: SafeArea(
        child: Column(
          children: [
            // 상단 헤더 (뒤로가기 버튼)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: SvgPicture.asset(
                  'assets/images/noodle_background.svg',
                  width: 390,
                  height: 72,
                ),
              ),
            ),

            // 구분선 아이콘
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: SvgPicture.asset(
                'assets/images/noodle_dots.svg',
                width: 390,
                height: 48,
              ),
            ),

            // 제목
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 12),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'food.noodle_selection_title'.tr(),
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
                  itemCount: NoodleMenu.menus.length,
                  itemBuilder: (context, index) {
                    final menu = NoodleMenu.menus[index];
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
                        (NoodleMenu.menus.length * 0.5).floor() % NoodleMenu.menus.length;
                    final randomMenu = NoodleMenu.menus[randomIndex];

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
