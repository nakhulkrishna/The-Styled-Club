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

abstract class WomenNormalCategoriesState {}

class WomenNormalCategoriesInitial extends WomenNormalCategoriesState {}

class WomenNormalCategoriesLoading extends WomenNormalCategoriesState {}

class WomenNormalCategoriesLoaded extends WomenNormalCategoriesState {
  final List<CategoryEntity> womennormalCategoriess;
  WomenNormalCategoriesLoaded(this.womennormalCategoriess);
}

class WomenNormalCategoriesError extends WomenNormalCategoriesState {
  final String message;
  WomenNormalCategoriesError(this.message);
}

abstract class WomenMinimalStyleCategoriesState {}

class WomenMinimalStyleCategoriesInitial
    extends WomenMinimalStyleCategoriesState {}

class WomenMinimalStyleCategoriesLoading
    extends WomenMinimalStyleCategoriesState {}

class WomenMinimalStyleCategoriesLoaded
    extends WomenMinimalStyleCategoriesState {
  final List<CategoryEntity> WomenminimalStyleCategoriess;
  WomenMinimalStyleCategoriesLoaded(this.WomenminimalStyleCategoriess);
}

class WomenMinimalStyleCategoriesError
    extends WomenMinimalStyleCategoriesState {
  final String message;
  WomenMinimalStyleCategoriesError(this.message);
}

abstract class WomenSharpDressingCategoriesState {}

class WomenSharpDressingCategoriesInitial
    extends WomenSharpDressingCategoriesState {}

class WomenSharpDressingCategoriesLoading
    extends WomenSharpDressingCategoriesState {}

class WomenSharpDressingCategoriesLoaded
    extends WomenSharpDressingCategoriesState {
  final List<CategoryEntity> WomensharpDressingStyleCategoriess;
  WomenSharpDressingCategoriesLoaded(this.WomensharpDressingStyleCategoriess);
}

class WomenSharpDressingCategoriesError
    extends WomenSharpDressingCategoriesState {
  final String message;
  WomenSharpDressingCategoriesError(this.message);
}
