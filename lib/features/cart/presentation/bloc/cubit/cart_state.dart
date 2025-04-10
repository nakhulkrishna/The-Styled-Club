import 'package:clothingstore/features/cart/data/models/cart_model.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final CartModel cartItem;
  CartLoaded(this.cartItem);
}

class CartError extends CartState {
  final String message;
  CartError(this.message);
}

abstract class FetchCartState {}

class FetchCartInitial extends FetchCartState {}

class FetchCartLoading extends FetchCartState {}

class FetchCartLoaded extends FetchCartState {
  final List<CartModel> cartItem;
  FetchCartLoaded(this.cartItem);
}

class FetchCartError extends FetchCartState {
  final String message;
  FetchCartError(this.message);
}
