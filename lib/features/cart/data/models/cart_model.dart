// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:clothingstore/features/cart/domain/entites/cart_entity.dart';

class CartModel {
  String productId;
  String title;
  double price;
  String? image;
  int quantity;
  String variationId;
  String? brandName;
  Map<String, String>? selectedVariation;
  bool isSelected;

  CartModel({
    required this.productId,
    this.title = '',
    this.price = 0.0,
    this.image,
    required this.quantity,
    this.variationId = "",
    this.brandName,
    this.selectedVariation,
    required this.isSelected,
  });

  /// Empty cart model
  static CartModel empty() => CartModel(
        productId: "",
        quantity: 0,
        isSelected: false,
      );

  /// Convert model to JSON
  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'title': title,
      'price': price,
      'image': image,
      'quantity': quantity,
      'variationId': variationId,
      'BrandName': brandName,
      'selectedVariation': selectedVariation,
      'isSelected': isSelected,
    };
  }

  /// Create model from JSON
  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      productId: json['productId'],
      title: json['title'] ?? '',
      price: (json['price'] as num).toDouble(),
      image: json['image'],
      quantity: json['quantity'] ?? 0,
      variationId: json['variationId'] ?? '',
      brandName: json['BrandName'],
      selectedVariation: json['selectedVariation'] != null
          ? Map<String, String>.from(json['selectedVariation'])
          : null,
      isSelected: json['isSelected'] ?? false,
    );
  }

  /// Convert model to entity
  CartEntity toEntity() {
    return CartEntity(
      productId: productId,
      title: title,
      price: price,
      image: image,
      quantity: quantity,
      variationId: variationId,
      brandName: brandName,
      selectedVariation: selectedVariation,
    );
  }

  /// Create model from entity
  factory CartModel.fromEntity(CartEntity entity) {
    return CartModel(
      productId: entity.productId,
      title: entity.title,
      price: entity.price,
      image: entity.image,
      quantity: entity.quantity,
      variationId: entity.variationId,
      brandName: entity.brandName,
      selectedVariation: entity.selectedVariation,
      isSelected: false, // Default or update as needed
    );
  }

  /// Copy method for updating model
  CartModel copyWith({
    String? productId,
    String? title,
    double? price,
    String? image,
    int? quantity,
    String? variationId,
    String? brandName,
    Map<String, String>? selectedVariation,
    bool? isSelected,
  }) {
    return CartModel(
      productId: productId ?? this.productId,
      title: title ?? this.title,
      price: price ?? this.price,
      image: image ?? this.image,
      quantity: quantity ?? this.quantity,
      variationId: variationId ?? this.variationId,
      brandName: brandName ?? this.brandName,
      selectedVariation: selectedVariation ?? this.selectedVariation,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
