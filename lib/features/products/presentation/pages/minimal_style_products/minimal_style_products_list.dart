import 'dart:developer';

import 'package:clothingstore/common/widgets/product_card.dart';
import 'package:clothingstore/features/products/presentation/bloc/product/product_cubit.dart';
import 'package:clothingstore/features/products/presentation/bloc/product/product_state.dart';
import 'package:clothingstore/features/products/presentation/pages/single_product/single_product_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class MinimalStyleProductsList extends StatelessWidget {
  const MinimalStyleProductsList({
    super.key,
    required this.categoryId,
    required this.itemCategory,
  });
  final String categoryId;
  final String itemCategory;

  @override
  Widget build(BuildContext context) {
    log(categoryId);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: screenHeight * 0.1,

        child: Row(
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Iconsax.filter),
                  SizedBox(width: screenWidth * 0.01),
                  Text("FILTER", style: GoogleFonts.poppins()),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.sort_rounded),
                  SizedBox(width: screenWidth * 0.01),
                  Text("SORT", style: GoogleFonts.poppins()),
                ],
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(
          itemCategory,
          style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.02, // Adjust padding
            vertical: screenWidth * 0.02, // Adjust padding
          ),
          child: Column(
            children: [
              // Top Banner or Category Information Container
              Container(
                height: screenHeight * 0.23,
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),

              // // Add some space below the top container
              SizedBox(height: screenWidth * 0.02),
              BlocBuilder<
                MinimalCategoryBasedCubit,
                MinimalCategoryBasedProductsState
              >(
                builder: (context, state) {
                  if (state is MinimalCategoryBasedProductsLoading) {
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 10,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        // mainAxisSpacing: screenWidth * 0.02,
                        crossAxisSpacing: screenWidth * 0.01,
                        childAspectRatio: 0.55,
                      ),
                      itemBuilder: (context, index) {
                        return ProductCard(
                          brand: "",
                          image: '',
                          price: "",
                          title: "",
                          screenWidth: screenWidth,
                          screenHeight: screenHeight * 0.3,
                        );
                      },
                    );
                  } else if (state is MinimalCategoryBasedProductsLoaded) {
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: state.products.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        // mainAxisSpacing: screenWidth * 0.02,
                        crossAxisSpacing: screenWidth * 0.01,
                        childAspectRatio: 0.55,
                      ),
                      itemBuilder: (context, index) {
                        final products = state.products[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => SingleProductsScreen(
                                      productModel: products,
                                    ),
                              ),
                            );
                          },
                          child: ProductCard(
                            brand: products.brand!.name,
                            image: products.thumbnail,
                            price: products.salePrice.toString(),
                            title: products.title,
                            screenWidth: screenWidth,
                            screenHeight: screenHeight * 0.3,
                          ),
                        );
                      },
                    );
                  } else if (state is MinimalCategoryBasedProductsError) {
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 10,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        // mainAxisSpacing: screenWidth * 0.02,
                        crossAxisSpacing: screenWidth * 0.01,
                        childAspectRatio: 0.55,
                      ),
                      itemBuilder: (context, index) {
                        return ProductCard(
                          brand: "",
                          image: '',
                          price: "",
                          title: "",
                          screenWidth: screenWidth,
                          screenHeight: screenHeight * 0.3,
                        );
                      },
                    );
                  } else {
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 10,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        // mainAxisSpacing: screenWidth * 0.02,
                        crossAxisSpacing: screenWidth * 0.01,
                        childAspectRatio: 0.55,
                      ),
                      itemBuilder: (context, index) {
                        return ProductCard(
                          brand: "",
                          image: '',
                          price: "",
                          title: "",
                          screenWidth: screenWidth,
                          screenHeight: screenHeight * 0.3,
                        );
                      },
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
