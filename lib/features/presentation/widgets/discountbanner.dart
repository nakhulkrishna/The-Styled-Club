
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth,
      height: screenHeight * 0.035,
      color: Colors.orange, // Use your GColors.warning here
      child: Padding(
        padding: EdgeInsets.only(top: screenHeight * 0.0025),
        child: Text(
          textAlign: TextAlign.center,
          "GET 10% OFF on your first Purchase",
          style: GoogleFonts.poppins(
            color: Colors.white,
          ), // Use your GColors.textWhite here
        ),
      ),
    );
  }
}
