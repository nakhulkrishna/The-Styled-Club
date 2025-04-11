import 'package:clothingstore/features/products/data/data_sources/product_remote_data_sources.dart';
import 'package:clothingstore/features/products/domain/entites/product_entity.dart';
import 'package:clothingstore/features/products/domain/repositories/product_repositories.dart';

// Implementation of the ProductRepositories interface
class ProductsRepositoriesImpl implements ProductRepositories {
  // Remote data source to fetch product data
  ProductRemoteDataSources productRemoteDataSources;

  ProductsRepositoriesImpl({required this.productRemoteDataSources});

  //===========================MEN=============================/
  @override
  Future<List<ProductEntity>> menAllProducts() async {
    final modelList = await productRemoteDataSources.getMenNewArrivals();
    return modelList.map((e) => e.toEntity()).toList();
  }

  @override
  Future<List<ProductEntity>> menTopPicksProducts() async {
    final modelList = await productRemoteDataSources.getMenTopPicks();
    return modelList.map((e) => e.toEntity()).toList();
  }

  @override
  Future<List<ProductEntity>> menNormalCategoryBasedProducts(
    String categoryid,
    String itemCategory,
  ) async {
    final modelList = await productRemoteDataSources.getMenProductsByCategory(
      categoryId: categoryid,
      itemCategory: itemCategory,
    );
    return modelList.map((e) => e.toEntity()).toList();
  }

  @override
  Future<List<ProductEntity>> menMinimalCategoryBasedProducts(
    String categoryid,
    String itemCategory,
  ) async {
    final modelList = await productRemoteDataSources.getMenMinimalStyleProducts(
      categoryId: categoryid,
      itemCategory: itemCategory,
    );
    return modelList.map((e) => e.toEntity()).toList();
  }

  @override
  Future<List<ProductEntity>> menSharpDressingCategoryBasedProducts(
    String categoryid,
    String itemCategory,
  ) async {
    final modelList = await productRemoteDataSources
        .getMenSharpDressingProducts(
          categoryId: categoryid,
          itemCategory: itemCategory,
        );
    return modelList.map((e) => e.toEntity()).toList();
  }

  //===========================WOMEN=============================/
  @override
  Future<List<ProductEntity>> womenProducts() async {
    final modelList = await productRemoteDataSources.getMenNewArrivals();
    return modelList.map((e) => e.toEntity()).toList();
  }

  @override
  Future<List<ProductEntity>> womenTopPicksProducts() async {
    final modelList = await productRemoteDataSources.getWomenTopPicks();
    return modelList.map((e) => e.toEntity()).toList();
  }

  @override
  Future<List<ProductEntity>> womenNormalCategoryBasedProducts(
    String categoryid,
    String itemCategory,
  ) async {
    final modelList = await productRemoteDataSources.getWomenProductsByCategory(
      categoryId: categoryid,
      itemCategory: itemCategory,
    );
    return modelList.map((e) => e.toEntity()).toList();
  }

  @override
  Future<List<ProductEntity>> womenMinimalCategoryBasedProducts(
    String categoryid,
    String itemCategory,
  ) async {
    final modelList = await productRemoteDataSources
        .getWomenMinimalStyleProducts(
          categoryId: categoryid,
          itemCategory: itemCategory,
        );
    return modelList.map((e) => e.toEntity()).toList();
  }

  @override
  Future<List<ProductEntity>> womenSharpDressingCategoryBasedProducts(
    String categoryid,
    String itemCategory,
  ) async {
    final modelList = await productRemoteDataSources
        .getWomenSharpDressingProducts(
          categoryId: categoryid,
          itemCategory: itemCategory,
        );
    return modelList.map((e) => e.toEntity()).toList();
  }

  @override
  Future<List<ProductEntity>> searchProductsByName(String query) async {
    final modelList = await productRemoteDataSources.searchProducts(query);
    return modelList.map((e) => e.toEntity()).toList();
  }

}
