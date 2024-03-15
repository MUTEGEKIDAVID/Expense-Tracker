class CategoryEntity {
  String CategoryID;
  String name;
  int totalExpanses;
  String icon;
  String color;

  CategoryEntity({
    required this.CategoryID,
    required this.name,
    required this.color,
    required this.icon,
    required this.totalExpanses
  });
//firebase only understands maps
  Map<String,Object?> toDocument(){
    return {
    'CategoryID':CategoryID,
    'name':name,
     'totalExpanses':totalExpanses,
    'icon': icon,
    'color':color,

    };
  }

  static CategoryEntity fromDocument(Map<String,dynamic> doc){
    return CategoryEntity(
        CategoryID: doc["CategoryID"],
        name: doc['name'],
        color: doc['color'],
        icon: doc['icon'],
        totalExpanses: doc['totalExpanses']
    );
  }
}