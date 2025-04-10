import 'package:clothingstore/common/widgets/product_card.dart';
import 'package:clothingstore/features/products/data/models/products_model/product_model.dart';
import 'package:clothingstore/features/products/domain/entites/product_entity.dart';
import 'package:clothingstore/features/products/presentation/bloc/product/product_cubit.dart';
import 'package:clothingstore/features/products/presentation/bloc/product/product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WomenBottomList extends StatelessWidget {
  const WomenBottomList({
    super.key,
    required this.screenHeight,

    required this.screenWidth,
    required this.onTap,
  });

  final double screenHeight;

  final void Function(ProductEntity) onTap;

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WomenTopPickedCubit, WomenTopPickedProductsState>(
      builder: (context, state) {
        if (state is WomenTopPickedProductsLoading) {
          return SizedBox(
            height: screenHeight * 0.4,
            child: ListView.builder(
              physics: ScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return ProductCard(
                  screenWidth: screenWidth * 0.5,
                  screenHeight: screenHeight * 0.3,
                  image: "",
                  title: "",
                  brand: "",
                  price: "",
                );
              },
            ),
          );
        } else if (state is WomenTopPickedProductsLoaded) {
          return SizedBox(
            height: screenHeight * 0.4,
            child: ListView.builder(
              physics: ScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: state.products.length,

              itemBuilder: (context, index) {
                final product = state.products[index];

                return GestureDetector(
                  onTap: () => onTap(product),
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
        } else if (state is WomenTopPickedProductsError) {
          return SizedBox(
            height: screenHeight * 0.4,
            child: ListView.builder(
              physics: ScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return ProductCard(
                  screenWidth: screenWidth * 0.5,
                  screenHeight: screenHeight * 0.3,
                  image: "",
                  title: "",
                  brand: "",
                  price: "",
                );
              },
            ),
          );
        } else {
          return SizedBox(
            height: screenHeight * 0.4,
            child: ListView.builder(
              physics: ScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return ProductCard(
                  screenWidth: screenWidth * 0.5,
                  screenHeight: screenHeight * 0.3,
                  image: "",
                  title: "",
                  brand: "",
                  price: "",
                );
              },
            ),
          );
        }
      },
    );
  }
}

// class ProductCard extends StatelessWidget {
//   const ProductCard({
//     super.key,
//     required this.screenWidth,
//     required this.screenHeight,
//     this.isWishlist = false,
//     required this.image,
//     required this.title,
//     required this.category,
//     required this.price,
//   });

//   final double screenWidth;
//   final double screenHeight;
//   final bool isWishlist;
//   final String image;
//   final String title;
//   final String category;
//   final String price;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(2),
//       child: SizedBox(
//         width: screenWidth,

//         child: Column(
//           children: [
//             Container(
//               width: screenWidth,
//               decoration: BoxDecoration(
//                 color: Colors.blueGrey,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(5),
//                   topRight: Radius.circular(5),
//                 ),
//               ),
//               height: screenHeight,
//               child:
//                   image.isNotEmpty
//                       ? Image.network(image, fit: BoxFit.cover)
//                       : SizedBox.shrink(),
//             ),

//             isWishlist
//                 ? Expanded(
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(
//                       horizontal: screenWidth * 0.015,
//                     ),
//                     child: SizedBox(
//                       width: screenWidth,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             title,
//                             style: GoogleFonts.poppins(
//                               fontSize: 10,
//                               fontWeight: FontWeight.w500,
//                               color: GColors.darkergray,
//                             ),
//                           ),
//                           Text(
//                             category,
//                             style: GoogleFonts.poppins(
//                               fontSize: 10,
//                               color: GColors.darkgery,
//                             ),
//                           ),
//                           Text(
//                             price,
//                             style: GoogleFonts.poppins(
//                               fontWeight: FontWeight.w500,
//                               color: GColors.darkergray,
//                             ),
//                           ),
//                           Text(
//                             "MRP incl. of all taxes",
//                             style: GoogleFonts.poppins(
//                               fontSize: 10,
//                               color: GColors.darkgery,
//                             ),
//                           ),
//                           SizedBox(height: screenHeight * 0.01),
//                           GestureDetector(
//                             onTap: () {
//                               log("Move to cart");
//                             },
//                             child: Container(
//                               height: screenHeight * 0.15,
//                               decoration: BoxDecoration(
//                                 border: Border.all(color: GColors.accent),
//                               ),

//                               child: Center(
//                                 child: Text(
//                                   "MOVE TO CART",
//                                   style: GoogleFonts.poppins(fontSize: 12),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 )
//                 : Expanded(
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(
//                       horizontal: screenWidth * 0.015,
//                     ),
//                     child: SizedBox(
//                       width: screenWidth,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             maxLines: 1,
//                             title,
//                             style: GoogleFonts.poppins(
//                               fontSize: 11,
//                               fontWeight: FontWeight.w500,
//                               color: GColors.darkergray,
//                             ),
//                           ),
//                           Text(
//                             category,
//                             style: GoogleFonts.poppins(
//                               fontSize: 10,
//                               color: GColors.darkgery,
//                             ),
//                           ),
//                           Text(
//                             price,
//                             style: GoogleFonts.poppins(
//                               fontWeight: FontWeight.w500,
//                               color: GColors.darkergray,
//                             ),
//                           ),
//                           Text(
//                             "MRP incl. of all taxes",
//                             style: GoogleFonts.poppins(
//                               fontSize: 10,
//                               color: GColors.darkgery,
//                             ),
//                           ),

//                           // SizedBox(height: screenHeight * 0.01),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//           ],
//         ),
//       ),
//     );
//   }
// }
