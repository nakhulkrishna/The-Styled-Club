import 'package:clothingstore/features/products/domain/entites/catgeorie_enitity.dart';
// NOMRMAL STYLE STATE
abstract class NormalCategoriesState {}

class NormalCategoriesInitial extends NormalCategoriesState {}

class NormalCategoriesLoading extends NormalCategoriesState {}

class NormalCategoriesLoaded extends NormalCategoriesState {
  final List<CategoryEntity> normalCategoriess;
  NormalCategoriesLoaded(this.normalCategoriess);
}

class NormalCategoriesError extends NormalCategoriesState {
  final String message;
  NormalCategoriesError(this.message);
}
 // MINIMAL STYLE STATE 
abstract class MinimalStyleCategoriesState {}

class MinimalStyleCategoriesInitial extends MinimalStyleCategoriesState {}

class MinimalStyleCategoriesLoading extends MinimalStyleCategoriesState {}

class MinimalStyleCategoriesLoaded extends MinimalStyleCategoriesState {
  final List<CategoryEntity> minimalStyleCategoriess;
  MinimalStyleCategoriesLoaded(this.minimalStyleCategoriess);
}

class MinimalStyleCategoriesError extends MinimalStyleCategoriesState {
  final String message;
  MinimalStyleCategoriesError(this.message);
}

 // SHARP DRESSING STYLE STATE 
abstract class SharpDressingCategoriesState {}

class SharpDressingCategoriesInitial extends SharpDressingCategoriesState {}

class SharpDressingCategoriesLoading extends SharpDressingCategoriesState {}

class SharpDressingCategoriesLoaded extends SharpDressingCategoriesState {
  final List<CategoryEntity> sharpDressingStyleCategoriess;
  SharpDressingCategoriesLoaded(this.sharpDressingStyleCategoriess);
}

class SharpDressingCategoriesError extends SharpDressingCategoriesState {
  final String message;
  SharpDressingCategoriesError(this.message);
}

