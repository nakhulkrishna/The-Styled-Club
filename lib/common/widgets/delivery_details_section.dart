import 'package:clothingstore/core/constants/colors.dart';
import 'package:clothingstore/features/products/domain/entites/product_entity.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class DeliveryDetailsSection extends StatelessWidget {
  const DeliveryDetailsSection({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.products,
  });

  final double screenWidth;
  final double screenHeight;
  final ProductEntity products;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Delivery Details", style: GoogleFonts.poppins()),
          SizedBox(height: screenHeight * 0.02),
          TextField(
            style: GoogleFonts.poppins(color: GColors.darkergray),
            decoration: InputDecoration(
              suffixText: "CHECK",
              suffixStyle: GoogleFonts.poppins(color: Colors.teal),
              hintText: "Enter Pincode",
              hintStyle: GoogleFonts.poppins(color: GColors.darkgery),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: GColors.gery),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: GColors.gery),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: GColors.gery),
              ),
            ),
          ),

          // Product Details Section
          SizedBox(height: screenHeight * 0.05),
          Text("Product Details", style: GoogleFonts.poppins()),
          SizedBox(height: screenHeight * 0.05),
          Text("Material & Care :", style: GoogleFonts.poppins()),

          // Dynamically loaded product description (bullet points)
          Text(products.decription!),
        ],
      ),
    );
  }
}
