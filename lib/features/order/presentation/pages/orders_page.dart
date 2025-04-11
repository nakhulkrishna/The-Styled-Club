import 'dart:developer';

import 'package:clothingstore/core/constants/colors.dart';
import 'package:clothingstore/features/cart/presentation/bloc/cubit/cart_cubit.dart';
import 'package:clothingstore/features/order/presentation/bloc/cubit/order_cubit.dart';
import 'package:clothingstore/features/order/presentation/bloc/cubit/order_state.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<OrderCubit>().loadAllOrders();
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Order History",
            style: GoogleFonts.poppins(fontSize: 14),
          ),
          bottom: TabBar(
            isScrollable: false,
            enableFeedback: false,
            overlayColor: MaterialStateProperty.all(Colors.transparent),
            dividerColor: Colors.transparent,
            labelStyle: GoogleFonts.poppins(color: GColors.black),
            unselectedLabelStyle: GoogleFonts.poppins(color: GColors.black),
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: GColors.buttonPrimary,
            tabs: const [Tab(text: "Online"), Tab(text: "In Store")],
          ),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              physics: BouncingScrollPhysics().applyTo(ClampingScrollPhysics()),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * .04,
                  vertical: screenWidth * .02,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BlocBuilder<OrderCubit, OrderState>(
                      builder: (context, state) {
                        if (state is OrderFetched) {
                          final orders = state.orders;

                          return ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: orders.length,
                            itemBuilder: (context, orderIndex) {
                              final orderData = orders[orderIndex];

                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "ORDERID# ${orderData.id}",
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  DottedLine(dashLength: 6, lineThickness: 1),
                                  const SizedBox(height: 8),

                                  // Order Date
                                  Row(
                                    children: [
                                      const Icon(Iconsax.box),
                                      const SizedBox(width: 8),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Order Date",
                                            style: GoogleFonts.poppins(
                                              fontSize: 14,
                                            ),
                                          ),
                                          Text(
                                            orderData.formattedOrderDate,
                                            style: GoogleFonts.poppins(
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),

                                  const SizedBox(height: 10),

                                  // Loop through items in the order
                                  ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: orderData.items.length,
                                    itemBuilder: (context, itemIndex) {
                                      final item = orderData.items[itemIndex];

                                      return Container(
                                        margin: const EdgeInsets.symmetric(
                                          vertical: 8,
                                        ),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            // Image
                                            Container(
                                              height: 100,
                                              width: 80,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                    item.image!,
                                                  ),
                                                  fit: BoxFit.cover,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                            ),
                                            const SizedBox(width: 12),

                                            // Details
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    item.title,
                                                    style: GoogleFonts.poppins(
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                  Text(
                                                    item.brandName!,
                                                    style: GoogleFonts.poppins(
                                                      fontSize: 12,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 6),
                                                  Text(
                                                    "Size: ${item.selectedVariation?['Size'] ?? 'N/A'}",
                                                    style: GoogleFonts.poppins(
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                  Text(
                                                    "Qty: ${item.quantity}",
                                                    style: GoogleFonts.poppins(
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                  Text(
                                                    "Price: ₹${item.price}",
                                                    style: GoogleFonts.poppins(
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        } else if (state is OrderLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          return const Center(child: Text("No orders found."));
                        }
                      },
                    ),

                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: const [
                  // Add content for the "In Store" tab
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
