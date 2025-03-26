import 'package:clothingstore/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartBottomBar extends StatelessWidget {
  const CartBottomBar({super.key, required this.screenHeight});

  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight * 0.08,
      child: Row(
        children: [
          Expanded(
            child: Center(
              child: Text("2999", style: GoogleFonts.poppins(fontSize: 15)),
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: screenHeight * 0.05,
                decoration: BoxDecoration(
                  color: GColors.error,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text(
                    "CONTINUE",
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
