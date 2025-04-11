import 'dart:developer';

import 'package:clothingstore/core/constants/enums.dart';
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

  void toggleSelection(int index) {
    final currentState = state;
    if (currentState is FetchCartLoaded) {
      final updatedList = List<CartModel>.from(currentState.cartItem);
      updatedList[index].isSelected = !updatedList[index].isSelected;
      emit(FetchCartLoaded(updatedList));
    }
  }

  void selectAll(bool value) {
    final currentState = state;
    if (currentState is FetchCartLoaded) {
      final updatedList =
          currentState.cartItem.map((e) {
            return CartModel(
              productId: e.productId,
              quantity: e.quantity,
              price: e.price,
              variationId: e.variationId,
              title: e.title,
              image: e.image,
              brandName: e.brandName,
              selectedVariation: e.selectedVariation,
              isSelected: value,
            );
          }).toList();
      emit(FetchCartLoaded(updatedList));
    }
  }

Future<void> deleteItem(String userId, String productId) async {
    try {
      await usecases.deleteCartItem(userId, productId);
      final updatedCart = await usecases.getCartItems(userId);
      emit(FetchCartLoaded(updatedCart));
    } catch (e) {
      emit(FetchCartError(e.toString()));
    }
  }

}

class AddressTypeCubit extends Cubit<AddressType> {
  AddressTypeCubit() : super(AddressType.home); // default value

  void selectType(AddressType type) {
    emit(type);
  }
}
