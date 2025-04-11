// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clothingstore/features/cart/data/datasource/cart_remote_data_source.dart';
import 'package:clothingstore/features/cart/data/models/cart_model.dart';

import 'package:clothingstore/features/cart/domain/repositories/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  CartRemoteDataSource dataSource;
  CartRepositoryImpl({required this.dataSource});

  @override
  Future<CartModel> addToCart(String userId, CartModel cartItem) async {
    return dataSource.addToCart(userId: userId, cartModel: cartItem);
  }
   @override
     Future<List<CartModel>> getCartItems(String userId, ) async {
    return dataSource.getCartItems(userId: userId);
  }
  @override
Future<void> deleteCartItem(String userId, String productId) async {
  return dataSource.deleteCartItem(userId: userId, productId: productId);
}

}
