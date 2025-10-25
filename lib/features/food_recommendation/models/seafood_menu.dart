import 'package:template/features/food_recommendation/models/food_item.dart';

/// 해산물 요리 메뉴 모델
class SeafoodMenu {
  /// [SeafoodMenu] 생성자
  const SeafoodMenu({
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
      subcategoryId: 'seafood',
    );
  }

  /// 해산물 요리 메뉴 목록
  static const menus = [
    SeafoodMenu(
      id: 'haemul_jjim',
      name: '해물찜',
      imagePath: 'assets/images/haemul_jjim.png',
    ),
    SeafoodMenu(
      id: 'saengseon_gui',
      name: '생선구이',
      imagePath: 'assets/images/saengseon_gui.png',
    ),
    SeafoodMenu(
      id: 'hoe',
      name: '회',
      imagePath: 'assets/images/hoe.png',
    ),
    SeafoodMenu(
      id: 'nakji_bokkeum',
      name: '낙지볶음',
      imagePath: 'assets/images/nakji_bokkeum.png',
    ),
  ];
}
