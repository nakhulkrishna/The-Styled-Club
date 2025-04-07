
import 'package:clothingstore/core/utils/widgets.common/product_card.dart';
import 'package:clothingstore/features/data/models/products/product_model.dart';
import 'package:flutter/material.dart';

class WomenNewArrivelList extends StatelessWidget {
  const WomenNewArrivelList({
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
        itemCount: products.length,

        itemBuilder: (context, index) {
          final product = products[index];

          return GestureDetector(
            onTap: onTap,
            child: ProductCard(
              screenWidth: screenWidth * 0.5,
              screenHeight: screenHeight * 0.3,
              image: product.thumbnail,
              title: product.title,
              category: product.categoryid ?? "",
              price: product.price.toString(),
            ),
          );
        },
      ),
    );
  }
}

