import 'package:clothingstore/features/products/domain/entites/product_entity.dart';
import 'package:clothingstore/features/products/domain/repositories/product_repositories.dart';

class ProductUsecases {
  final ProductRepositories repository;

  ProductUsecases(this.repository);

  Future<List<ProductEntity>> getAllProducts() {
    return repository.fecthAllProducts();
  }

  Future<List<ProductEntity>> getTopPickedProducts() {
    return repository.fecthTopPicksProducts();
  }

  Future<List<ProductEntity>> fecthCategoryBasedProducts(
    String categoryId,
    String itemCategory,
  ) {
    return repository.fecthNormalCategoryBasedProducts(
      categoryId,
      itemCategory,
    );
  }
   Future<List<ProductEntity>> fecthMinimalBasedProducts(
    String categoryId,
    String itemCategory,
  ) {
    return repository.fecthMinimalCategoryBasedProducts(
      categoryId,
      itemCategory,
    );
  }
   Future<List<ProductEntity>> fecthSharpDressingBasedProducts(
    String categoryId,
    String itemCategory,
  ) {
    return repository.fecthMinimalCategoryBasedProducts(
      categoryId,
      itemCategory,
    );
  }
}
