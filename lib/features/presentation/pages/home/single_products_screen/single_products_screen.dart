import 'package:clothingstore/core/constants/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:clothingstore/features/presentation/logic/focusNode/focus_node.dart';
import 'package:clothingstore/features/presentation/logic/indicators/color_and_size_cubit.dart';
import 'package:clothingstore/features/presentation/logic/indicators/products_image_dot_indicator.dart';
import 'package:clothingstore/features/presentation/widgets/Products_details.dart';
import 'package:clothingstore/features/presentation/widgets/add_to_cart_button.dart';
import 'package:clothingstore/features/presentation/widgets/delivery_Details_Section.dart';
import 'package:clothingstore/features/presentation/widgets/dot_indicator.dart';
import 'package:clothingstore/features/presentation/widgets/listviewProductCard.dart';
import 'package:clothingstore/features/presentation/widgets/products_image_slider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';

class SingleProductsScreen extends StatelessWidget {
  const SingleProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Color> colors = [
      Colors.black,
      Colors.red,
      Colors.blueGrey,
      Colors.white,
      Colors.brown,
    ];

    List<String> backendDataList = [
      "Upper material is made of PU and TPU that is comfortable, breathable and easy to use",
      "Sole material is lightweight and durable",
      "Available in various sizes to suit your fit",
      "Easy to clean and maintain for long-term use",
      "Perfect for casual wear and outdoor activities",
    ];

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final PageController controller = PageController();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductsImageDotIndicatorCubit(controller),
        ),
        BlocProvider(
          create: (context) => ColorSelectionCubit(),
          child: ProductsDetails(
            screenWidth: screenWidth,
            backendDataList: backendDataList,
            screenHeight: screenHeight,
            colors: colors,
          ),
        ),
        BlocProvider(
          create: (context) => SizeSelectionCubit(),
          child: ProductsDetails(
            screenWidth: screenWidth,
            backendDataList: backendDataList,
            screenHeight: screenHeight,
            colors: colors,
          ),
        ),
      ],

      child: GestureDetector(
        onTap: () {
          context.read<FocusCubit>().hideKeyboard();
        },
        child: Scaffold(
          bottomNavigationBar: AddToCartButton(
            screenHeight: screenHeight,
            screenWidth: screenWidth,
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product Image Section
                ProductImageSection(
                  imageScrollController: controller,
                  screenHeight: screenHeight,
                  imageUrls: backendDataList,
                ),

                ProductsDetails(
                  screenWidth: screenWidth,
                  backendDataList: backendDataList,
                  screenHeight: screenHeight,
                  colors: colors,
                ),

                // Divider Section
                SizedBox(height: screenHeight * 0.05),
                Divider(thickness: 5, color: GColors.gery),
                SizedBox(height: screenHeight * 0.05),

                // Delivery Details Section
                DeliveryDetailsSection(
                  screenWidth: screenWidth,
                  screenHeight: screenHeight,
                  backendDataList: backendDataList,
                ),

                // Horizontal List Section for Recommended Products or Similar Items
                SizedBox(height: screenHeight * 0.05),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
                  child: Text(
                    "Others Also Bought",
                    style: GoogleFonts.poppins(),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                //** other also bought section */
                SizedBox(
                  height: screenHeight * 0.4,
                  child: ListView.builder(
                    itemCount: 6,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.01,
                        ),
                        child: ProductCard(
                          category: "",
                          image: "",
                          price: "",
                          title: "",

                          screenWidth: screenWidth * 0.4,
                          screenHeight: screenHeight * 0.25,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
