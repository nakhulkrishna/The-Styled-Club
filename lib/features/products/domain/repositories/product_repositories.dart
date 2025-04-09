import 'package:clothingstore/features/products/domain/entites/product_entity.dart';

abstract class ProductRepositories {
  Future<List<ProductEntity>> fecthAllProducts();
  Future<List<ProductEntity>> fecthTopPicksProducts();
  Future<List<ProductEntity>> fecthNormalCategoryBasedProducts(
    String categoryId,
    String itemCategory,
  );
  Future<List<ProductEntity>> fecthMinimalCategoryBasedProducts(
    String categoryId,
    String itemCategory,
  );
  Future<List<ProductEntity>> fecthSharpDressingCategoryBasedProducts(
    String categoryId,
    String itemCategory,
  );
}
