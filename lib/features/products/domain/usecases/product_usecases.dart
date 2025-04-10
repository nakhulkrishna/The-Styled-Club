import 'package:clothingstore/features/products/domain/entites/product_entity.dart';
import 'package:clothingstore/features/products/domain/repositories/product_repositories.dart';

class ProductUsecases {
  final ProductRepositories repository;

  ProductUsecases(this.repository);

  Future<List<ProductEntity>> menAllProducts() {
    return repository.menAllProducts();
  }

  Future<List<ProductEntity>> menTopPickedProducts() {
    return repository.menTopPicksProducts();
  }

  Future<List<ProductEntity>> menCategoryBasedProducts(
    String categoryId,
    String itemCategory,
  ) {
    return repository.menNormalCategoryBasedProducts(
      categoryId,
      itemCategory,
    );
  }
   Future<List<ProductEntity>> menMinimalBasedProducts(
    String categoryId,
    String itemCategory,
  ) {
    return repository.menMinimalCategoryBasedProducts(
      categoryId,
      itemCategory,
    );
  }
   Future<List<ProductEntity>> menSharpDressingBasedProducts(
    String categoryId,
    String itemCategory,
  ) {
    return repository.menMinimalCategoryBasedProducts(
      categoryId,
      itemCategory,
    );
  }


  //===================women===================//
    Future<List<ProductEntity>> womenAllProducts() {
    return repository.womenProducts();
  }

  Future<List<ProductEntity>> womenTopPickedProducts() {
    return repository.womenTopPicksProducts();
  }

  Future<List<ProductEntity>> womenCategoryBasedProducts(
    String categoryId,
    String itemCategory,
  ) {
    return repository.womenNormalCategoryBasedProducts(categoryId, itemCategory);
  }

  Future<List<ProductEntity>> womenMinimalBasedProducts(
    String categoryId,
    String itemCategory,
  ) {
    return repository.womenMinimalCategoryBasedProducts(categoryId, itemCategory);
  }

  Future<List<ProductEntity>> womenSharpDressingBasedProducts(
    String categoryId,
    String itemCategory,
  ) {
    return repository.womenSharpDressingCategoryBasedProducts(categoryId, itemCategory);
  }

}
