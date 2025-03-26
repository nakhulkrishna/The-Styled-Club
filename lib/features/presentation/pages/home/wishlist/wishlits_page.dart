import 'package:clothingstore/features/presentation/widgets/listviewProductCard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WishlitsPage extends StatelessWidget {
  const WishlitsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("WISHLIST", style: GoogleFonts.poppins(fontSize: 14)),
      ),

      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,

          crossAxisSpacing: screenWidth * 0.01,
          childAspectRatio: 0.55,
        ),
        itemBuilder: (context, index) {
          return ProductCard(
            isWishlist: true,
            screenWidth: screenWidth,
            screenHeight: screenHeight * 0.25,
          );
        },
      ),
    );
  }
}
