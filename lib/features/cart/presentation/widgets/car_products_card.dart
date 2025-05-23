import 'package:clothingstore/core/constants/colors.dart';
import 'package:clothingstore/features/cart/data/models/cart_model.dart';
import 'package:clothingstore/features/cart/presentation/bloc/cubit/cart_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class CartProductsCard extends StatelessWidget {
  const CartProductsCard({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.cartModel,
    required this.index,
  });

  final double screenHeight;
  final double screenWidth;
  final CartModel cartModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 0.3,
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: GColors.gery)),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Transform.scale(
                scale: .8,
                child: Checkbox(
                  value: cartModel.isSelected,
                  onChanged: (value) {
                    context.read<FetchCartItemsCubit>().toggleSelection(
                      index,
                    ); // Pass index
                  },
                  fillColor: const WidgetStatePropertyAll(
                    GColors.buttonPrimary,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.blueGrey,
                  ),
                  width: screenWidth * 0.3,
                  height: screenHeight * 0.2,
                  child: Image.network(cartModel.image!, fit: BoxFit.cover),
                ),
              ),
              SizedBox(width: screenWidth * 0.03),
              Padding(
                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cartModel.title,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      cartModel.brandName ?? '',
                      style: GoogleFonts.poppins(
                        fontSize: 9,
                        color: GColors.darkgery,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: screenHeight * .1),
                    // SizedBox(
                    //   height: screenHeight * 0.1,
                    //   child: Row(
                    //     children: [
                    //       GestureDetector(
                    //         onTap: () {
                    //           showModalBottomSheet(
                    //             context: context,
                    //             shape: RoundedRectangleBorder(),
                    //             builder: (context) {
                    //               return BottomSheet(
                    //                 buttonLabel: "",
                    //                 isquanity: false,
                    //                 isNotShoes: true,
                    //                 screenWidth: screenWidth,
                    //                 screenHeight: screenHeight,
                    //               );
                    //             },
                    //           );
                    //         },
                    //         child: Container(
                    //           width: screenWidth * 0.25,
                    //           height: screenHeight * 0.04,
                    //           decoration: BoxDecoration(
                    //             borderRadius: BorderRadius.circular(2),
                    //             border: Border.all(color: GColors.darkgery),
                    //           ),
                    //           child: Row(
                    //             crossAxisAlignment: CrossAxisAlignment.center,
                    //             mainAxisAlignment: MainAxisAlignment.center,
                    //             children: [
                    //               Text("Size :", style: GoogleFonts.poppins()),
                    //               SizedBox(width: screenWidth * 0.01),
                    //               Text(
                    //                 cartModel.selectedVariation?['Size'] ??
                    //                     'Not selected',
                    //                 style: GoogleFonts.poppins(),
                    //               ),
                    //               SizedBox(width: screenWidth * 0.02),
                    //               Icon(Iconsax.arrow_down_24, size: 15),
                    //             ],
                    //           ),
                    //         ),
                    //       ),
                    //       SizedBox(width: screenWidth * 0.03),
                    //       GestureDetector(
                    //         onTap: () {
                    //           showModalBottomSheet(
                    //             context: context,
                    //             shape: RoundedRectangleBorder(),
                    //             builder: (context) {
                    //               return BottomSheet(
                    //                 buttonLabel: "",
                    //                 isquanity: true,
                    //                 screenWidth: screenWidth,
                    //                 screenHeight: screenHeight,
                    //               );
                    //             },
                    //           );
                    //         },
                    //         child: Container(
                    //           width: screenWidth * 0.2,
                    //           height: screenHeight * 0.04,
                    //           decoration: BoxDecoration(
                    //             borderRadius: BorderRadius.circular(2),
                    //             border: Border.all(color: GColors.darkgery),
                    //           ),
                    //           child: Row(
                    //             crossAxisAlignment: CrossAxisAlignment.center,
                    //             mainAxisAlignment: MainAxisAlignment.center,
                    //             children: [
                    //               Text("Qty :", style: GoogleFonts.poppins()),
                    //               SizedBox(width: screenWidth * 0.01),
                    //               Text(
                    //                 cartModel.selectedVariation?['quantity'] ??
                    //                     '1',
                    //                 style: GoogleFonts.poppins(),
                    //               ),
                    //               SizedBox(width: screenWidth * 0.02),
                    //               Icon(Iconsax.arrow_down_24, size: 15),
                    //             ],
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    Text(
                      cartModel.price.toString(),
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "MRP incl. of all taxes",
                      style: GoogleFonts.poppins(
                        fontSize: 9,
                        color: GColors.darkgery,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            height: screenHeight * 0.058,
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: GColors.gery)),
            ),
            child: Center(
              child: TextButton(
                onPressed: () {
                  final userId = FirebaseAuth.instance.currentUser!.uid;
                  context.read<FetchCartItemsCubit>().deleteItem(
                    userId,
                    cartModel.productId,
                  );
                  context.read<FetchCartItemsCubit>().getFecthItems(userId);
                },
                child: Text("REMOVE", style: GoogleFonts.poppins()),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BottomSheet extends StatelessWidget {
  BottomSheet({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.buttonLabel,
    this.isquanity = false,
    this.isNotShoes = false,
  });

  final double screenWidth;
  final double screenHeight;
  final String buttonLabel;
  final bool isquanity;
  final bool isNotShoes;

  List<String> shirtSize = ['XXS', 'XS', 'S', 'M', 'L', 'XL', 'XXL', 'XXXL'];
  List<String> shoesSize = ['UK 6', 'UK 7', 'UK 8', 'UK 9', 'UK 10', 'UK 11'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: screenHeight * .02),
          Text(
            isquanity ? 'Please select quantity,' : 'Please select size,',
            style: GoogleFonts.poppins(fontSize: 14),
          ),
          SizedBox(height: screenHeight * .02),
          Wrap(
            spacing: 10.0,
            runSpacing: 10.0,
            children:
                isquanity
                    ? List.generate(12, (index) {
                      return Container(
                        height: screenHeight * 0.035,
                        width: screenWidth * 0.12,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.black),
                        ),
                        child: Center(
                          child: Text(
                            "${index + 1}",
                            style: GoogleFonts.poppins(fontSize: 11),
                          ),
                        ),
                      );
                    })
                    : List.generate(
                      isNotShoes ? shirtSize.length : shoesSize.length,
                      (index) {
                        return Container(
                          height: screenHeight * 0.035,
                          width: screenWidth * 0.12,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.black),
                          ),
                          child: Center(
                            child: Text(
                              isNotShoes ? shirtSize[index] : shoesSize[index],
                              style: GoogleFonts.poppins(fontSize: 11),
                            ),
                          ),
                        );
                      },
                    ),
          ),
          SizedBox(height: screenHeight * .02),
          SizedBox(
            width: screenWidth,
            height: screenHeight * .04,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                foregroundColor: GColors.light,
                backgroundColor: GColors.error,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                buttonLabel,
                style: GoogleFonts.poppins(color: GColors.light),
              ),
            ),
          ),
          SizedBox(height: screenHeight * .02),
        ],
      ),
    );
  }
}
