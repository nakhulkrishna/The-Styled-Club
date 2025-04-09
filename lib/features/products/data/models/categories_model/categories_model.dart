// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:clothingstore/core/formatters/formatters.dart';
import 'package:clothingstore/features/products/domain/entites/catgeorie_enitity.dart';

class CategoryModel {
  String name;
  String id;
  String image;
  String parentId;
  bool isFeatured;
  bool isSharpDressing;
  bool isMinimalStyle;
  String itemCategory;
  DateTime? createdAt;
  DateTime? updatedAt;

  CategoryModel({
    required this.name,
    required this.id,
    required this.image,
    this.parentId = "",
    this.isFeatured = false,
    required this.isSharpDressing,
    this.isMinimalStyle = false,
    this.itemCategory = "",
    this.createdAt,
    this.updatedAt,
  });

  CategoryEntity toEntity() {
    return CategoryEntity(
      name: name,
      id: id,
      image: image,
      parentId: parentId,
      isFeatured: isFeatured,
      isMinimalStyle: isMinimalStyle,
      itemCategory: itemCategory,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  static CategoryModel empty() => CategoryModel(
    name: "",
    id: "",
    image: "",
    isSharpDressing: false,
    isFeatured: false,
    isMinimalStyle: false,
    itemCategory: "",
  );

  String get formattedDate => NFormatters.formatDate(createdAt);
  String get formattedupdatedDate => NFormatters.formatDate(updatedAt);

  Map<String, dynamic> toJson() {
    return {
      "Name": name,
      "Image": image,
      "ParentId": parentId,
      "isFeatured": isFeatured,
      "isSharpDressing": isSharpDressing, // ✅ Correct key
      "isMinimalStyle": isMinimalStyle,
      "itemCategory": itemCategory,
      "createdAt": createdAt,
      "updatedAt": updatedAt ?? DateTime.now(),
    };
  }

  factory CategoryModel.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> document,
  ) {
    final data = document.data();
    if (data != null) {
      return CategoryModel(
        name: data['Name'] ?? "",
        id: document.id,
        image: data["Image"] ?? "",
        parentId: data["ParentId"] ?? "",
        isSharpDressing: data["isSharpDressing"] ?? false, // ✅ fixed typo
        isFeatured: data["isFeatured"] ?? false,
        isMinimalStyle: data["isMinimalStyle"] ?? false,
        itemCategory: data["itemCategory"] ?? "",
        createdAt: data["createdAt"]?.toDate(),
        updatedAt: data["updatedAt"]?.toDate(),
      );
    } else {
      return CategoryModel.empty();
    }
  }
}
