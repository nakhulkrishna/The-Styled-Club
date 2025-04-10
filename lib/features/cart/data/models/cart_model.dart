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

  CartModel({
    required this.productId,
    this.title = '',
    this.price = 0.0,
    this.image,
    required this.quantity,
    this.variationId = "",
    this.brandName,
    this.selectedVariation,
  });

  static CartModel empty() => CartModel(productId: "", quantity: 0);

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
    };
  }

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      productId: json['productId'],
      title: json['title'],
      price: json['price'],
      image: json['image'],
      quantity: json['quantity'],
      variationId: json['variationId'],
      brandName: json['BrandName'],
      selectedVariation:
          (json['selectedVariation'] != null)
              ? Map<String, String>.from(json['selectedVariation'])
              : null,
    );
  }

  // Convert model to entity
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

  // Convert entity to model
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
    );
  }

}
