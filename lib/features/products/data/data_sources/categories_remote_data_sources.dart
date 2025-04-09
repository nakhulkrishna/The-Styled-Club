import 'dart:developer';

import 'package:clothingstore/features/products/data/models/categories_model/categories_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CategoriesRemoteDataSources {
  final FirebaseFirestore firestore;

  CategoriesRemoteDataSources({required this.firestore});

  Future<List<CategoryModel>> fecthAllNormalCategories() async {
    final snapShot =
        await firestore
            .collection("Categories")
            .where("isMinimalStyle", isEqualTo: false)
            .where("isSharpDressing", isEqualTo: false) // corrected spelling
            .get();

    return snapShot.docs
        .map((categories) => CategoryModel.fromSnapshot(categories))
        .toList();
  }

  Future<List<CategoryModel>> fecthAllMinimalStyle() async {
    final snapShot =
        await firestore
            .collection("Categories")
            .where("isMinimalStyle", isEqualTo: true)
            .get();

    return snapShot.docs
        .map((categories) => CategoryModel.fromSnapshot(categories))
        .toList();
  }

  Future<List<CategoryModel>> fecthAllSharpDressing() async {
    final snapShot =
        await firestore
            .collection("Categories")
            .where("isSharpDressing", isEqualTo: true)
            .get();

    return snapShot.docs
        .map((categories) => CategoryModel.fromSnapshot(categories))
        .toList();
  }
}
