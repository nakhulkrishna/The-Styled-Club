// user_model.dart
import 'package:cloud_firestore/cloud_firestore.dart';

class UserProfileModel {
  final String uid;
  final String firstName;
  final String lastName;
  final String phone;
  final String email;
  final String dateofbirth;

  UserProfileModel({
   required this.email,
   required this.dateofbirth,
    required this.uid,
    required this.firstName,
    required this.lastName,
    required this.phone,
  });

  // Convert a UserProfileModel object to a Map to store in Firestore
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'firstName': firstName,
      'lastName': lastName,
      'phone': phone,
      'email':email,
      'dateofbirth':dateofbirth
    };
  }

  // Create a UserProfileModel object from a Firestore document snapshot
  factory UserProfileModel.fromMap(Map<String, dynamic> map) {
    return UserProfileModel(
      dateofbirth: map['dateofbirth'] ?? '',
      email: map['email'] ?? '',
      uid: map['uid'] ?? '',
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      phone: map['phone'] ?? '',
    );
  }
}
