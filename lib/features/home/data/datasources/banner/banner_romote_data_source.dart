import 'dart:io';

import 'package:clothingstore/features/home/data/models/banner/men_banner_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class BannerRemoteDataSource {
  final FirebaseFirestore firestore;

  BannerRemoteDataSource({required this.firestore});

  Future<List<BannerModel>> fecthManBanners() async {
    try {
      final snapShot =
          await firestore
              .collection("Banners")
              .where('itemCategory', isEqualTo: 'man')
              .get();
      return snapShot.docs.map((doc) => BannerModel.fromSnapshot(doc)).toList();
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

  Future<List<BannerModel>> fetchWomenBanners() async {
    try {
      final snapShot =
          await firestore
              .collection("Banners")
              .where('itemCategory', isEqualTo: 'woman') // 👈 condition here
              .get();

      return snapShot.docs.map((doc) => BannerModel.fromSnapshot(doc)).toList();
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

  Future<List<BannerModel>> fecthAdornmentBanners() async {
    try {
      final snapShot =
          await firestore
              .collection("Banners")
              .where('isAdornments', isEqualTo: 'Adornments')
              .get();
      return snapShot.docs.map((doc) => BannerModel.fromSnapshot(doc)).toList();
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
