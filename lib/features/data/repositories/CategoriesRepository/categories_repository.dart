import 'dart:developer';
import 'dart:io';

import 'package:clothingstore/features/data/models/categories/categories_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

class CategoriesRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  //* Fecth Categories
  Future<List<CategoryModel>> fecthCategories() async {
    try {
      log("facth categories called");
      final snapshot = await _db.collection("Categories").get();

      final result =
          snapshot.docs.map((doc) => CategoryModel.fromSnapshot(doc)).toList();
      return result;
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
