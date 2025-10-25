import 'package:flutter/material.dart';

import 'package:template/features/food_recommendation/models/food_item.dart';

/// 음식 추천 결과 카드 위젯
class FoodResultCard extends StatelessWidget {
  /// [FoodResultCard] 생성자
  const FoodResultCard({
    required this.foodItem,
    super.key,
  });

  /// 음식 아이템
  final FoodItem foodItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            Color(0x66000000), // rgba(0, 0, 0, 0.4)
          ],
        ),
        image: DecorationImage(
          image: AssetImage(foodItem.imagePath),
          fit: BoxFit.cover,
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            foodItem.englishName,
            style: const TextStyle(
              fontFamily: 'Plus Jakarta Sans',
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              height: 1.25,
            ),
          ),
        ],
      ),
    );
  }
}
