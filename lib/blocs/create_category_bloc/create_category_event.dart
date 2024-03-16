part of 'create_category_bloc.dart';


@immutable
sealed class CreateCategoryEvent {

}

class createCategory extends CreateCategoryEvent{
  final Category category;

  createCategory({required this.category});
}
