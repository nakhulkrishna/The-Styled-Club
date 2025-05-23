import 'package:clothingstore/core/constants/enums.dart';
import 'package:clothingstore/core/formatters/formatters.dart';
import 'package:clothingstore/features/products/data/models/attributes_variations/attributes_mode.dart';
import 'package:clothingstore/features/products/data/models/attributes_variations/variations_model.dart'
    show ProductsVeriationModel;
import 'package:clothingstore/features/products/data/models/brand/brand_model.dart';
import 'package:clothingstore/features/products/domain/entites/product_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
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

  ProductModel({
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

  String get formttedDate => NFormatters.formatDate(date);

  static ProductModel empty() => ProductModel(
    id: "",
    stock: 0,
    price: 0,
    title: "",
    productsType: "",
    thumbnail: "",
  );

  Map<String, dynamic> toJson() {
    return {
      "SKU": sku,
      "Title": title,
      "Stock": stock,
      "Price": price,
      "Image": Image ?? [],
      "itemCategory": itemCategory?.name,
      "Thumbnail": thumbnail,
      "SalePrice": salePrice,
      "isFeatured": isFeatured,
      "CategoryId": categoryid,
      "Brand": brand?.toJson(),
      "Description": decription,
      "ProductType": productsType,
      "SoldQuantity": soldQuantity,
      "ProductAttributes":
          producstAttributes?.map((e) => e.toJson()).toList() ?? [],
      "ProductVariations":
          prodcutsVariations?.map((e) => e.toJson()).toList() ?? [],
      "Date": date?.toIso8601String(),
    };
  }

  factory ProductModel.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> document,
  ) {
    final data = document.data()!;
    return ProductModel(
      id: document.id,
      stock: data['Stock'] ?? 0,
      price: double.parse((data['Price'] ?? 0.0).toString()),
      title: data['Title'],
      productsType: data['ProductType'] ?? '',
      thumbnail: data['Thumbnail'] ?? '',
      salePrice: double.parse((data["SalePrice"] ?? 0.0).toString()),
      sku: data['SKU'],
      categoryid: data['CategoryId'],
      isFeatured: data['isFeatured'] ?? false,
      brand: Brandmodel.fromJson(data['Brand']),
      decription: data['Description'],
      Image: data['Image'] != null ? List<String>.from(data['Image']) : [],
      soldQuantity:
          data.containsKey('SoldQuantity') ? data["SoldQuantity"] ?? 0 : 0,
      itemCategory:
          data.containsKey('itemCategory')
              ? ItemCategory.values.firstWhere(
                (r) => r.name == data['Role'],
                orElse: () => ItemCategory.man,
              )
              : ItemCategory.man,
      date: data['Date'] != null ? DateTime.tryParse(data['Date']) : null,
      producstAttributes:
          (data['ProductAttributes'] as List<dynamic>)
              .map((e) => ProuctsAttributesModel.fromJson(e))
              .toList(),

      prodcutsVariations:
          (data['ProductVariations'] as List<dynamic>)
              .map((e) => ProductsVeriationModel.fromJson(e))
              .toList(),
    );
  }

  factory ProductModel.fromQuerySnapshot(
    QueryDocumentSnapshot<Object?> document,
  ) {
    final data = document.data() as Map<String, dynamic>;
    return ProductModel(
      id: document.id,
      stock: data['Stock'] ?? 0,
      price: double.parse((data['Price'] ?? 0.0).toString()),
      title: data['Title'],
      productsType: data['ProductType'] ?? '',
      thumbnail: data['Thumbnail'] ?? '',
      salePrice: double.parse((data["SalePrice"] ?? 0.0).toString()),
      sku: data['SKU'],
      categoryid: data['CategoryId'],
      isFeatured: data['isFeatured'] ?? false,
      brand: Brandmodel.fromJson(data['Brand']),
      decription: data['Description'],
      Image: data['Image'] != null ? List<String>.from(data['Image']) : [],
      soldQuantity:
          data.containsKey('SoldQuantity') ? data["SoldQuantity"] ?? 0 : 0,
      itemCategory:
          data.containsKey('itemCategory')
              ? ItemCategory.values.firstWhere(
                (r) => r.name == data['Role'],
                orElse: () => ItemCategory.man,
              )
              : ItemCategory.man,
      date: data['Date'] != null ? DateTime.tryParse(data['Date']) : null,
      producstAttributes:
          (data['ProductAttributes'] as List<dynamic>)
              .map((e) => ProuctsAttributesModel.fromJson(e))
              .toList(),

      prodcutsVariations:
          (data['ProductVariations'] as List<dynamic>)
              .map((e) => ProductsVeriationModel.fromJson(e))
              .toList(),
    );
  }
  ProductEntity toEntity() {
    return ProductEntity(
      id: id,
      stock: stock,
      price: price,
      title: title,
      productsType: productsType,
      thumbnail: thumbnail,
      salePrice: salePrice,
      sku: sku,
      categoryid: categoryid,
      isFeatured: isFeatured,
      brand: brand,
      decription: decription,
      Image: Image,
      date: date,
      soldQuantity: soldQuantity,
      producstAttributes: producstAttributes,
      prodcutsVariations: prodcutsVariations,
      itemCategory: itemCategory,
    );
  }
}
