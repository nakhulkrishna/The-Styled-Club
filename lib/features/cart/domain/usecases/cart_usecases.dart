// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clothingstore/features/cart/data/models/cart_model.dart';
import 'package:clothingstore/features/cart/domain/repositories/cart_repository.dart';

class CartUsecases {
  CartRepository cartRepository;
  CartUsecases({required this.cartRepository});
  Future<CartModel> addToCart(String userId, CartModel item) {
    return cartRepository.addToCart(userId, item);
  }

   Future<List<CartModel>> getCartItems(String userId,) {
    return cartRepository.getCartItems(userId);
  }
}
