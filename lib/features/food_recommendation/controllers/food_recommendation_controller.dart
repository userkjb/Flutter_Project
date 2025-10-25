import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:template/features/food_recommendation/models/food_category.dart';

/// 음식 추천 상태 관리
final foodRecommendationControllerProvider =
    NotifierProvider<FoodRecommendationController, FoodCategory?>(
  FoodRecommendationController.new,
);

/// 음식 추천 컨트롤러
///
/// 음식 카테고리 목록 관리 및 랜덤 추천 기능을 제공합니다.
class FoodRecommendationController extends Notifier<FoodCategory?> {
  @override
  FoodCategory? build() {
    return null;
  }

  /// 랜덤으로 음식 카테고리를 추천합니다.
  void recommendRandomFood() {
    final random = Random();
    final randomIndex = random.nextInt(FoodCategory.defaultCategories.length);
    state = FoodCategory.defaultCategories[randomIndex];
  }

  /// 추천 결과를 초기화합니다.
  void reset() {
    state = null;
  }
}
