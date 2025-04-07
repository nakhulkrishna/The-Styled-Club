import 'package:clothingstore/features/data/abstract/bloc/base_bloc.dart';
import 'package:clothingstore/features/data/models/products/product_model.dart';
import 'package:clothingstore/features/data/repositories/products/products_repository.dart';

class ProductBloc extends BaseBloc<ProductModel> {
  ProductBloc()
    : super(
        fetchItemsFn: () => ProductsRepository().fecthAllProduct(),
        containsSearchQueryFn:
            (product, query) =>
                product.title.toLowerCase().contains(query.toLowerCase()),
      );
}
