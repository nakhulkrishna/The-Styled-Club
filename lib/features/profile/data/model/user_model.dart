import 'dart:convert';

class AddressModel {
  final String? id; // Optional doc ID
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

  AddressModel({
    this.id,
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

  Map<String, dynamic> toMap() {
    return {
      'id': id,
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
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      id: map['id'],
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

  String toJson() => json.encode(toMap());

  factory AddressModel.fromJson(String source) =>
      AddressModel.fromMap(json.decode(source));

  AddressModel copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? phone,
    String? pincode,
    String? flat,
    String? street,
    String? landmark,
    String? city,
    String? state,
    String? addressType,
  }) {
    return AddressModel(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phone: phone ?? this.phone,
      pincode: pincode ?? this.pincode,
      flat: flat ?? this.flat,
      street: street ?? this.street,
      landmark: landmark ?? this.landmark,
      city: city ?? this.city,
      state: state ?? this.state,
      addressType: addressType ?? this.addressType,
    );
  }
}
