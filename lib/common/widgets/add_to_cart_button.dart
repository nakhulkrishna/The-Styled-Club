import 'package:clothingstore/common/bloc/products_size_cubit.dart';
import 'package:clothingstore/core/constants/colors.dart';
import 'package:clothingstore/features/cart/data/datasource/cart_remote_data_source.dart';
import 'package:clothingstore/features/cart/data/models/cart_model.dart';
import 'package:clothingstore/features/cart/presentation/bloc/cubit/cart_cubit.dart';
import 'package:clothingstore/features/products/data/models/products_model/product_model.dart';
import 'package:clothingstore/features/products/domain/entites/product_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

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
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final userId = user.uid;
      // do something with userId
    } else {
      // handle not logged in
    }

    return SizedBox(
      height: screenHeight * 0.1,
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: GColors.gery),
                ),
                height: screenHeight * 0.065,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Iconsax.heart),
                    SizedBox(width: screenWidth * 0.01),
                    Text("WISHLIST", style: GoogleFonts.poppins()),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  final selectedSize = context.read<SizeSelectionCubit>().state;

                  if (selectedSize == null || selectedSize.isEmpty) {
                    // show warning
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Please select a size")),
                    );
                    return;
                  }

                  final user = FirebaseAuth.instance.currentUser;
                  if (user == null) return;

                  final cartItem = CartModel(
                    
                    productId: productId.id,
                    brandName: productId.brand!.name,
                    image: productId.thumbnail,
                    price: productId.salePrice,
                    title: productId.title,

                    quantity: 1,
                    selectedVariation: {"Size": selectedSize},
                    // you can also fill in title, price, image etc if needed
                  );

                  context.read<CartCubit>().addToCart(user.uid, cartItem);
                },
                child: Container(
                  height: screenHeight * 0.065,
                  color: GColors.error,
                  child: Center(
                    child: Text(
                      "ADD TO CART",
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
  }
}
