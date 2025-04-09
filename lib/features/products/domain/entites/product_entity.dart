import 'package:clothingstore/core/constants/enums.dart';
import 'package:clothingstore/features/products/data/models/brand/brand_model.dart';
import 'package:clothingstore/features/products/data/models/attributes_variations/attributes_mode.dart';
import 'package:clothingstore/features/products/data/models/attributes_variations/variations_model.dart';

class ProductEntity {
  String id;
  int stock;
  String? sku;
  double price;
  String title;
  DateTime? date;
  double salePrice;
  String thumbnail;
  String? categoryid;
  bool? isFeatured;
  Brandmodel? brand;
  String? decription;
  List<String>? Image;
  String productsType;
  int soldQuantity;
  List<ProuctsAttributesModel>? producstAttributes;
  List<ProductsVeriationModel>? prodcutsVariations;
  ItemCategory? itemCategory;

 ProductEntity ({
    required this.id,
    required this.stock,
    required this.price,
    required this.title,
    required this.productsType,
    this.salePrice = 0,
    required this.thumbnail,
    this.categoryid,
    this.isFeatured,
    this.brand,
    this.decription,
    this.Image,
    this.date,
    this.sku,
    this.soldQuantity = 0,
    this.producstAttributes,
    this.prodcutsVariations,
    this.itemCategory,
  });

}