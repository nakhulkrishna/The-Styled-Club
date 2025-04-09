import 'package:clothingstore/core/formatters/formatters.dart';
import 'package:clothingstore/features/products/data/models/categories_model/categories_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Brandmodel {
  String id;
  String image;
  String name;
  bool isFeatured;
  int? productsCount;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<CategoryModel>? brandCategories;

  Brandmodel({
    required this.name,
    required this.id,
    required this.image,
    this.isFeatured = false,
    this.productsCount,
    this.createdAt,
    this.updatedAt,
    this.brandCategories,
  });

  static Brandmodel empty() => Brandmodel(image: "", id: "", name: "");

  String get formattedDate => NFormatters.formatDate(createdAt);
  String get formattedUpdatedAtDate => NFormatters.formatDate(updatedAt);

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "image": image,
      "name": name,
      "isFeatured": isFeatured,
      "productsCount": productsCount ?? 0,
      "createdAt": createdAt?.toIso8601String(),
      "updatedAt":
          updatedAt?.toIso8601String() ?? DateTime.now().toIso8601String(),
      "brandCategories": brandCategories?.map((e) => e.toJson()).toList(),
    };
  }

  factory Brandmodel.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> document,
  ) {
    final data = document.data();
    if (data == null) return Brandmodel.empty();

    return Brandmodel(
      id: document.id,
      image: data['image'] ?? "",
      name: data['name'] ?? "",
      isFeatured: data['isFeatured'] ?? false,
      productsCount:
          (data['productsCount'] ?? 0) is int
              ? data['productsCount']
              : int.tryParse(data['productsCount'].toString()),
      createdAt: _parseTimestampOrString(data['createdAt']),
      updatedAt: _parseTimestampOrString(data['updatedAt']),
    );
  }

  factory Brandmodel.fromJson(Map<String, dynamic> data) {
    if (data.isEmpty) return Brandmodel.empty();

    return Brandmodel(
      id: data['id'] ?? "",
      image: data['image'] ?? "",
      name: data['name'] ?? "",
      isFeatured: data['isFeatured'] ?? false,
      productsCount:
          (data["productsCount"] ?? 0) is int
              ? data["productsCount"]
              : int.tryParse(data["productsCount"].toString()),
      createdAt: _parseTimestampOrString(data['createdAt']),
      updatedAt: _parseTimestampOrString(data['updatedAt']),
    );
  }

  /// Helper method to parse both Firestore Timestamp and ISO8601 String
  static DateTime? _parseTimestampOrString(dynamic value) {
    if (value == null) return null;
    if (value is Timestamp) return value.toDate();
    if (value is String) return DateTime.tryParse(value);
    return null;
  }
}
