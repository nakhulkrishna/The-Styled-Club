import 'package:clothingstore/features/presentation/pages/home/categoriesedProducts/categoriesed_products_page.dart';
import 'package:clothingstore/features/presentation/pages/home/sharpDressing/sharp_dressing_products_page.dart';
import 'package:flutter/material.dart';

class SharpDressingListview extends StatelessWidget {
  const SharpDressingListview({
    super.key,
    required this.screenHeight,
    required this.totalCount,
    this.scrollController,
    required this.screenWidth,
  });

  final double screenHeight;
  final int totalCount;
  final ScrollController? scrollController;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight * 0.31,
      child: ListView.builder(
        physics: ScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: totalCount,
        controller: scrollController,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(2),
            child: SizedBox(
              width: screenWidth * 0.7,

              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SharpDressingProductsPage(),
                        ),
                      );
                    },
                    child: Container(
                      width: screenWidth,
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      height: screenHeight * 0.3,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
