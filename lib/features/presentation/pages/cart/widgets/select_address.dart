import 'package:clothingstore/core/constants/colors.dart';
import 'package:clothingstore/features/presentation/pages/cart/address_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectAddress extends StatelessWidget {
  const SelectAddress({super.key, required this.screenWidth});

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
      child: Row(
        children: [
          Text(
            "Please Select Address",
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w300,
            ),
          ),
          Spacer(),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddressPage()),
              );
            },
            child: Text(
              "Add Address",
              style: GoogleFonts.poppins(
                fontSize: 12,
                color: GColors.buttonPrimary,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
