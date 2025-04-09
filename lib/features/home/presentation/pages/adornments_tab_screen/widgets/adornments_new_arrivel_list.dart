
import 'package:clothingstore/common/widgets/product_card.dart';
import 'package:clothingstore/features/products/data/models/products_model/product_model.dart';
import 'package:flutter/material.dart';

class AdornmentsNewArrivelList extends StatelessWidget {
  const AdornmentsNewArrivelList({
    super.key,
    required this.screenHeight,
    required this.totalCount,

    required this.screenWidth,
    required this.onTap,
    required this.products,
  });

  final double screenHeight;
  final int totalCount;

  final double screenWidth;
  final VoidCallback onTap;
  final List<ProductModel> products;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight * 0.4,
      child: ListView.builder(
        physics: ScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 10,

        itemBuilder: (context, index) {
          

          return GestureDetector(
            onTap: onTap,
            child: ProductCard(
              screenWidth: screenWidth * 0.5,
              screenHeight: screenHeight * 0.3,
              image:"",
              title: "",
              brand: "",
              price: "",
            ),
          );
        },
      ),
    );
  }
}

