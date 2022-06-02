
class Category {
  final String categoryImage, categoryTitle;

  const Category({required this.categoryImage, required this.categoryTitle});
}

const List<Category> demoCategories = [
  Category(categoryImage: "assets/images/headache.jpg", categoryTitle: "Headache" ),
  Category(categoryImage: "assets/images/Supplements.jpg", categoryTitle: "Supplement" ),
  Category(categoryImage: "assets/images/infants.png", categoryTitle: "Infants" ),
  Category(categoryImage: "assets/images/cough.png", categoryTitle: "Cough" ),
];
