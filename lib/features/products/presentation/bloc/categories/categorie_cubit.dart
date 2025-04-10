// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';

import 'package:clothingstore/features/products/domain/usecases/categorie_usecases.dart';
import 'package:clothingstore/features/products/presentation/bloc/categories/categorie_state.dart';

// MORMAL STYLE CUBIT
class NormalCategorieCubit extends Cubit<NormalCategoriesState> {
  CategorieUsecases usecases;
  NormalCategorieCubit(this.usecases) : super(NormalCategoriesInitial()) {
    fecthMenAllCategorie();
  }
  Future<void> fecthMenAllCategorie() async {
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
    fecthMenAllMinimalStyleCategorie();
  }
  Future<void> fecthMenAllMinimalStyleCategorie() async {
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
    fecthMenAllMinimalStyleCategorie();
  }
  Future<void> fecthMenAllMinimalStyleCategorie() async {
    emit(SharpDressingCategoriesLoading());
    try {
      final categories = await usecases.fecthAllSharpDressing();
      emit(SharpDressingCategoriesLoaded(categories));
    } catch (e) {
      emit(SharpDressingCategoriesError(e.toString()));
    }
  }
}

class WomenNormalCategorieCubit extends Cubit<WomenNormalCategoriesState> {
  CategorieUsecases usecases;
  WomenNormalCategorieCubit(this.usecases)
    : super(WomenNormalCategoriesInitial()) {
    fecthWomenAllCategorie();
  }
  Future<void> fecthWomenAllCategorie() async {
    emit(WomenNormalCategoriesLoading());
    try {
      final categories = await usecases.getWomenNormalCategoriesItems();
      emit(WomenNormalCategoriesLoaded(categories));
    } catch (e) {
      emit(WomenNormalCategoriesError(e.toString()));
    }
  }
}

// MINIMAL STYLE CUBIT
class WomenMinimalStyleCategoriesCubit
    extends Cubit<WomenMinimalStyleCategoriesState> {
  CategorieUsecases usecases;
  WomenMinimalStyleCategoriesCubit(this.usecases)
    : super(WomenMinimalStyleCategoriesInitial()) {
    fecthWomenAllMinimalStyleCategorie();
  }
  Future<void> fecthWomenAllMinimalStyleCategorie() async {
    emit(WomenMinimalStyleCategoriesLoading());
    try {
      final categories = await usecases.getWomenMinimalCategoriesItems();
      emit(WomenMinimalStyleCategoriesLoaded(categories));
    } catch (e) {
      emit(WomenMinimalStyleCategoriesError(e.toString()));
    }
  }
}

// SHARP DRSSING CUBIT
class WomenSharpDressingStyleCubit
    extends Cubit<WomenSharpDressingCategoriesState> {
  CategorieUsecases usecases;
  WomenSharpDressingStyleCubit(this.usecases)
    : super(WomenSharpDressingCategoriesInitial()) {
    fecthWomenAllMinimalStyleCategorie();
  }
  Future<void> fecthWomenAllMinimalStyleCategorie() async {
    emit(WomenSharpDressingCategoriesLoading());
    try {
      final categories = await usecases.getWomenSharpDressing();
      emit(WomenSharpDressingCategoriesLoaded(categories));
    } catch (e) {
      emit(WomenSharpDressingCategoriesError(e.toString()));
    }
  }
}
