import 'dart:developer';

import 'package:clothingstore/features/products/data/models/products_model/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductRemoteDataSources {
  final FirebaseFirestore firestore;

  ProductRemoteDataSources({required this.firestore});

  //  Fetching All Men New Arrived Products
  Future<List<ProductModel>> fetchAllMenNewArrivelProducts() async {
    final snapShot = await firestore.collection("Products").get();
    return snapShot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
  }

  //  Fetching Top Picks Products (All)
  Future<List<ProductModel>> fetchAllMenTopPicksProducts() async {
    final snapShot =
        await firestore
            .collection("Products")
            .orderBy('SoldQuantity', descending: true)
            .limit(300)
            .get();
    return snapShot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
  }

  // 🔹 Fetching Sharp Dressing Products (All)
  // Future<List<ProductModel>> fetchAllMenSharpDressingProducts() async {
  //   final snapShot =
  //       await firestore
  //           .collection("Products")
  //           .orderBy('SoldQuantity', descending: true)
  //           .limit(300)
  //           .get();
  //   return snapShot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
  // }

  Future<List<ProductModel>> fecthNormalCategorieBasedProducts(
    String categorieId,
    String itemCategory,
  ) async {
    final snapShot =
        await firestore
            .collection("Products")
            .where('CategoryId', isEqualTo: categorieId)
            .where('itemCategory', isEqualTo: itemCategory)
            .get();

    final products =
        snapShot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
    log(products.toString());
    return products;
  }

  Future<List<ProductModel>> fecthMinimalStyleCategorieBasedProducts(
    String itemCategory,
    String categoryId,
  ) async {
    final snapShot =
        await firestore
            .collection("Products")
            .where('itemCategory', isEqualTo: itemCategory)
            .where('CategoryId', isEqualTo: categoryId)
            .get();

    final products =
        snapShot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
    log(products.toString());
    return products;
  }

  Future<List<ProductModel>> fecthSharpDressungCategorieBasedProducts(
    String itemCategory,
    String categoryId,
  ) async {
    final snapShot =
        await firestore
            .collection("Products")
            .where('itemCategory', isEqualTo: itemCategory)
            .where('CategoryId', isEqualTo: categoryId)
            .get();

    final products =
        snapShot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
    log(products.toString());
    return products;
  }

  // 🔹 Fetching All WOMEN Products
  // Future<List<ProductModel>> fetchAllWomenNewArrivedProducts() async {
  //   final snapShot =
  //       await firestore
  //           .collection("Products")
  //           .where("itemCategory", isEqualTo: "women")
  //           .get();
  //   return snapShot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
  // }

  // // 🔹 Fetching WOMEN Top Picks
  // Future<List<ProductModel>> fetchWomenTopPicksProducts() async {
  //   final snapShot =
  //       await firestore
  //           .collection("Products")
  //           .where("itemCategory", isEqualTo: "women")
  //           .orderBy('SoldQuantity', descending: true)
  //           .limit(300)
  //           .get();
  //   return snapShot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
  // }

  // // 🔹 Fetching WOMEN Sharp Dressing
  // Future<List<ProductModel>> fetchAllWomenSharpDressing() async {
  //   final snapShot =
  //       await firestore
  //           .collection("Products")
  //           .where("itemCategory", isEqualTo: "women")
  //           .orderBy('SoldQuantity', descending: true)
  //           .limit(300)
  //           .get();
  //   return snapShot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
  // }

  // Future<List<ProductModel>> fetchAllAdorNewArrivedProducts() async {
  //   final snapShot =
  //       await firestore
  //           .collection("Products")
  //           .where("itemCategory", isEqualTo: "Ador")
  //           .get();
  //   return snapShot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
  // }

  // // 🔹 Fetching Ador Top Picks
  // Future<List<ProductModel>> fetchAdorTopPicksProducts() async {
  //   final snapShot =
  //       await firestore
  //           .collection("Products")
  //           .where("itemCategory", isEqualTo: "Ador")
  //           .orderBy('SoldQuantity', descending: true)
  //           .limit(300)
  //           .get();
  //   return snapShot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
  // }

  // // 🔹 Fetching Ador Sharp Dressing
  // Future<List<ProductModel>> fetchAllAdorSharpDressing() async {
  //   final snapShot =
  //       await firestore
  //           .collection("Products")
  //           .where("itemCategory", isEqualTo: "women")
  //           .orderBy('SoldQuantity', descending: true)
  //           .limit(300)
  //           .get();
  //   return snapShot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
  // }
}
