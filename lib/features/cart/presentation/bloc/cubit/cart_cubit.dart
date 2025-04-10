import 'dart:developer';

import 'package:clothingstore/features/cart/data/models/cart_model.dart';
import 'package:clothingstore/features/cart/domain/usecases/cart_usecases.dart';
import 'package:clothingstore/features/cart/presentation/bloc/cubit/cart_state.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartState> {
  CartUsecases usecases;

  CartCubit(this.usecases) : super(CartInitial());
  Future<void> addToCart(String userId, CartModel item) async {
    emit(CartLoading());
    try {
      final products = await usecases.addToCart(userId, item);
      emit(CartLoaded(products));
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }
}

class FetchCartItemsCubit extends Cubit<FetchCartState> {
  CartUsecases usecases;

  FetchCartItemsCubit(this.usecases) : super(FetchCartInitial()) {
    final user = FirebaseAuth.instance.currentUser;
    getFecthItems(user!.uid);
  }

  Future<void> getFecthItems(String userId) async {
    emit(FetchCartLoading());
    try {
      final products = await usecases.getCartItems(userId);
      emit(FetchCartLoaded(products));
    } catch (e) {
      emit(FetchCartError(e.toString()));
    }
  }
}
