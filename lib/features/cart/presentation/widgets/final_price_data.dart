import 'package:clothingstore/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FinalPriceData extends StatelessWidget {
  const FinalPriceData({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
  });

  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight * 0.3,
      width: screenWidth,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Price Details (2 Items)", style: GoogleFonts.poppins()),
            SizedBox(height: screenHeight * 0.01),
            Row(
              children: [
                Text(
                  "Cart Total",
                  style: GoogleFonts.poppins(
                    color: GColors.darkgery,
                    fontSize: 12,
                  ),
                ),
                Spacer(),
                Text(
                  "4999",
                  style: GoogleFonts.poppins(
                    color: GColors.darkgery,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.01),
            Row(
              children: [
                Text(
                  "GST",
                  style: GoogleFonts.poppins(
                    color: GColors.darkgery,
                    fontSize: 12,
                  ),
                ),
                Spacer(),
                Text(
                  "360",
                  style: GoogleFonts.poppins(
                    color: GColors.darkgery,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.01),
            Row(
              children: [
                Text(
                  "Shiping Charges",
                  style: GoogleFonts.poppins(
                    color: GColors.buttonPrimary,
                    fontSize: 12,
                  ),
                ),
                Spacer(),
                Text(
                  "50",
                  style: GoogleFonts.poppins(
                    color: GColors.darkgery,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.01),
            Divider(),
            SizedBox(height: screenHeight * 0.01),
            Row(
              children: [
                Text(
                  "Total Price",
                  style: GoogleFonts.poppins(
                    color: GColors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Spacer(),
                Text(
                  "4999",
                  style: GoogleFonts.poppins(
                    color: GColors.black,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.01),
            Row(
              children: [
                Text(
                  "Cashback Earned",
                  style: GoogleFonts.poppins(
                    color: GColors.buttonPrimary,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Spacer(),
                Text(
                  "250",
                  style: GoogleFonts.poppins(
                    color: GColors.buttonPrimary,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
