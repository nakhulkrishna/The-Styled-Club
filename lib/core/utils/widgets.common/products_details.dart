import 'package:clothingstore/core/constants/colors.dart';
import 'package:clothingstore/core/utils/widgets.common/dot_indicator.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductsDetails extends StatelessWidget {
  const ProductsDetails({
    super.key,
    required this.screenWidth,
    required this.backendDataList,
    required this.screenHeight,
    required this.colors,
  });

  final double screenWidth;
  final List<String> backendDataList;
  final double screenHeight;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Dot Indicator for showing images count (you can replace this with your custom widget)
          DotIndicator(position: 1, dotCount: backendDataList.length),
          SizedBox(height: screenHeight * 0.01),

          // Product Title and Price Details
          Text(
            "Product Name 1 ",
            style: GoogleFonts.poppins(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: GColors.darkergray,
            ),
          ),
          Text(
            "Product Category",
            style: GoogleFonts.poppins(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: GColors.darkgery,
            ),
          ),
          Text(
            "\$399",
            style: GoogleFonts.poppins(
              fontSize: 17,
              fontWeight: FontWeight.w500,
              color: GColors.darkergray,
            ),
          ),
          Text(
            "MRP incl. of all taxes",
            style: GoogleFonts.poppins(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: GColors.darkergray,
            ),
          ),

          // Color Options Section
          SizedBox(height: screenHeight * 0.05),
          Text("Choose Color", style: GoogleFonts.poppins()),
          SizedBox(height: screenHeight * 0.02),
          SizedBox(
            height: screenHeight * 0.04,
            width: screenWidth,
            child:ListView.builder(
                  itemCount: colors.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      
                      child: Padding(
                        padding: EdgeInsets.only(right: 10.0),
                        child: Container(
                          padding: EdgeInsets.all(3.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.black,
                            ),
                          ),
                          child: CircleAvatar(backgroundColor: colors[index]),
                        ),
                      ),
                    );
                  },
                ),
          ),

          // Size Selection Section
          SizedBox(height: screenHeight * 0.05),
          Text("Please select size.", style: GoogleFonts.poppins()),
          SizedBox(height: screenHeight * 0.02),
          SizedBox(
            width: screenWidth,
            child:  Container(
              height: screenHeight * 0.035,
              width: screenWidth * 0.12,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.black,
                ),
              ),
              child: Center(
                child: Text(
                  "UK {index + 5}",
                  style: GoogleFonts.poppins(fontSize: 11),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
