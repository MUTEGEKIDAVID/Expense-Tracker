import 'package:bloc/bloc.dart';
//import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:expanse_repository/expanse_repository.dart';

part 'create_category_event.dart';
part 'create_category_state.dart';

class CreateCategoryBloc extends Bloc<CreateCategoryEvent, CreateCategoryState> {
  final ExpanseRepository expanseRepository;
  CreateCategoryBloc(this.expanseRepository) : super(CreateCategoryInitial()) {
    on<createCategory>((event, emit) async{
      // TODO: implement event handler
      emit(CreateCategoryLoading());
      try{
        await expanseRepository.createcategory(event.category);
        emit(CreateCategorySuccess());

      }catch(e){
        emit(CreateCategoryFailure());

      }
    });
  }
}
