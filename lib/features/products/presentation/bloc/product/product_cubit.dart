// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:clothingstore/features/products/presentation/bloc/product/product_state.dart';

import 'package:clothingstore/features/products/domain/usecases/product_usecases.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductUsecases usecases;

  ProductCubit(this.usecases) : super(ProductInitial()) {
    menAllProduct();
    
  }
  Future<void> menAllProduct() async {
      emit(ProductLoading());
      try {
        final products = await usecases.menAllProducts();
        emit(ProductLoaded(products));
      } catch (e) {
        emit(ProductError(e.toString()));
      }
    }
  }

  // For top picked products
  class TopPickedCubit extends Cubit<TopPickedProductsState> {
    ProductUsecases usecases;

    TopPickedCubit(this.usecases) : super(TopPickedProductsInitial()) {
      menTopPickedProduct();
    }

    Future<void> menTopPickedProduct() async {
      emit(TopPickedProductsLoading());
      try {
        final productsToppicked = await usecases.menTopPickedProducts();
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
        final products = await productUsecases.menCategoryBasedProducts(
          categoryId,
          itemCategory,
        );
        emit(CategoryBasedProductsLoaded(products));
      } catch (e) {
        emit(CategoryBasedProductsError(e.toString()));
      }
    }
  }

  class MinimalCategoryBasedCubit
      extends Cubit<MinimalCategoryBasedProductsState> {
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
        final products = await productUsecases.menMinimalBasedProducts(
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
        final products = await productUsecases.menSharpDressingBasedProducts(
          categoryId,
          itemCategory,
        );
        emit(SharpDressungCategoryBasedProductsLoaded(products));
      } catch (e) {
        emit(SharpDressungCategoryBasedProductsError(e.toString()));
      }
    }


  //   Future<void> womenAllProduct() async {
  //   emit(ProductLoading());
  //   try {
  //     final products = await usecases.womenAllProducts();
  //     emit(ProductLoaded(products));
  //   } catch (e) {
  //     emit(ProductError(e.toString()));
  //   }
  // }
}

// For top picked products
class WomenTopPickedCubit extends Cubit<WomenTopPickedProductsState> {
  ProductUsecases usecases;

  WomenTopPickedCubit(this.usecases) : super(WomenTopPickedProductsInitial()) {
    womenTopPickedProduct();
  }

  Future<void> womenTopPickedProduct() async {
    emit(WomenTopPickedProductsLoading());
    try {
      final productsToppicked = await usecases.womenTopPickedProducts();
      emit(WomenTopPickedProductsLoaded(productsToppicked));
    } catch (e) {
      emit(WomenTopPickedProductsError(e.toString()));
    }
  }
}

class WomenCategoryBasedCubit extends Cubit<WomenCategoryBasedProductsState> {
  final ProductUsecases productUsecases;

  WomenCategoryBasedCubit(this.productUsecases)
    : super(WomenCategoryBasedProductsInitial());

  // Fetch products based on category and itemCategory
  Future<void> fetchCategoryBasedProducts(
    String categoryId,
    String itemCategory,
  ) async {
    emit(WomenCategoryBasedProductsLoading());
    try {
      final products = await productUsecases.womenCategoryBasedProducts(
        categoryId,
        itemCategory,
      );
      emit(WomenCategoryBasedProductsLoaded(products));
    } catch (e) {
      emit(WomenCategoryBasedProductsError(e.toString()));
    }
  }
}

class WomenMinimalCategoryBasedCubit
    extends Cubit<WomenMinimalCategoryBasedProductsState> {
  final ProductUsecases productUsecases;

  WomenMinimalCategoryBasedCubit(this.productUsecases)
    : super(WomenMinimalCategoryBasedProductsInitial());

  // Fetch products based on category and itemCategory
  Future<void> fetchMinimalCategoryBasedProducts(
    String categoryId,
    String itemCategory,
  ) async {
    emit(WomenMinimalCategoryBasedProductsLoading());
    try {
      final products = await productUsecases.womenMinimalBasedProducts(
        categoryId,
        itemCategory,
      );
      emit(WomenMinimalCategoryBasedProductsLoaded(products));
    } catch (e) {
      emit(WomenMinimalCategoryBasedProductsError(e.toString()));
    }
  }
}

class WomenSharpDressingCategoryBasedCubit
    extends Cubit<WomenSharpDressungCategoryBasedProductsState> {
  final ProductUsecases productUsecases;

  WomenSharpDressingCategoryBasedCubit(this.productUsecases)
    : super(WomenSharpDressungCategoryBasedProductsInitial());

  // Fetch products based on category and itemCategory

  Future<void> fetchSharpDressingCategoryBasedProducts(
    String categoryId,
    String itemCategory,
  ) async {
    emit(WomenSharpDressungCategoryBasedProductsLoading());
    try {
      final products = await productUsecases.womenSharpDressingBasedProducts(
        categoryId,
        itemCategory,
      );
      emit(WomenSharpDressungCategoryBasedProductsLoaded(products));
    } catch (e) {
      emit(WomenSharpDressungCategoryBasedProductsError(e.toString()));
    }
  }
}

class SearchCubit extends Cubit<ProductState> {
  final ProductUsecases usecases;

  SearchCubit(this.usecases) : super(ProductInitial());

  Future<void> searchProducts(String query) async {
    emit(ProductLoading());
    try {
      final results = await usecases.searchProducts(query); // <-- You’ll define this in usecase
      emit(ProductLoaded(results));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }
}


