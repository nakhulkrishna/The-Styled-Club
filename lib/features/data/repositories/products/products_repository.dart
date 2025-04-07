import 'dart:developer';
import 'dart:io';

import 'package:clothingstore/features/data/models/products/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

class ProductsRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<ProductModel>> fecthAllProduct() async {
    try {
      final snapshot = await _db.collection("Products").get();

      for (var doc in snapshot.docs) {
        log(doc.data().toString());
      }
      return snapshot.docs
          .map((querySnapshot) => ProductModel.fromSnapshot(querySnapshot))
          .toList();
    } on FirebaseException catch (e) {
      throw e.message!;
    } on SocketException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw e.message!;
    } catch (e) {
      throw e.toString();
    }
  }
}
