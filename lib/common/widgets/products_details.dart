import 'package:clothingstore/common/bloc/products_size_cubit.dart';
import 'package:clothingstore/common/widgets/dot_indicator.dart';
import 'package:clothingstore/core/constants/colors.dart';

import 'package:clothingstore/features/products/domain/entites/product_entity.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductsDetails extends StatelessWidget {
  const ProductsDetails({
    super.key,
    required this.screenWidth,

    required this.screenHeight,

    required this.productEntity,
  });

  final double screenWidth;
  final ProductEntity productEntity;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    final sizes =
        productEntity.producstAttributes
            ?.firstWhere((attr) => attr.name == "Size")
            .values!
            .map((e) => e.trim())
            .toList() ??
        [];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // if(productEntity.images != null)
          // DotIndicator(position: 1, dotCount: productEntity.Image!.length),
          SizedBox(height: screenHeight * 0.01),

          // Product Title and Price Details
          Text(
            productEntity.title,
            style: GoogleFonts.poppins(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: GColors.darkergray,
            ),
          ),
          Text(
            productEntity.categoryid ?? "",
            style: GoogleFonts.poppins(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: GColors.darkgery,
            ),
          ),
          Text(
            productEntity.brand!.name,
            style: GoogleFonts.poppins(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: GColors.darkgery,
            ),
          ),
          SizedBox(height: screenHeight * 0.01),
          RichText(
            text: TextSpan(
              children: [
                // Offer Price
                TextSpan(
                  text: "${productEntity.salePrice.toString()}   ",
                  style: GoogleFonts.poppins(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: GColors.darkergray,
                  ),
                ),
                // Actual Price (Struck Through)
                TextSpan(
                  text: productEntity.price.toString(),
                  style: GoogleFonts.poppins(
                    decoration: TextDecoration.lineThrough,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: GColors.darkergray,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.01),
          Text(
            "MRP incl. of all taxes",
            style: GoogleFonts.poppins(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: GColors.darkergray,
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
          Text("Please select size.", style: GoogleFonts.poppins()),
          SizedBox(height: screenHeight * 0.02),
          BlocBuilder<SizeSelectionCubit, String?>(
            builder: (context, selectedSize) {
              return SizedBox(
                width: screenWidth,
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: List.generate(sizes.length, (index) {
                    final size = sizes[index];
                    final isSelected = selectedSize == size;

                    return GestureDetector(
                      onTap: () {
                        context.read<SizeSelectionCubit>().selectSize(size);
                      },
                      child: Container(
                        height: screenHeight * 0.035,
                        width: screenWidth * 0.12,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: isSelected ? Colors.blue : Colors.black,
                          ),
                          color: isSelected ? Colors.blue.shade100 : null,
                        ),
                        child: Center(
                          child: Text(
                            size,
                            style: GoogleFonts.poppins(
                              fontSize: 11,
                              color: isSelected ? Colors.blue : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
