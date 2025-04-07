import 'dart:developer';

import 'package:clothingstore/features/data/models/Users/user_model.dart';
import 'package:clothingstore/features/data/models/Users/user_profile_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';

class UserRegistration {
  //* logger for debbuging and error tracking
  final Logger _logger = Logger();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  //* function for register user
  Future<User?> registerUser(String email, String password) async {
    try {
      final authCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (authCredential.user != null) {
        log("creation Done!");
        return authCredential.user;
      }
    } on FirebaseAuthException catch (e) {
      log(e.message ?? "Unknown FirebaseAuth error during sign-up");
      rethrow;
    } catch (e) {
      log("Error during sign-up: ${e.toString()}");
      rethrow;
    }
    return null;
  }

  //* function for login user
  Future<User?> loginUser(String email, String password) async {
    try {
      final authCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (authCredential.user != null) {
        log("sign in done");
        return authCredential.user;
      }
    } on FirebaseAuthException catch (e) {
      log(e.message ?? "Unknown FirebaseAuth error during login-up");
      rethrow;
    } catch (e) {
      log("Error during sign-up: ${e.toString()}");
      rethrow;
    }
    return null;
  }

  //* function for log out
  Future<void> logout() async {
    try {
      await _auth.signOut();
      log("User signed out successfully");
    } catch (e) {
      log("Error during sign-out: ${e.toString()}");
    }
  }

  Future<void> saveUserAddress({required UserModel userModel}) async {
    try {
      await _db
          .collection('users')
          .doc(userModel.uid)
          .collection('address')
          .add(userModel.toMap());
    } catch (e) {
      throw Exception("Error saving user address: ${e.toString()}");
    }
  }

  Future<List<UserModel>> fecthUserAddress(String userId) async {
    try {
      final snapshot =
          await _db.collection('users').doc(userId).collection('address').get();

      List<UserModel> userAddresses =
          snapshot.docs.map((doc) => UserModel.fromMap(doc.data())).toList();

      return userAddresses;
    } catch (e) {
      throw Exception("Error fetching user address: ${e.toString()}");
    }
  }

  //* save and update user profile
  Future<void> userProfile(UserProfileModel userProfilemodel) async {
    try {
      var userProfileRef = _db
          .collection('users')
          .doc(userProfilemodel.uid)
          .collection('userProfileData')
          .doc('profile');
      // Use set with SetOptions to update if the document exists or create it otherwise
      await userProfileRef.set(
        userProfilemodel.toMap(),
        SetOptions(merge: true),
      );

      _logger.e("User profile created/updated successfully");
      fecthUserProfile(userProfilemodel.uid);
    } on FirebaseException catch (e) {
      _logger.e("Firebase error while saving user profile: ${e.message}");
      throw FirebaseException(
        plugin: 'firebase_firestore',
        message: 'Error saving user profile: ${e.message}',
      );
    } catch (e) {
      log("General error while saving user profile: ${e.toString()}");
      throw Exception("Error saving user profile: ${e.toString()}");
    }
  }

  //* fecth user profile
  Future<UserProfileModel?> fecthUserProfile(String userUID) async {
    try {
      var userProfileRef = _db
          .collection('users')
          .doc(userUID)
          .collection('userProfileData')
          .doc('profile');

      var documentSnapshot = await userProfileRef.get();

      if (documentSnapshot.exists) {
        var userProfileData = documentSnapshot.data();
        log("User profile fetched successfully");
        return UserProfileModel.fromMap(userProfileData!);
      } else {
        log("No profile found for the user");
        return null;
      }
    } on FirebaseException catch (e) {
      log("Firebase error while fetching user profile: ${e.message}");
      throw FirebaseException(
        plugin: 'firebase_firestore',
        message: 'Error fetching user profile: ${e.message}',
      );
    } catch (e) {
      log("General error while fetching user profile: ${e.toString()}");
      throw Exception("Error fetching user profile: ${e.toString()}");
    }
  }
}
