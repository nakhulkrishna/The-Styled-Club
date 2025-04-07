import 'dart:developer';
import 'dart:io';

import 'package:clothingstore/features/data/models/banner/banner_model.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

class BannersRepositorys {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  //* Fecth Banne
  Future<List<BannerModel>> fecthBanner() async {
    try {
      log("facth Banner called");
      final snapshot = await _db.collection("Banners").get();

      final result =
          snapshot.docs.map((doc) => BannerModel.fromSnapshot(doc)).toList();
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
