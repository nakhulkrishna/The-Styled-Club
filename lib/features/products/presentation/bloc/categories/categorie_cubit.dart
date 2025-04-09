// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';

import 'package:clothingstore/features/products/domain/usecases/categorie_usecases.dart';
import 'package:clothingstore/features/products/presentation/bloc/categories/categorie_state.dart';
 // MORMAL STYLE CUBIT
class NormalCategorieCubit extends Cubit<NormalCategoriesState> {
  CategorieUsecases usecases;
  NormalCategorieCubit(this.usecases) : super(NormalCategoriesInitial()) {
    fecthAllCategorie();
  }
  Future<void> fecthAllCategorie() async {
    emit(NormalCategoriesLoading());
    try {
      final categories = await usecases.fecthAllNormalCategoriesItems();
      emit(NormalCategoriesLoaded(categories));
    } catch (e) {
      emit(NormalCategoriesError(e.toString()));
    }
  }
}
// MINIMAL STYLE CUBIT
class MinimalStyleCategoriesCubit extends Cubit<MinimalStyleCategoriesState> {
  CategorieUsecases usecases;
  MinimalStyleCategoriesCubit(this.usecases)
    : super(MinimalStyleCategoriesInitial()) {
    fecthAllMinimalStyleCategorie();
  }
  Future<void> fecthAllMinimalStyleCategorie() async {
    emit(MinimalStyleCategoriesLoading());
    try {
      final categories = await usecases.fecthAllMinimalCategoriesItems();
      emit(MinimalStyleCategoriesLoaded(categories));
    } catch (e) {
      emit(MinimalStyleCategoriesError(e.toString()));
    }
  }
}
// SHARP DRSSING CUBIT
class SharpDressingStyleCubit extends Cubit<SharpDressingCategoriesState> {
  CategorieUsecases usecases;
  SharpDressingStyleCubit(this.usecases)
    : super(SharpDressingCategoriesInitial()) {
    fecthAllMinimalStyleCategorie();
  }
  Future<void> fecthAllMinimalStyleCategorie() async {
    emit(SharpDressingCategoriesLoading());
    try {
      final categories = await usecases.fecthAllSharpDressing();
      emit(SharpDressingCategoriesLoaded(categories));
    } catch (e) {
      emit(SharpDressingCategoriesError(e.toString()));
    }
  }
}



