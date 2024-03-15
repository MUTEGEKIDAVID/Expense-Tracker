import 'package:expanse_repository/expanse_repository.dart';

abstract class ExpanseRepository{
  Future<void> createcategory(Category category);
  Future<List<Category>> getcategory();

}