import 'package:clothingstore/core/constants/colors.dart';
import 'package:clothingstore/common/widgets/add_to_cart_button.dart';
import 'package:clothingstore/common/widgets/delivery_details_section.dart';
import 'package:clothingstore/common/widgets/product_card.dart';
import 'package:clothingstore/common/widgets/products_details.dart';

import 'package:clothingstore/common/widgets/products_image_slider.dart';

import 'package:clothingstore/features/products/domain/entites/product_entity.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SingleProductsScreen extends StatelessWidget {
  const SingleProductsScreen({super.key, required this.productModel});

  final ProductEntity productModel;
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final PageController controller = PageController();

    return Scaffold(
      bottomNavigationBar: AddToCartButton(
        screenHeight: screenHeight,
        screenWidth: screenWidth,
        productId: productModel,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image Section
            ProductImageSection(
              imageScrollController: controller,
              screenHeight: screenHeight,
              imageUrls: productModel.Image ?? [],
            ),

            ProductsDetails(
              screenWidth: screenWidth,
              productEntity: productModel,
              screenHeight: screenHeight,
            ),

            // Divider Section
            SizedBox(height: screenHeight * 0.05),
            Divider(thickness: 5, color: GColors.gery),
            SizedBox(height: screenHeight * 0.05),

            // Delivery Details Section
            DeliveryDetailsSection(
              screenWidth: screenWidth,
              screenHeight: screenHeight,
              products: productModel,
            ),

            // Horizontal List Section for Recommended Products or Similar Items
            SizedBox(height: screenHeight * 0.05),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
              child: Text("Others Also Bought", style: GoogleFonts.poppins()),
            ),
            SizedBox(height: screenHeight * 0.02),
            //** other also bought section */
            SizedBox(
              height: screenHeight * 0.4,
              child: ListView.builder(
                itemCount: 6,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.01,
                    ),
                    child: ProductCard(
                      brand: "",
                      image: "",
                      price: "",
                      title: "",

                      screenWidth: screenWidth * 0.4,
                      screenHeight: screenHeight * 0.25,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
