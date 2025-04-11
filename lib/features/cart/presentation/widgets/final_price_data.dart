import 'package:clothingstore/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FinalPriceData extends StatelessWidget {
  const FinalPriceData({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.totalPrice,
    required this.itemcount,
  });

  final double screenHeight;
  final double screenWidth;
  final double totalPrice;
  final int itemcount;

  @override
  Widget build(BuildContext context) {
    // Calculations
    double gst = totalPrice * 0.18;
    double shippingCharges = itemcount > 0 ? 50 : 0;
    double finalTotal = totalPrice + gst + shippingCharges;
    double cashback = finalTotal * 0.05;

    return SizedBox(
      height: screenHeight * 0.3,
      width: screenWidth,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.02),
            Text(
              "Price Details ",
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: GColors.black,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),

            _priceRow("Cart Total", totalPrice),
            SizedBox(height: screenHeight * 0.01),

            _priceRow("GST (18%)", gst),
            SizedBox(height: screenHeight * 0.01),

            _priceRow("Shipping Charges", shippingCharges, isHighlighted: true),
            SizedBox(height: screenHeight * 0.01),

            const Divider(),
            SizedBox(height: screenHeight * 0.01),

            _priceRow("Total Price", finalTotal, isBold: true, isBig: true),
            SizedBox(height: screenHeight * 0.01),

            _priceRow(
              "Cashback Earned",
              cashback,
              isHighlighted: true,
              isBold: true,
              isBig: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _priceRow(
    String label,
    double value, {
    bool isBold = false,
    bool isBig = false,
    bool isHighlighted = false,
  }) {
    return Row(
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: isBig ? 14 : 12,
            fontWeight: isBold ? FontWeight.w500 : FontWeight.normal,
            color:
                isHighlighted
                    ? GColors.buttonPrimary
                    : GColors.darkgery, // Adjust spelling if needed
          ),
        ),
        const Spacer(),
        Text(
          value.toStringAsFixed(2),
          style: GoogleFonts.poppins(
            fontSize: isBig ? 12 : 12,
            fontWeight: isBold ? FontWeight.w500 : FontWeight.normal,
            color:
                isHighlighted
                    ? GColors.buttonPrimary
                    : GColors.darkgery, // Same here
          ),
        ),
      ],
    );
  }
}
