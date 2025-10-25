/// 음식 아이템 모델
class FoodItem {
  /// [FoodItem] 생성자
  const FoodItem({
    required this.id,
    required this.koreanName,
    required this.englishName,
    required this.imagePath,
    required this.subcategoryId,
  });

  /// 고유 식별자
  final String id;

  /// 한국어 이름
  final String koreanName;

  /// 영어 이름
  final String englishName;

  /// 이미지 경로
  final String imagePath;

  /// 서브 카테고리 ID
  final String subcategoryId;

  /// 서브 카테고리별 음식 아이템 목록
  static const foodItemsBySubcategory = {
    'rice': [
      FoodItem(
        id: 'gukbap',
        koreanName: '국밥',
        englishName: 'Gukbap',
        imagePath: 'assets/images/food/gukbap.png',
        subcategoryId: 'rice',
      ),
      FoodItem(
        id: 'jjigae',
        koreanName: '찌개',
        englishName: 'Jjigae',
        imagePath: 'assets/images/food/jjigae.png',
        subcategoryId: 'rice',
      ),
      FoodItem(
        id: 'baekban',
        koreanName: '백반',
        englishName: 'Baekban',
        imagePath: 'assets/images/food/baekban.png',
        subcategoryId: 'rice',
      ),
      FoodItem(
        id: 'bibimbap',
        koreanName: '비빔밥',
        englishName: 'Bibimbap',
        imagePath: 'assets/images/food/bibimbap.png',
        subcategoryId: 'rice',
      ),
    ],
    'noodles': [
      FoodItem(
        id: 'gukbap',
        koreanName: '국밥',
        englishName: 'Gukbap',
        imagePath: 'assets/images/food/gukbap.png',
        subcategoryId: 'noodles',
      ),
      FoodItem(
        id: 'jjigae',
        koreanName: '찌개',
        englishName: 'Jjigae',
        imagePath: 'assets/images/food/jjigae.png',
        subcategoryId: 'noodles',
      ),
      FoodItem(
        id: 'baekban',
        koreanName: '백반',
        englishName: 'Baekban',
        imagePath: 'assets/images/food/baekban.png',
        subcategoryId: 'noodles',
      ),
      FoodItem(
        id: 'bibimbap',
        koreanName: '비빔밥',
        englishName: 'Bibimbap',
        imagePath: 'assets/images/food/bibimbap.png',
        subcategoryId: 'noodles',
      ),
    ],
    'meat': [
      FoodItem(
        id: 'gukbap',
        koreanName: '국밥',
        englishName: 'Gukbap',
        imagePath: 'assets/images/food/gukbap.png',
        subcategoryId: 'meat',
      ),
      FoodItem(
        id: 'jjigae',
        koreanName: '찌개',
        englishName: 'Jjigae',
        imagePath: 'assets/images/food/jjigae.png',
        subcategoryId: 'meat',
      ),
      FoodItem(
        id: 'baekban',
        koreanName: '백반',
        englishName: 'Baekban',
        imagePath: 'assets/images/food/baekban.png',
        subcategoryId: 'meat',
      ),
      FoodItem(
        id: 'bibimbap',
        koreanName: '비빔밥',
        englishName: 'Bibimbap',
        imagePath: 'assets/images/food/bibimbap.png',
        subcategoryId: 'meat',
      ),
    ],
    'seafood': [
      FoodItem(
        id: 'gukbap',
        koreanName: '국밥',
        englishName: 'Gukbap',
        imagePath: 'assets/images/food/gukbap.png',
        subcategoryId: 'seafood',
      ),
      FoodItem(
        id: 'jjigae',
        koreanName: '찌개',
        englishName: 'Jjigae',
        imagePath: 'assets/images/food/jjigae.png',
        subcategoryId: 'seafood',
      ),
      FoodItem(
        id: 'baekban',
        koreanName: '백반',
        englishName: 'Baekban',
        imagePath: 'assets/images/food/baekban.png',
        subcategoryId: 'seafood',
      ),
      FoodItem(
        id: 'bibimbap',
        koreanName: '비빔밥',
        englishName: 'Bibimbap',
        imagePath: 'assets/images/food/bibimbap.png',
        subcategoryId: 'seafood',
      ),
    ],
    'vegetables': [
      FoodItem(
        id: 'gukbap',
        koreanName: '국밥',
        englishName: 'Gukbap',
        imagePath: 'assets/images/food/gukbap.png',
        subcategoryId: 'vegetables',
      ),
      FoodItem(
        id: 'jjigae',
        koreanName: '찌개',
        englishName: 'Jjigae',
        imagePath: 'assets/images/food/jjigae.png',
        subcategoryId: 'vegetables',
      ),
      FoodItem(
        id: 'baekban',
        koreanName: '백반',
        englishName: 'Baekban',
        imagePath: 'assets/images/food/baekban.png',
        subcategoryId: 'vegetables',
      ),
      FoodItem(
        id: 'bibimbap',
        koreanName: '비빔밥',
        englishName: 'Bibimbap',
        imagePath: 'assets/images/food/bibimbap.png',
        subcategoryId: 'vegetables',
      ),
    ],
  };
}
