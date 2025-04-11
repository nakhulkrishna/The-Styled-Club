import 'package:clothingstore/features/products/domain/entites/product_entity.dart';

abstract class ProductRepositories {
  Future<List<ProductEntity>> menAllProducts();
  Future<List<ProductEntity>> menTopPicksProducts();
  Future<List<ProductEntity>> menNormalCategoryBasedProducts(
    String categoryId,
    String itemCategory,
  );
  Future<List<ProductEntity>> menMinimalCategoryBasedProducts(
    String categoryId,
    String itemCategory,
  );
  Future<List<ProductEntity>> menSharpDressingCategoryBasedProducts(
    String categoryId,
    String itemCategory,
  );

  Future<List<ProductEntity>> womenProducts();
  Future<List<ProductEntity>> womenTopPicksProducts();
  Future<List<ProductEntity>> womenNormalCategoryBasedProducts(
    String categoryId,
    String itemCategory,
  );
  Future<List<ProductEntity>> womenMinimalCategoryBasedProducts(
    String categoryId,
    String itemCategory,
  );
  Future<List<ProductEntity>> womenSharpDressingCategoryBasedProducts(
    String categoryId,
    String itemCategory,
  );
  Future<List<ProductEntity>> searchProductsByName(String query);

}
