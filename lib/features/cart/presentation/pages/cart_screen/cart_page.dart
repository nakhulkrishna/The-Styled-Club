import 'package:clothingstore/core/constants/colors.dart';
import 'package:clothingstore/common/widgets/discountbanner.dart';
import 'package:clothingstore/common/widgets/product_card.dart';
import 'package:clothingstore/features/cart/presentation/bloc/cubit/cart_cubit.dart';
import 'package:clothingstore/features/cart/presentation/bloc/cubit/cart_state.dart';
import 'package:clothingstore/features/cart/presentation/widgets/car_products_card.dart';
import 'package:clothingstore/features/cart/presentation/widgets/cart_bottom_bar.dart';
import 'package:clothingstore/features/cart/presentation/widgets/final_price_data.dart';
import 'package:clothingstore/features/cart/presentation/widgets/items_count.dart';
import 'package:clothingstore/features/profile/data/model/user_model.dart';
import 'package:clothingstore/features/profile/presentation/bloc/cubit/address_cubit.dart';
import 'package:clothingstore/features/profile/presentation/bloc/cubit/address_state.dart';
import 'package:clothingstore/features/profile/presentation/pages/addresPages/pages/address_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!.uid;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<FetchCartItemsCubit>().getFecthItems(user);
    });
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Cart",
          style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ),
      body: BlocBuilder<DeliveryCubit, DeliveryState>(
        builder: (context, deliveryState) {
          AddressModel? selectedAddressId;

          if (deliveryState is DeliveryLoaded) {
            selectedAddressId = deliveryState.selectedAddressModel;
          }

          return Stack(
            children: [
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.only(bottom: screenHeight * 0.1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DiscountBanner(
                      screenWidth: screenWidth,
                      screenHeight: screenHeight,
                    ),
                    UserAddressSelector(
                      screenHeight: screenHeight,
                      screenWidth: screenWidth,
                    ),
                    const ItesmCount(),
                    const Divider(color: GColors.gery),
                    BlocBuilder<FetchCartItemsCubit, FetchCartState>(
                      builder: (context, state) {
                        if (state is FetchCartLoaded) {
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: state.cartItem.length,
                            itemBuilder:
                                (context, index) => CartProductsCard(
                                  index: index,
                                  cartModel: state.cartItem[index],
                                  screenHeight: screenHeight,
                                  screenWidth: screenWidth,
                                ),
                          );
                        } else {
                          return const SizedBox.shrink();
                        }
                      },
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    // CouponAndGift(
                    //   screenHeight: screenHeight,
                    //   screenWidth: screenWidth,
                    //   iconData: Iconsax.tag,
                    //   hint: "Enter Coupon Code",
                    //   suffix: 'APPLY',
                    //   title: "Apply Coupon",
                    // ),
                    // SizedBox(height: screenHeight * 0.01),
                    // CouponAndGift(
                    //   screenHeight: screenHeight,
                    //   screenWidth: screenWidth,
                    //   iconData: Iconsax.tag,
                    //   hint: "Enter Gift Voucher Code",
                    //   suffix: 'APPLY',
                    //   title: "Gift Voucher",
                    // ),
                    BlocBuilder<FetchCartItemsCubit, FetchCartState>(
                      builder: (context, state) {
                        if (state is FetchCartLoaded) {
                          final itemCount = state.cartItem.length;
                          final totalPrice = state.cartItem.fold(
                            0.0,
                            (sum, item) =>
                                item.isSelected ? sum + item.price : sum,
                          );

                          return FinalPriceData(
                            itemcount: itemCount,
                            screenHeight: screenHeight,
                            screenWidth: screenWidth,
                            totalPrice: totalPrice,
                          );
                        } else {
                          return FinalPriceData(
                            itemcount: 0,
                            screenHeight: screenHeight,
                            screenWidth: screenWidth,
                            totalPrice: 0.0,
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: CartBottomBar(
                  screenHeight: screenHeight,
                  selectedAddressId: selectedAddressId,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class CouponAndGift extends StatelessWidget {
  const CouponAndGift({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.iconData,
    required this.title,
    required this.hint,
    required this.suffix,
  });

  final double screenHeight;
  final double screenWidth;
  final IconData iconData;
  final String title;
  final String hint;
  final String suffix;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: GColors.gery)),
      ),
      height: screenHeight * .18,
      width: screenWidth,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenHeight * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(iconData),
                SizedBox(width: screenHeight * .01),
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: GColors.darkergray,
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * .04),
            TextField(
              style: GoogleFonts.poppins(color: GColors.darkergray),
              decoration: InputDecoration(
                suffixText: suffix,
                suffixStyle: GoogleFonts.poppins(color: Colors.teal),
                hintText: hint,
                hintStyle: GoogleFonts.poppins(color: GColors.darkgery),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: GColors.gery),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: GColors.gery),
                ),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: GColors.gery),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UserAddressSelector extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;

  const UserAddressSelector({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeliveryCubit, DeliveryState>(
      builder: (context, state) {
        if (state is DeliveryLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is DeliveryLoaded) {
          final addresses = state.addresses;
          final selectedId = state.selectedAddressId;

          if (addresses.isEmpty) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "No saved addresses found.",
                style: GoogleFonts.poppins(color: GColors.darkgery),
              ),
            );
          }

          final firstValidAddress = addresses.firstWhere(
            (a) => a.id != null,
            orElse: () => addresses.first,
          );

          if (selectedId == null && firstValidAddress.id != null) {
            context.read<DeliveryCubit>().selectAddress(firstValidAddress.id!);
          }

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Select Delivery Address",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed:
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddressPage(),
                            ),
                          ),
                      child: Text(
                        "Add Address",
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: GColors.buttonPrimary,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ],
                ),
                ...addresses
                    .where((a) => a.id != null)
                    .map(
                      (address) => RadioListTile<String>(
                        contentPadding: EdgeInsets.zero,
                        value: address.id!,
                        groupValue: selectedId,
                        onChanged:
                            (value) => context
                                .read<DeliveryCubit>()
                                .selectAddress(value!),
                        title: Text(
                          address.addressType,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        subtitle: Text(
                          "${address.flat}, ${address.street} (${address.pincode}), ${address.landmark}, ${address.city}, ${address.state} ${address.phone}",
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: GColors.darkgery,
                          ),
                        ),
                      ),
                    ),
              ],
            ),
          );
        } else if (state is DeliveryError) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Failed to load addresses",
              style: GoogleFonts.poppins(color: Colors.red),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
