import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:template/features/food_recommendation/models/food_subcategory.dart';

/// 음식 서브 카테고리 카드 위젯
class FoodSubcategoryCard extends StatelessWidget {
  /// [FoodSubcategoryCard] 생성자
  const FoodSubcategoryCard({
    required this.subcategory,
    required this.isFullWidth,
    super.key,
  });

  /// 음식 서브 카테고리
  final FoodSubcategory subcategory;

  /// 전체 너비 여부
  final bool isFullWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF8F7F5),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFFF2780D).withValues(alpha: 0.2),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(17, 15, 17, 17),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // 아이콘
          SvgPicture.asset(
            subcategory.iconPath,
            height: 28,
          ),
          const SizedBox(height: 10),
          // 한국어 이름
          Text(
            subcategory.koreanName,
            style: const TextStyle(
              fontFamily: 'Plus Jakarta Sans',
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1F2937),
              height: 1.25,
            ),
          ),
          const SizedBox(height: 4),
          // 영어 이름
          Text(
            subcategory.englishName,
            style: const TextStyle(
              fontFamily: 'Plus Jakarta Sans',
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xFF6B7280),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
