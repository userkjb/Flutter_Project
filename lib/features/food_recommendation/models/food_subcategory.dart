/// 음식 서브 카테고리 모델
class FoodSubcategory {
  /// [FoodSubcategory] 생성자
  const FoodSubcategory({
    required this.id,
    required this.koreanName,
    required this.englishName,
    required this.iconPath,
  });

  /// 고유 식별자
  final String id;

  /// 한국어 이름
  final String koreanName;

  /// 영어 이름
  final String englishName;

  /// 아이콘 경로
  final String iconPath;

  /// 카테고리별 서브 카테고리 목록
  static const subcategoriesByCategory = {
    'korean': [
      FoodSubcategory(
        id: 'rice',
        koreanName: '밥',
        englishName: 'Rice',
        iconPath: 'assets/images/rice.svg',
      ),
      FoodSubcategory(
        id: 'noodles',
        koreanName: '면',
        englishName: 'Noodles',
        iconPath: 'assets/images/noodles.svg',
      ),
      FoodSubcategory(
        id: 'meat',
        koreanName: '고기',
        englishName: 'Meat',
        iconPath: 'assets/images/meat.svg',
      ),
      FoodSubcategory(
        id: 'seafood',
        koreanName: '해산물',
        englishName: 'Seafood',
        iconPath: 'assets/images/seafood.svg',
      ),
      FoodSubcategory(
        id: 'vegetables',
        koreanName: '채소',
        englishName: 'Vegetables',
        iconPath: 'assets/images/vegetables.svg',
      ),
    ],
    'chinese': [
      FoodSubcategory(
        id: 'rice',
        koreanName: '밥',
        englishName: 'Rice',
        iconPath: 'assets/images/rice.svg',
      ),
      FoodSubcategory(
        id: 'noodles',
        koreanName: '면',
        englishName: 'Noodles',
        iconPath: 'assets/images/noodles.svg',
      ),
      FoodSubcategory(
        id: 'meat',
        koreanName: '고기',
        englishName: 'Meat',
        iconPath: 'assets/images/meat.svg',
      ),
      FoodSubcategory(
        id: 'seafood',
        koreanName: '해산물',
        englishName: 'Seafood',
        iconPath: 'assets/images/seafood.svg',
      ),
      FoodSubcategory(
        id: 'vegetables',
        koreanName: '채소',
        englishName: 'Vegetables',
        iconPath: 'assets/images/vegetables.svg',
      ),
    ],
    'japanese': [
      FoodSubcategory(
        id: 'rice',
        koreanName: '밥',
        englishName: 'Rice',
        iconPath: 'assets/images/rice.svg',
      ),
      FoodSubcategory(
        id: 'noodles',
        koreanName: '면',
        englishName: 'Noodles',
        iconPath: 'assets/images/noodles.svg',
      ),
      FoodSubcategory(
        id: 'meat',
        koreanName: '고기',
        englishName: 'Meat',
        iconPath: 'assets/images/meat.svg',
      ),
      FoodSubcategory(
        id: 'seafood',
        koreanName: '해산물',
        englishName: 'Seafood',
        iconPath: 'assets/images/seafood.svg',
      ),
      FoodSubcategory(
        id: 'vegetables',
        koreanName: '채소',
        englishName: 'Vegetables',
        iconPath: 'assets/images/vegetables.svg',
      ),
    ],
    'western': [
      FoodSubcategory(
        id: 'rice',
        koreanName: '밥',
        englishName: 'Rice',
        iconPath: 'assets/images/rice.svg',
      ),
      FoodSubcategory(
        id: 'noodles',
        koreanName: '면',
        englishName: 'Noodles',
        iconPath: 'assets/images/noodles.svg',
      ),
      FoodSubcategory(
        id: 'meat',
        koreanName: '고기',
        englishName: 'Meat',
        iconPath: 'assets/images/meat.svg',
      ),
      FoodSubcategory(
        id: 'seafood',
        koreanName: '해산물',
        englishName: 'Seafood',
        iconPath: 'assets/images/seafood.svg',
      ),
      FoodSubcategory(
        id: 'vegetables',
        koreanName: '채소',
        englishName: 'Vegetables',
        iconPath: 'assets/images/vegetables.svg',
      ),
    ],
  };
}
