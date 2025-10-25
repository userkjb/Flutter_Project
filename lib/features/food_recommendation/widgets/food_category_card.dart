import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:template/core/themes/app_typography.dart';
import 'package:template/features/food_recommendation/models/food_category.dart';

/// 음식 카테고리 카드 위젯
class FoodCategoryCard extends StatelessWidget {
  /// [FoodCategoryCard] 생성자
  const FoodCategoryCard({
    required this.category,
    required this.isSelected,
    super.key,
  });

  /// 음식 카테고리
  final FoodCategory category;

  /// 선택 여부
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
        border: isSelected
            ? Border.all(
                color: const Color(0xFFF2780D),
                width: 3,
              )
            : null,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 아이콘
          SvgPicture.asset(
            category.iconPath,
            width: 48,
            height: 48,
          ),
          const SizedBox(height: 16),
          // 카테고리 이름
          Text(
            category.name,
            style: AppTypography.cardTextJakarta.copyWith(
              color: const Color(0xFF1C140D),
            ),
          ),
        ],
      ),
    );
  }
}
