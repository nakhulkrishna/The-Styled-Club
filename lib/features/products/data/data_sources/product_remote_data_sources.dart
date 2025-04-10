import 'dart:developer';

import 'package:clothingstore/features/products/data/models/products_model/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductRemoteDataSources {
  final FirebaseFirestore firestore;

  ProductRemoteDataSources({required this.firestore});
  //========================MEN===========================//
  Future<List<ProductModel>> getMenNewArrivals() async {
    final snapshot = await firestore.collection("Products").get();
    return snapshot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
  }

  Future<List<ProductModel>> getMenTopPicks() async {
    final snapshot =
        await firestore
            .collection("Products")
            .orderBy('SoldQuantity', descending: true)
            .limit(300)
            .get();
    return snapshot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
  }

  Future<List<ProductModel>> getMenProductsByCategory({
    required String categoryId,
    required String itemCategory,
  }) async {
    final snapshot =
        await firestore
            .collection("Products")
            .where('CategoryId', isEqualTo: categoryId)
            .where('itemCategory', isEqualTo: itemCategory)
            .get();

    final products =
        snapshot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
    log(products.toString());
    return products;
  }

  Future<List<ProductModel>> getMenMinimalStyleProducts({
    required String categoryId,
    required String itemCategory,
  }) async {
    final snapshot =
        await firestore
            .collection("Products")
            .where('itemCategory', isEqualTo: itemCategory)
            .where('CategoryId', isEqualTo: categoryId)
            .get();

    final products =
        snapshot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
    log(products.toString());
    return products;
  }

  Future<List<ProductModel>> getMenSharpDressingProducts({
    required String categoryId,
    required String itemCategory,
  }) async {
    final snapshot =
        await firestore
            .collection("Products")
            .where('itemCategory', isEqualTo: itemCategory)
            .where('CategoryId', isEqualTo: categoryId)
            .get();

    final products =
        snapshot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
    log(products.toString());
    return products;
  }

  //=========================WOMEN===========================//

  Future<List<ProductModel>> getWomenNewArrivals() async {
    final snapshot = await firestore.collection("Products").get();
    return snapshot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
  }

  Future<List<ProductModel>> getWomenTopPicks() async {
    final snapshot =
        await firestore
            .collection("Products")
            .orderBy('SoldQuantity', descending: true)
            .limit(300)
            .get();
    return snapshot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
  }

  Future<List<ProductModel>> getWomenProductsByCategory({
    required String categoryId,
    required String itemCategory,
  }) async {
    final snapshot =
        await firestore
            .collection("Products")
            .where('CategoryId', isEqualTo: categoryId)
            .where('itemCategory', isEqualTo: itemCategory)
            .get();

    final products =
        snapshot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
    log(products.toString());
    return products;
  }

  Future<List<ProductModel>> getWomenMinimalStyleProducts({
    required String categoryId,
    required String itemCategory,
  }) async {
    final snapshot =
        await firestore
            .collection("Products")
            .where('itemCategory', isEqualTo: itemCategory)
            .where('CategoryId', isEqualTo: categoryId)
            .get();

    final products =
        snapshot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
    log(products.toString());
    return products;
  }

  Future<List<ProductModel>> getWomenSharpDressingProducts({
    required String categoryId,
    required String itemCategory,
  }) async {
    final snapshot =
        await firestore
            .collection("Products")
            .where('itemCategory', isEqualTo: itemCategory)
            .where('CategoryId', isEqualTo: categoryId)
            .get();

    final products =
        snapshot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
    log(products.toString());
    return products;
  }
}
