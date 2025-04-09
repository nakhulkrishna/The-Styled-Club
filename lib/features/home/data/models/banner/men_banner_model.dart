import 'package:clothingstore/features/home/domain/entities/banner/banner_entites.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class BannerModel {
  String? id;
  bool isMen;
  bool isWomen;
  bool isAdornments;
  String image;
  String targetScreen;
  bool active;

  BannerModel({
    this.id,
    required this.isMen,
    required this.isWomen,
    required this.isAdornments,
    required this.image,
    required this.targetScreen,
    required this.active,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'isMen': isMen,
      'isWomen': isWomen,
      'isAdornments': isAdornments,
      'image': image,
      'targetScreen': targetScreen,
      'active': active,
    };
  }

  factory BannerModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return BannerModel(
      id: snapshot.id,
      isMen: data['isMen'] ?? false,
      isWomen: data['isWomen'] ?? false,
      isAdornments: data['isAdornments'] ?? false,
      image: data['image'] ?? "",
      targetScreen: data['targetScreen'] ?? "",
      active: data['active'] ?? false,
    );
  }

  BannerEntity toEntity() {
    return BannerEntity(
      id: id,
      isMen: isMen,
      isWomen: isWomen,
      isAdornments: isAdornments,
      image: image,
      targetScreen: targetScreen,
      active: active,
    );
  }
}
