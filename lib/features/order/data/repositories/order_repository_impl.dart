// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clothingstore/features/order/data/data_sources/order_remote_data_source.dart';
import 'package:clothingstore/features/order/data/models/order_model.dart';
import 'package:clothingstore/features/order/domain/repositories/order_repository.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrderRemoteDataSource orderRemoteDataSource;

  OrderRepositoryImpl({required this.orderRemoteDataSource});

  @override
  Future<void> makeOrder(OrderModel order) async {
    await orderRemoteDataSource.makeOrder(order);
  }

  @override
  Future<void> cancelOrder(String orderId) async {
    await orderRemoteDataSource.cancelOrder(orderId);
  }

  @override
  Future<List<OrderModel>> fetchAllOrders() async {
    return await orderRemoteDataSource.fetchAllOrders();
  }
}
