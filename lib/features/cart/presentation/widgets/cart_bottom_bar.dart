import 'package:clothingstore/core/constants/colors.dart';
import 'package:clothingstore/core/constants/enums.dart';
import 'package:clothingstore/features/cart/data/models/cart_model.dart';
import 'package:clothingstore/features/cart/presentation/bloc/cubit/cart_cubit.dart';
import 'package:clothingstore/features/cart/presentation/bloc/cubit/cart_state.dart';
import 'package:clothingstore/features/order/data/models/order_model.dart';
import 'package:clothingstore/features/order/presentation/bloc/cubit/order_cubit.dart';
import 'package:clothingstore/features/profile/data/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class CartBottomBar extends StatelessWidget {
  const CartBottomBar({
    super.key,
    required this.screenHeight,
    this.selectedAddressId,
  });

  final double screenHeight;
  final AddressModel? selectedAddressId; // or use AddressModel if needed
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchCartItemsCubit, FetchCartState>(
      builder: (context, state) {
        double rawTotal = 0.0;
        double finalTotal = 0.0;
        double shippingCharges = 0.0;
        List<CartModel> selectedItems = [];
        final userId = FirebaseAuth.instance.currentUser!.uid;
        if (state is FetchCartLoaded) {
          selectedItems =
              state.cartItem.where((item) => item.isSelected).toList();
          rawTotal = selectedItems.fold(0.0, (sum, item) => sum + item.price);

          // ✅ Set shipping to 50 only if items are selected
          shippingCharges = selectedItems.isNotEmpty ? 50 : 0;

          // 🧮 Final price calculation
          double gst = rawTotal * 0.18;
          finalTotal = rawTotal + gst + shippingCharges;
        }

        return Container(
          color: Colors.white,
          height: screenHeight * 0.08,
          child: Row(
            children: [
              // 💰 Final Total Price
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: GColors.primary,
                    ),
                    child: Center(
                      child: Text(
                        "₹${finalTotal.toStringAsFixed(2)}",
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // 🛒 CONTINUE Button
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      if (selectedItems.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Please select at least one item to order",
                            ),
                          ),
                        );
                        return;
                      }

                      final orderId =
                          DateTime.now().millisecondsSinceEpoch.toString();

                      final order = OrderModel(
                        id: orderId,
                        userId: userId, // Set userId if available
                        status: OrderStatus.processing,
                        totalAmount: finalTotal,
                        orderDate: DateTime.now(),
                        paymentsMethods: "COD",
                        deliveryDate: null,
                        address:
                            selectedAddressId, // Add real address if needed
                        items: selectedItems,
                      );

                      context.read<OrderCubit>().placeOrder(order);

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Order placed successfully"),
                        ),
                      );

                      debugPrint(
                        "Order Created: $orderId | Items: ${selectedItems.length}",
                      );
                    },

                    child: Container(
                      height: screenHeight * 0.05,
                      decoration: BoxDecoration(
                        color: GColors.error,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          "CONTINUE",
                          style: GoogleFonts.poppins(color: GColors.light),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
