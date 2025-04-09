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
