import 'package:clothingstore/features/order/data/models/order_model.dart';
import 'package:clothingstore/features/order/domain/repositories/order_repository.dart';

class OrderUsecases {
  final OrderRepository orderRepository;

  OrderUsecases({required this.orderRepository});

  Future<void> makeOrder(OrderModel order) async {
    await orderRepository.makeOrder(order);
  }

  Future<void> cancelOrder(String orderId) async {
    await orderRepository.cancelOrder(orderId);
  }

  Future<List<OrderModel>> fetchAllOrders() async {
    return await orderRepository.fetchAllOrders();
  }
}
