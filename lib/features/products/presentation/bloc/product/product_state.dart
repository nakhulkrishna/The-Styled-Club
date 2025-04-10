import 'package:clothingstore/features/products/domain/entites/product_entity.dart';

abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<ProductEntity> products;
  ProductLoaded(this.products);
}

class ProductError extends ProductState {
  final String message;
  ProductError(this.message);
}

// for Top Picks
abstract class TopPickedProductsState {}

class TopPickedProductsInitial extends TopPickedProductsState {}

class TopPickedProductsLoading extends TopPickedProductsState {}

class TopPickedProductsLoaded extends TopPickedProductsState {
  final List<ProductEntity> products;
  TopPickedProductsLoaded(this.products);
}

class TopPickedProductsError extends TopPickedProductsState {
  final String message;
  TopPickedProductsError(this.message);
}

// Abstract base class for CategoryBasedProducts states
abstract class CategoryBasedProductsState {}

// Initial state
class CategoryBasedProductsInitial extends CategoryBasedProductsState {}

// Loading state
class CategoryBasedProductsLoading extends CategoryBasedProductsState {}

// Loaded state with list of products
class CategoryBasedProductsLoaded extends CategoryBasedProductsState {
  final List<ProductEntity> products;
  CategoryBasedProductsLoaded(this.products);
}

// Error state with error message
class CategoryBasedProductsError extends CategoryBasedProductsState {
  final String message;
  CategoryBasedProductsError(this.message);
}

// Abstract base class for CategoryBasedProducts states
abstract class MinimalCategoryBasedProductsState {}

// Initial state
class MinimalCategoryBasedProductsInitial
    extends MinimalCategoryBasedProductsState {}

// Loading state
class MinimalCategoryBasedProductsLoading
    extends MinimalCategoryBasedProductsState {}

// Loaded state with list of products
class MinimalCategoryBasedProductsLoaded
    extends MinimalCategoryBasedProductsState {
  final List<ProductEntity> products;
  MinimalCategoryBasedProductsLoaded(this.products);
}

// Error state with error message
class MinimalCategoryBasedProductsError
    extends MinimalCategoryBasedProductsState {
  final String message;
  MinimalCategoryBasedProductsError(this.message);
}

// Abstract base class for CategoryBasedProducts states
abstract class SharpDressungCategoryBasedProductsState {}

// Initial state
class SharpDressungCategoryBasedProductsInitial
    extends SharpDressungCategoryBasedProductsState {}

// Loading state
class SharpDressungCategoryBasedProductsLoading
    extends SharpDressungCategoryBasedProductsState {}

// Loaded state with list of products
class SharpDressungCategoryBasedProductsLoaded
    extends SharpDressungCategoryBasedProductsState {
  final List<ProductEntity> products;
  SharpDressungCategoryBasedProductsLoaded(this.products);
}

// Error state with error message
class SharpDressungCategoryBasedProductsError
    extends SharpDressungCategoryBasedProductsState {
  final String message;
  SharpDressungCategoryBasedProductsError(this.message);
}



//====================women====================//
abstract class WomenProductState {}

class WomenProductInitial extends WomenProductState {}

class WomenProductLoading extends WomenProductState {}

class WomenProductLoaded extends WomenProductState {
  final List<ProductEntity> products;
  WomenProductLoaded(this.products);
}

class WomenProductError extends WomenProductState {
  final String message;
  WomenProductError(this.message);
}

// for Top Picks
abstract class WomenTopPickedProductsState {}

class WomenTopPickedProductsInitial extends WomenTopPickedProductsState {}

class WomenTopPickedProductsLoading extends WomenTopPickedProductsState {}

class WomenTopPickedProductsLoaded extends WomenTopPickedProductsState {
  final List<ProductEntity> products;
  WomenTopPickedProductsLoaded(this.products);
}

class WomenTopPickedProductsError extends WomenTopPickedProductsState {
  final String message;
  WomenTopPickedProductsError(this.message);
}

// Abstract base class for CategoryBasedProducts states
abstract class WomenCategoryBasedProductsState {}

// Initial state
class WomenCategoryBasedProductsInitial
    extends WomenCategoryBasedProductsState {}

// Loading state
class WomenCategoryBasedProductsLoading
    extends WomenCategoryBasedProductsState {}

// Loaded state with list of products
class WomenCategoryBasedProductsLoaded extends WomenCategoryBasedProductsState {
  final List<ProductEntity> products;
  WomenCategoryBasedProductsLoaded(this.products);
}

// Error state with error message
class WomenCategoryBasedProductsError extends WomenCategoryBasedProductsState {
  final String message;
  WomenCategoryBasedProductsError(this.message);
}

// Abstract base class for CategoryBasedProducts states
abstract class WomenMinimalCategoryBasedProductsState {}

// Initial state
class WomenMinimalCategoryBasedProductsInitial
    extends WomenMinimalCategoryBasedProductsState {}

// Loading state
class WomenMinimalCategoryBasedProductsLoading
    extends WomenMinimalCategoryBasedProductsState {}

// Loaded state with list of products
class WomenMinimalCategoryBasedProductsLoaded
    extends WomenMinimalCategoryBasedProductsState {
  final List<ProductEntity> products;
  WomenMinimalCategoryBasedProductsLoaded(this.products);
}

// Error state with error message
class WomenMinimalCategoryBasedProductsError
    extends WomenMinimalCategoryBasedProductsState {
  final String message;
  WomenMinimalCategoryBasedProductsError(this.message);
}

// Abstract base class for CategoryBasedProducts states
abstract class WomenSharpDressungCategoryBasedProductsState {}

// Initial state
class WomenSharpDressungCategoryBasedProductsInitial
    extends WomenSharpDressungCategoryBasedProductsState {}

// Loading state
class WomenSharpDressungCategoryBasedProductsLoading
    extends WomenSharpDressungCategoryBasedProductsState {}

// Loaded state with list of products
class WomenSharpDressungCategoryBasedProductsLoaded
    extends WomenSharpDressungCategoryBasedProductsState {
  final List<ProductEntity> products;
 WomenSharpDressungCategoryBasedProductsLoaded(this.products);
}

// Error state with error message
class WomenSharpDressungCategoryBasedProductsError
    extends WomenSharpDressungCategoryBasedProductsState {
  final String message;
  WomenSharpDressungCategoryBasedProductsError(this.message);
}
