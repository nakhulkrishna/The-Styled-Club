import 'package:clothingstore/features/products/data/data_sources/product_remote_data_sources.dart';
import 'package:clothingstore/features/products/domain/entites/product_entity.dart';
import 'package:clothingstore/features/products/domain/repositories/product_repositories.dart';

// Implementation of the ProductRepositories interface
class ProductsRepositoriesImpl implements ProductRepositories {
  // Remote data source to fetch product data
  ProductRemoteDataSources productRemoteDataSources;

  // Constructor with required remote data source
  ProductsRepositoriesImpl({required this.productRemoteDataSources});

  // Fetch all new arrival men's products and convert to entity list
  @override
  Future<List<ProductEntity>> fecthAllProducts() async {
    final modelList =
        await productRemoteDataSources.fetchAllMenNewArrivelProducts();
    return modelList.map((e) => e.toEntity()).toList();
  }

  // Fetch all top picks men's products and convert to entity list
  @override
  Future<List<ProductEntity>> fecthTopPicksProducts() async {
    final modelList =
        await productRemoteDataSources.fetchAllMenTopPicksProducts();
    return modelList.map((e) => e.toEntity()).toList();
  }

  @override
  Future<List<ProductEntity>> fecthNormalCategoryBasedProducts(
    String categoryid,
    String itemCategory,
  ) async {
    final modelList = await productRemoteDataSources
        .fecthNormalCategorieBasedProducts(categoryid, itemCategory);
    return modelList.map((e) => e.toEntity()).toList();
  }
    @override
  Future<List<ProductEntity>> fecthMinimalCategoryBasedProducts(
    String categoryid,
    String itemCategory,
  ) async {
    final modelList = await productRemoteDataSources
        .fecthNormalCategorieBasedProducts(categoryid, itemCategory);
    return modelList.map((e) => e.toEntity()).toList();
  }

      @override
  Future<List<ProductEntity>> fecthSharpDressingCategoryBasedProducts(
    String categoryid,
    String itemCategory,
  ) async {
    final modelList = await productRemoteDataSources
        .fecthNormalCategorieBasedProducts(categoryid, itemCategory);
    return modelList.map((e) => e.toEntity()).toList();
  }
  
  
}
