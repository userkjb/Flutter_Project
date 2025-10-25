import 'package:template/features/food_recommendation/models/food_item.dart';

/// 면 요리 메뉴 모델
class NoodleMenu {
  /// [NoodleMenu] 생성자
  const NoodleMenu({
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
      subcategoryId: 'noodles',
    );
  }

  /// 면 요리 메뉴 목록
  static const menus = [
    NoodleMenu(
      id: 'kalguksu',
      name: '칼국수',
      imagePath: 'assets/images/kalguksu.png',
    ),
    NoodleMenu(
      id: 'janchi_guksu',
      name: '잔치국수',
      imagePath: 'assets/images/janchi_guksu.png',
    ),
    NoodleMenu(
      id: 'naengmyeon',
      name: '냉면',
      imagePath: 'assets/images/naengmyeon.png',
    ),
    NoodleMenu(
      id: 'kongguksu',
      name: '콩국수',
      imagePath: 'assets/images/kongguksu.png',
    ),
  ];
}
