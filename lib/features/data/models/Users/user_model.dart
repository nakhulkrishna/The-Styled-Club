// user_model.dart
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;
  final String firstName;
  final String lastName;
  final String phone;
  final String pincode;
  final String flat;
  final String street;
  final String landmark;
  final String city;
  final String state;
  final String addressType;

  UserModel({
    required this.uid,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.pincode,
    required this.flat,
    required this.street,
    required this.landmark,
    required this.city,
    required this.state,
    required this.addressType,
  });

  // Convert a UserModel object to a Map to store in Firestore
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'firstName': firstName,
      'lastName': lastName,
      'phone': phone,
      'pincode': pincode,
      'flat': flat,
      'street': street,
      'landmark': landmark,
      'city': city,
      'state': state,
      'addressType': addressType,
      'createdAt': FieldValue.serverTimestamp(),
    };
  }

  // Create a UserModel object from a Firestore document snapshot
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      phone: map['phone'] ?? '',
      pincode: map['pincode'] ?? '',
      flat: map['flat'] ?? '',
      street: map['street'] ?? '',
      landmark: map['landmark'] ?? '',
      city: map['city'] ?? '',
      state: map['state'] ?? '',
      addressType: map['addressType'] ?? '',
    );
  }
}
