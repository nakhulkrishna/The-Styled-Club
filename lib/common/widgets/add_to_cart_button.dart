import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:iconsax/iconsax.dart';

import 'package:clothingstore/core/constants/colors.dart';
import 'package:clothingstore/common/bloc/products_size_cubit.dart';
import 'package:clothingstore/features/cart/data/models/cart_model.dart';
import 'package:clothingstore/features/cart/presentation/bloc/cubit/cart_cubit.dart';
import 'package:clothingstore/features/products/domain/entites/product_entity.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.productId,
  });

  final double screenHeight;
  final double screenWidth;
  final ProductEntity productId;

  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser;

    return SizedBox(
      height: screenHeight * 0.1,
      child: Row(
        children: [
          /// Wishlist Button (currently static)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: screenHeight * 0.065,
                decoration: BoxDecoration(
                  border: Border.all(color: GColors.gery),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Iconsax.heart),
                    SizedBox(width: screenWidth * 0.01),
                    Text("WISHLIST", style: GoogleFonts.poppins()),
                  ],
                ),
              ),
            ),
          ),

          /// Add to Cart Button
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  final selectedSize = context.read<SizeSelectionCubit>().state;

                  // Size not selected
                  if (selectedSize == null || selectedSize.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("⚠️ Please select a size"),
                        backgroundColor: Colors.orange,
                      ),
                    );
                    return;
                  }

                  // User not logged in
                  if (currentUser == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("❌ Please log in to add items to cart"),
                        backgroundColor: Colors.red,
                      ),
                    );
                    return;
                  }

                  final cartItem = CartModel(
                    productId: productId.id,
                    title: productId.title,
                    brandName: productId.brand?.name ?? "Unknown",
                    image: productId.thumbnail,
                    price: productId.salePrice,
                    quantity: 1,
                    isSelected: false,
                    selectedVariation: {"Size": selectedSize},
                  );

                  context.read<CartCubit>().addToCart(
                    currentUser.uid,
                    cartItem,
                  );

                  // Show success message
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "Item added to cart",
                        style: GoogleFonts.poppins(fontSize: 12),
                      ),
                      backgroundColor: Colors.green,
                      behavior: SnackBarBehavior.floating,
                      margin: const EdgeInsets.only(
                        bottom: 5,
                        left: 16,
                        right: 16,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                },
                child: Container(
                  height: screenHeight * 0.065,
                  color: GColors.error,
                  child: Center(
                    child: Text(
                      "ADD TO CART",
                      style: GoogleFonts.poppins(
                        color: GColors.light,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
