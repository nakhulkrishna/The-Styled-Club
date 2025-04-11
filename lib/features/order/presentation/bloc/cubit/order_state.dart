import 'package:clothingstore/features/order/data/models/order_model.dart';
import 'package:equatable/equatable.dart';

abstract class OrderState extends Equatable {
  @override
  List<Object?> get props => [];
}

class OrderInitial extends OrderState {}

class OrderLoading extends OrderState {}

class OrderPlacedSuccess extends OrderState {}

class OrderError extends OrderState {
  final String message;

  OrderError(this.message);

  @override
  List<Object?> get props => [message];
}

class OrderFetched extends OrderState {
  final List<OrderModel> orders;

  OrderFetched(this.orders);

  @override
  List<Object?> get props => [orders];
}
