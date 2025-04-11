import 'package:clothingstore/core/constants/colors.dart';
import 'package:clothingstore/features/products/presentation/bloc/product/product_cubit.dart';

import 'package:clothingstore/features/products/presentation/bloc/product/product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: TextField(
          cursorColor: GColors.darkergray,
          cursorHeight: 15,
          onChanged: (value) {
            if (value.isNotEmpty) {
              context.read<SearchCubit>().searchProducts(value);
            }
          },
          decoration: InputDecoration(
            hintText: " Search for products",
            hintStyle: GoogleFonts.poppins(fontSize: 12),
            border: OutlineInputBorder(borderSide: BorderSide.none),
          ),
        ),
        actions: [
          Icon(Iconsax.search_normal_1),
          SizedBox(width: screenWidth * .03),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: screenHeight * .03,
            width: screenWidth,
            color: GColors.gery,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * .03),
              child: Text(
                "Recent Searches",
                style: GoogleFonts.poppins(color: GColors.darkgery),
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<SearchCubit, ProductState>(
              builder: (context, state) {
                if (state is ProductLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is ProductError) {
                  return Center(child: Text("Error: ${state.message}"));
                } else if (state is ProductLoaded) {
                  if (state.products.isEmpty) {
                    return Center(child: Text("No products found."));
                  }
                  return ListView.builder(
                    itemCount: state.products.length,
                    itemBuilder: (context, index) {
                      final product = state.products[index];
                      return ListTile(
                        leading: Image.network(product.thumbnail, width: 40),
                        title: Text(product.title),
                        subtitle: Text("₹${product.price}"),
                      );
                    },
                  );
                } else {
                  return Center(child: Text("Type to search products."));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
