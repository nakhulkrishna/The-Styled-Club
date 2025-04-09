
import 'package:clothingstore/common/widgets/product_card.dart';
import 'package:clothingstore/features/products/data/models/products_model/product_model.dart';
import 'package:flutter/material.dart';

  class WomenTopPicksList extends StatelessWidget {
    const WomenTopPicksList({
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
              brand: product.brand!.name,
              price: product.price.toString(),
            ),
          );
        },
      ),
    );
  }
}

