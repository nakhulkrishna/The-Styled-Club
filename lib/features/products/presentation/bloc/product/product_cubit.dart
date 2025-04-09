// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:clothingstore/features/products/presentation/bloc/product/product_state.dart';

import 'package:clothingstore/features/products/domain/usecases/product_usecases.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductUsecases fecthAllProducts;

  ProductCubit(this.fecthAllProducts) : super(ProductInitial()) {
    fecthAllProduct();
  }

  Future<void> fecthAllProduct() async {
    emit(ProductLoading());
    try {
      final products = await fecthAllProducts.getAllProducts();
      emit(ProductLoaded(products));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }
}

// For top picked products
class TopPickedCubit extends Cubit<TopPickedProductsState> {
  ProductUsecases fecthAllProducts;

  TopPickedCubit(this.fecthAllProducts) : super(TopPickedProductsInitial()) {
    fecthTopPickedProduct();
  }

  Future<void> fecthTopPickedProduct() async {
    emit(TopPickedProductsLoading());
    try {
      final productsToppicked = await fecthAllProducts.getTopPickedProducts();
      emit(TopPickedProductsLoaded(productsToppicked));
    } catch (e) {
      emit(TopPickedProductsError(e.toString()));
    }
  }
}

class CategoryBasedCubit extends Cubit<CategoryBasedProductsState> {
  final ProductUsecases productUsecases;

  CategoryBasedCubit(this.productUsecases)
    : super(CategoryBasedProductsInitial());

  // Fetch products based on category and itemCategory
  Future<void> fetchCategoryBasedProducts(
    String categoryId,
    String itemCategory,
  ) async {
    emit(CategoryBasedProductsLoading());
    try {
      final products = await productUsecases.fecthCategoryBasedProducts(
        categoryId,
        itemCategory,
      );
      emit(CategoryBasedProductsLoaded(products));
    } catch (e) {
      emit(CategoryBasedProductsError(e.toString()));
    }
  }
}
class MinimalCategoryBasedCubit extends Cubit<MinimalCategoryBasedProductsState> {
  final ProductUsecases productUsecases;

  MinimalCategoryBasedCubit(this.productUsecases)
    : super(MinimalCategoryBasedProductsInitial());

  // Fetch products based on category and itemCategory
  Future<void> fetchMinimalCategoryBasedProducts(
    String categoryId,
    String itemCategory,
  ) async {
    emit(MinimalCategoryBasedProductsLoading());
    try {
      final products = await productUsecases.fecthMinimalBasedProducts(
        categoryId,
        itemCategory,
      );
      emit(MinimalCategoryBasedProductsLoaded(products));
    } catch (e) {
      emit(MinimalCategoryBasedProductsError(e.toString()));
    }
  }
  
}



class SharpDressingCategoryBasedCubit
    extends Cubit<SharpDressungCategoryBasedProductsState> {
  final ProductUsecases productUsecases;

  SharpDressingCategoryBasedCubit(this.productUsecases)
    : super(SharpDressungCategoryBasedProductsInitial());

  // Fetch products based on category and itemCategory
  

Future<void> fetchSharpDressingCategoryBasedProducts(
    String categoryId,
    String itemCategory,
  ) async {
    emit(SharpDressungCategoryBasedProductsLoading());
    try {
      final products = await productUsecases.fecthSharpDressingBasedProducts(
        categoryId,
        itemCategory,
      );
      emit(SharpDressungCategoryBasedProductsLoaded(products));
    } catch (e) {
      emit(SharpDressungCategoryBasedProductsError(e.toString()));
    }
  }
}
