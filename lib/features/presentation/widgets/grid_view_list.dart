import 'package:clothingstore/core/constants/colors.dart';
import 'package:clothingstore/features/presentation/pages/home/categoriesedProducts/categoriesed_products_page.dart';
import 'package:clothingstore/features/presentation/pages/home/minimalStyleProducts.dart/minimal_style_products_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class gridviewCard extends StatelessWidget {
  const gridviewCard({
    super.key,
    required this.screenHeight,
    required this.categorys,
    this.scrollController,
    required this.screenWidth,
    this.isNotCategory = false,
  });

  final double screenHeight;
  final List<String> categorys;
  final ScrollController? scrollController;
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
        itemCount: categorys.length,
        controller: scrollController,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 8, bottom: 5),
            child:
                isNotCategory
                    ? GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CategorizedProductsPage(),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.amberAccent,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              top: screenHeight * 0.03,
                              child: Container(
                                color: GColors.light,
                                height: screenHeight * 0.02,
                                width: screenWidth * 0.3,
                                child: Center(
                                  child: Text(
                                    categorys[index],
                                    style: GoogleFonts.poppins(fontSize: 8),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                    : GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MinimalStyleProductsPage(),
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
                              categorys[index],
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
