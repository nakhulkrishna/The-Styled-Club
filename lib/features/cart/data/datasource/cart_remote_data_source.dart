import 'dart:developer';

import 'package:clothingstore/features/cart/data/models/cart_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CartRemoteDataSource {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // ✅ Add to cart
  Future<CartModel> addToCart({
    required String userId,
    required CartModel cartModel,
  }) async {
    try {
      final cartRef = _db
          .collection('carts')
          .doc(userId)
          .collection('items')
          .doc(cartModel.productId);

      await cartRef.set(cartModel.toJson());
      return cartModel;
    } catch (e) {
      log('Error adding to cart: $e');
      throw Exception('Failed to add to cart');
    }
  }

  // ✅ Fetch all cart items
  Future<List<CartModel>> getCartItems({required String userId}) async {
    try {
      final cartSnapshot =
          await _db.collection('carts').doc(userId).collection('items').get();

      final cartItems =
          cartSnapshot.docs.map((doc) {
            final data = doc.data();
            return CartModel.fromJson(data);
          }).toList();

      log('Fetched Cart Items: ${cartItems.length}');
      return cartItems;
    } catch (e) {
      log('Error fetching cart items: $e');
      throw Exception('Failed to fetch cart items');
    }
  }

  // ✅ Delete a cart item
  Future<void> deleteCartItem({
    required String userId,
    required String productId,
  }) async {
    try {
      final cartItemRef = _db
          .collection('carts')
          .doc(userId)
          .collection('items')
          .doc(productId);

      await cartItemRef.delete();
      log('Deleted cart item: $productId');
    } catch (e) {
      log('Error deleting cart item: $e');
      throw Exception('Failed to delete cart item');
    }
  }
}
