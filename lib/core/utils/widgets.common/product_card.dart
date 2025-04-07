import 'dart:developer';

import 'package:clothingstore/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    this.isWishlist = false,
    required this.image,
    required this.title,
    required this.category,
    required this.price,
  });

  final double screenWidth;
  final double screenHeight;
  final bool isWishlist;
  final String image;
  final String title;
  final String category;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: SizedBox(
        width: screenWidth,

        child: Column(
          children: [
            Container(
              width: screenWidth,
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                ),
              ),
              height: screenHeight,
              child:
                  image.isNotEmpty
                      ? Image.network(image, fit: BoxFit.cover)
                      : SizedBox.shrink(),
            ),

            isWishlist
                ? Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.015,
                    ),
                    child: SizedBox(
                      width: screenWidth,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: GoogleFonts.poppins(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: GColors.darkergray,
                            ),
                          ),
                          Text(
                            category,
                            style: GoogleFonts.poppins(
                              fontSize: 10,
                              color: GColors.darkgery,
                            ),
                          ),
                          Text(
                            price,
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              color: GColors.darkergray,
                            ),
                          ),
                          Text(
                            "MRP incl. of all taxes",
                            style: GoogleFonts.poppins(
                              fontSize: 10,
                              color: GColors.darkgery,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          GestureDetector(
                            onTap: () {
                              log("Move to cart");
                            },
                            child: Container(
                              height: screenHeight * 0.15,
                              decoration: BoxDecoration(
                                border: Border.all(color: GColors.accent),
                              ),

                              child: Center(
                                child: Text(
                                  "MOVE TO CART",
                                  style: GoogleFonts.poppins(fontSize: 12),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
                : Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.015,
                    ),
                    child: SizedBox(
                      width: screenWidth,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            maxLines: 1,
                            title,
                            style: GoogleFonts.poppins(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              color: GColors.darkergray,
                            ),
                          ),
                          Text(
                            category,
                            style: GoogleFonts.poppins(
                              fontSize: 10,
                              color: GColors.darkgery,
                            ),
                          ),
                          Text(
                            price,
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              color: GColors.darkergray,
                            ),
                          ),
                          Text(
                            "MRP incl. of all taxes",
                            style: GoogleFonts.poppins(
                              fontSize: 10,
                              color: GColors.darkgery,
                            ),
                          ),

                          // SizedBox(height: screenHeight * 0.01),
                        ],
                      ),
                    ),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
