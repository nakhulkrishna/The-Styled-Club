import 'package:clothingstore/core/constants/colors.dart';

import 'package:clothingstore/features/products/presentation/pages/categoriesed_products/pages/categoried_products_list.dart';
import 'package:clothingstore/features/products/presentation/pages/minimal_style_products/minimal_style_products_list.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdornmentsMinimalStyleCategorieList extends StatelessWidget {
  const AdornmentsMinimalStyleCategorieList({
    super.key,
    required this.screenHeight,

    required this.screenWidth,
    this.isNotCategory = false,
  });

  final double screenHeight;

  final double screenWidth;

  final bool isNotCategory;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight * 0.48,
      child: GridView.builder(
        addSemanticIndexes: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        physics: ScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 10,

        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 8, bottom: 5),
            child:
                isNotCategory
                    ? GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.amberAccent,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: Image.network("data.image", fit: BoxFit.cover),
                        ),
                      ),
                    )
                    : GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => MinimalStyleProductsList(
                                  categoryId: "",
                                  itemCategory: "",
                                ),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.amberAccent,

                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Container(
                          color: GColors.light,
                          height: screenHeight * 0.02,
                          width: screenWidth * 0.3,
                          child: Center(
                            child: Text(
                              "data.name",
                              style: GoogleFonts.poppins(fontSize: 10),
                            ),
                          ),
                        ),
                      ),
                    ),
          );
        },
      ),
    );
  }
}
