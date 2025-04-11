import 'package:clothingstore/features/order/data/models/order_model.dart';

abstract class OrderRepository {
  Future<void> makeOrder(OrderModel order);
  Future<void> cancelOrder(String orderId);
  Future<List<OrderModel>> fetchAllOrders();
}
