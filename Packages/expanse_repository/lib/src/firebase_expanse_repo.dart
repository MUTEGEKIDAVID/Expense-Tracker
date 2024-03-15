import 'dart:math';

import '../expanse_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseExpanseRepo implements ExpanseRepository{
  final categoryCollections= FirebaseFirestore.instance.collection('categories');
  final expanseCollections= FirebaseFirestore.instance.collection('expanses');
  @override
  Future<void> createcategory(Category category) async {
    try{
      await categoryCollections
          .doc(category.CategoryID)
          .set(category.toEntity().toDocument());

    }catch(e){
      log(e.toString() as num);
      rethrow;

    }
  }
  @override
  Future<List<Category>> getcategory() async {
    try{
      return await categoryCollections

          .get().then((value) => value.docs.map((e) =>
          Category.fromEntity(CategoryEntity.fromDocument(e.data()))
      ).toList()
      );
    

    }catch(e){
      log(e.toString() as num);
      rethrow;

    }
  }

}