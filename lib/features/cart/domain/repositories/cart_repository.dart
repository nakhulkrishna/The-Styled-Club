import 'package:clothingstore/features/cart/data/models/cart_model.dart';


abstract class CartRepository {
  Future<CartModel> addToCart(String userId, CartModel cartItem);
  Future<List<CartModel>> getCartItems(String userId);
  Future<void> deleteCartItem(String userId, String productId); // 👈 Add this
}
