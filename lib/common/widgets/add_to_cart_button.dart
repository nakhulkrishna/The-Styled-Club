import 'package:clothingstore/core/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
  });

  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
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
        ],
      ),
    );
  }
}
