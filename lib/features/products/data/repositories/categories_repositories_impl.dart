// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clothingstore/features/products/data/data_sources/categories_remote_data_sources.dart';
import 'package:clothingstore/features/products/domain/entites/catgeorie_enitity.dart';
import 'package:clothingstore/features/products/domain/repositories/categories_repositories.dart';

class CategoriesRepositoriesImpl implements CategoriesRepositories {
  CategoriesRemoteDataSources categoriesRemoteDataSources;
  CategoriesRepositoriesImpl({required this.categoriesRemoteDataSources});

  @override
  Future<List<CategoryEntity>> fecthAllNormalCategories() async {
    final categories =
        await categoriesRemoteDataSources.fecthAllNormalCategories();
    return categories.map((ref) => ref.toEntity()).toList();
  }

  @override
  Future<List<CategoryEntity>> fecthAllMinimalStyleCategories() async {
    final categories = await categoriesRemoteDataSources.fecthAllMinimalStyle();
    return categories.map((ref) => ref.toEntity()).toList();
  }

  @override
  Future<List<CategoryEntity>> fecthAllSharpDressingCategories() async {
    final categories =
        await categoriesRemoteDataSources.fecthAllSharpDressing();
    return categories.map((ref) => ref.toEntity()).toList();
  }

  @override
  Future<List<CategoryEntity>> getWomenNormalCategories() async {
    final categories =
        await categoriesRemoteDataSources.getWomenNormalCategories();
    return categories.map((ref) => ref.toEntity()).toList();
  }

  @override
  Future<List<CategoryEntity>> getWomenMinimalStyleCategories() async {
    final categories = await categoriesRemoteDataSources.getWomenMinimalStyle();
    return categories.map((ref) => ref.toEntity()).toList();
  }

  @override
  Future<List<CategoryEntity>> getWomenSharpDressingCategories() async {
    final categories =
        await categoriesRemoteDataSources.getWomenSharpDressing();
    return categories.map((ref) => ref.toEntity()).toList();
  }
}
