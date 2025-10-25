import 'package:template/features/food_recommendation/models/food_item.dart';

/// 고기 요리 메뉴 모델
class MeatMenu {
  /// [MeatMenu] 생성자
  const MeatMenu({
    required this.id,
    required this.name,
    required this.imagePath,
  });

  /// 고유 식별자
  final String id;

  /// 메뉴 이름
  final String name;

  /// 이미지 경로
  final String imagePath;

  /// FoodItem으로 변환
  FoodItem toFoodItem() {
    return FoodItem(
      id: id,
      koreanName: name,
      englishName: name,
      imagePath: imagePath,
      subcategoryId: 'meat',
    );
  }

  /// 고기 요리 메뉴 목록
  static const menus = [
    MeatMenu(
      id: 'samgyeopsal',
      name: '삼겹살',
      imagePath: 'assets/images/samgyeopsal.png',
    ),
    MeatMenu(
      id: 'bulgogi',
      name: '불고기',
      imagePath: 'assets/images/bulgogi.png',
    ),
    MeatMenu(
      id: 'dakgalbi',
      name: '닭갈비',
      imagePath: 'assets/images/dakgalbi.png',
    ),
    MeatMenu(
      id: 'galbi',
      name: '갈비',
      imagePath: 'assets/images/galbi.png',
    ),
  ];
}
