import 'package:clothingstore/features/data/models/Users/user_profile_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserProfileRemoteSource {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser;

  Future<void> saveOrUpdateProfile(UserProfileModel userProfile) async {
    try {
      if (user != null) {
        final profileRef = _db
            .collection("User")
            .doc(user!.uid)
            .collection("UserProfileData")
            .doc("profile");

        final existingDoc = await profileRef.get();

        if (existingDoc.exists) {
          // Update existing profile
          await profileRef.set(userProfile.toMap(), SetOptions(merge: true));
        } else {
          // Create new profile
          await profileRef.set(userProfile.toMap());
        }
      } else {
        throw Exception("No user logged in");
      }
    } catch (e) {
      print("Error saving/updating user profile: $e");
      rethrow;
    }
  }

  Future<UserProfileModel> getUserProfile() async {
    try {
      final user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        final profileDoc =
            await _db
                .collection("User")
                .doc(user.uid)
                .collection("UserProfileData")
                .doc("profile")
                .get();

        if (profileDoc.exists) {
          return UserProfileModel.fromMap(profileDoc.data()!);
        } else {
          throw Exception("Profile not found");
        }
      } else {
        throw Exception("User not logged in");
      }
    } catch (e) {
      print("Error fetching user profile: $e");
      rethrow;
    }
  }
}
