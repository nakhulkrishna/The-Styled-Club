// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clothingstore/core/constants/enums.dart';
import 'package:clothingstore/features/cart/data/models/cart_model.dart';
import 'package:clothingstore/features/profile/data/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  final String id;
  final String userId;
  final OrderStatus status;
  final double totalAmount;
  final DateTime orderDate;
  final String paymentsMethods;
  final DateTime? deliveryDate;
  final AddressModel? address;
  final List<CartModel> items;
  OrderModel({
    required this.id,
    this.userId = "",
    required this.status,
    required this.totalAmount,
    required this.orderDate,
    this.paymentsMethods = "COD",
    this.deliveryDate,
    this.address,
    required this.items,
  });

  String get formattedOrderDate => _formatDate(orderDate);
  String get formattedDeliveryDate =>
      deliveryDate != null ? _formatDate(deliveryDate!) : "Pending";

  String _formatDate(DateTime date) {
    // You can customize this format as needed
    return "${date.day.toString().padLeft(2, '0')}/"
        "${date.month.toString().padLeft(2, '0')}/"
        "${date.year}";
  }

  String get orderStatusText =>
      status == OrderStatus.delivered
          ? "Deliverd"
          : status == OrderStatus.shipped
          ? "Shipment on the way"
          : 'Processing';

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'status': status.toString(), // converting enum to string
      'totalAmount': totalAmount,
      'orderDate': orderDate,
      'paymentMethod': paymentsMethods,
      'deliveryDate': deliveryDate,
      'address': address?.toMap(),
      'items': items.map((item) => item.toJson()).toList(),
    };
  }

  factory OrderModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;

    return OrderModel(
      id: data['id'] as String,
      userId: data['userId'] as String,
      status: OrderStatus.values.firstWhere(
        (e) => e.toString() == data['status'],
      ),
      totalAmount: data['totalAmount'] as double,
      orderDate: (data['orderDate'] as Timestamp).toDate(),
      paymentsMethods: data['paymentMethod'] as String,
      deliveryDate:
          data['deliveryDate'] == null
              ? null
              : (data['deliveryDate'] as Timestamp).toDate(),
      address: AddressModel.fromMap(data['address'] as Map<String, dynamic>),
      items:
          (data['items'] as List<dynamic>)
              .map((item) => CartModel.fromJson(item as Map<String, dynamic>))
              .toList(),
    );
  }
}
