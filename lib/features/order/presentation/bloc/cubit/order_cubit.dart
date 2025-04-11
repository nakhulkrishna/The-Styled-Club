import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clothingstore/features/order/data/models/order_model.dart';
import 'package:clothingstore/features/order/domain/repositories/order_repository.dart';
import 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  final OrderRepository orderRepository;

  OrderCubit({required this.orderRepository}) : super(OrderInitial()) {
    loadAllOrders();
  }

  Future<void> placeOrder(OrderModel order) async {
    emit(OrderLoading());
    try {
      await orderRepository.makeOrder(order);
      emit(OrderPlacedSuccess());
    } catch (e) {
      emit(OrderError("Failed to place order: ${e.toString()}"));
    }
  }

  // Future<void> loadOrdersForUser(String userId) async {
  //   emit(OrderLoading());
  //   try {
  //     final orders = await orderRepository.fetchOrdersByUser(userId);
  //     emit(OrderFetched(orders));
  //   } catch (e) {
  //     emit(OrderError("Failed to fetch orders: ${e.toString()}"));
  //   }
  // }

  Future<void> loadAllOrders() async {
    emit(OrderLoading());
    try {
      final orders = await orderRepository.fetchAllOrders();
      emit(OrderFetched(orders));
    } catch (e) {
      emit(OrderError("Failed to fetch orders: ${e.toString()}"));
    }
  }
}
