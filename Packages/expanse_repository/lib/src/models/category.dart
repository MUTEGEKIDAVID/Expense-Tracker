import '../entities/category_entities.dart';

class Category {
  String CategoryID;
  String name;
  int totalExpanses;
  String icon;
  String color;

  Category({
    required this.CategoryID,
    required this.name,
    required this.color,
    required this.icon,
    required this.totalExpanses
});

  static final empty = Category(
      CategoryID: '',
      name: '',
      color: '',
      icon: '',
      totalExpanses: 0
  );

  CategoryEntity toEntity(){

    return CategoryEntity(
        CategoryID:CategoryID,
         name:name,
        totalExpanses:totalExpanses,
         icon:icon,
         color:color

    );
  }

  static Category fromEntity(CategoryEntity entity){

    return Category(
        CategoryID:entity.CategoryID,
        name:entity.name,
        totalExpanses:entity.totalExpanses,
        icon:entity.icon,
        color:entity.color
    );
  }


}