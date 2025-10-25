/// 음식 카테고리 모델
class FoodCategory {
  /// [FoodCategory] 생성자
  const FoodCategory({
    required this.id,
    required this.name,
    required this.iconPath,
  });

  /// 고유 식별자
  final String id;

  /// 카테고리 이름
  final String name;

  /// 아이콘 경로
  final String iconPath;

  /// 기본 음식 카테고리 목록
  static const defaultCategories = [
    FoodCategory(
      id: 'korean',
      name: '한식',
      iconPath: 'assets/images/korean_food.svg',
    ),
    FoodCategory(
      id: 'chinese',
      name: '중식',
      iconPath: 'assets/images/chinese_food.svg',
    ),
    FoodCategory(
      id: 'japanese',
      name: '일식',
      iconPath: 'assets/images/japanese_food.svg',
    ),
    FoodCategory(
      id: 'western',
      name: '양식',
      iconPath: 'assets/images/western_food.svg',
    ),
  ];
}
