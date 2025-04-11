import 'dart:developer';

import 'package:clothingstore/features/order/data/models/order_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OrderRemoteDataSource {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final userId = FirebaseAuth.instance.currentUser!.uid;

  Future<void> makeOrder(OrderModel order) async {
    try {
      await _db
          .collection("User")
          .doc(userId)
          .collection("Orders")
          .add(order.toJson());
    } catch (e) {
      print("Error adding order: $e");
      rethrow;
    }
  }

  Future<void> cancelOrder(String orderId) async {
    try {
      await _db
          .collection("User")
          .doc(userId)
          .collection("Orders")
          .doc(orderId)
          .delete();
    } catch (e) {
      print("Error cancelling order: $e");
      rethrow;
    }
  }

  Future<List<OrderModel>> fetchAllOrders() async {
    try {
      final querySnapshot =
          await _db.collection("User").doc(userId).collection("Orders").get();

      return querySnapshot.docs
          .map((doc) => OrderModel.fromSnapshot(doc))
          .toList();
    } catch (e, stacks) {
      log(e.toString(), stackTrace: stacks);
      print("Error fetching orders: $e");
      rethrow;
    }
  }
}
