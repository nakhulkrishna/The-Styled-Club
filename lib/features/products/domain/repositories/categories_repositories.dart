import 'package:clothingstore/features/products/domain/entites/catgeorie_enitity.dart';

abstract class CategoriesRepositories {
  Future<List<CategoryEntity>> fecthAllNormalCategories();
  Future<List<CategoryEntity>> fecthAllMinimalStyleCategories();
  Future<List<CategoryEntity>> fecthAllSharpDressingCategories();

  Future<List<CategoryEntity>> getWomenNormalCategories();
  Future<List<CategoryEntity>> getWomenMinimalStyleCategories();
  Future<List<CategoryEntity>> getWomenSharpDressingCategories();
}
