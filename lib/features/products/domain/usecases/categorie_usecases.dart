import 'package:clothingstore/features/products/domain/entites/catgeorie_enitity.dart';
import 'package:clothingstore/features/products/domain/repositories/categories_repositories.dart';

class CategorieUsecases {
  final CategoriesRepositories repository;

  CategorieUsecases(this.repository);

  Future<List<CategoryEntity>> fecthAllNormalCategoriesItems() {
    return repository.fecthAllNormalCategories();
  }
    Future<List<CategoryEntity>> fecthAllMinimalCategoriesItems() {
    return repository.fecthAllMinimalStyleCategories();
  }

    Future<List<CategoryEntity>> fecthAllSharpDressing() {
    return repository.fecthAllSharpDressingCategories();
  }
}
