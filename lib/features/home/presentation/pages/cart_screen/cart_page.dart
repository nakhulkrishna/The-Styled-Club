import 'package:clothingstore/core/constants/colors.dart';
import 'package:clothingstore/common/widgets/product_card.dart';
import 'package:clothingstore/features/cart/presentation/widgets/car_products_card.dart';
import 'package:clothingstore/features/cart/presentation/widgets/cart_bottom_bar.dart';
import 'package:clothingstore/features/cart/presentation/widgets/final_price_data.dart';
import 'package:clothingstore/features/cart/presentation/widgets/items_count.dart';
import 'package:clothingstore/features/cart/presentation/widgets/select_address.dart';
import 'package:clothingstore/common/widgets/discountbanner.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      //* bottom bar
      bottomNavigationBar: CartBottomBar(screenHeight: screenHeight),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Cart",
          style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics().applyTo(ClampingScrollPhysics()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DiscountBanner(
              screenWidth: screenWidth,
              screenHeight: screenHeight,
            ),
            SelectAddress(screenWidth: screenWidth),
            Divider(thickness: 5, color: GColors.gery),

            ItesmCount(),

            Divider(color: GColors.gery),

            SizedBox(
              height: screenHeight * 0.9,
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return CartProductsCard(
                    screenHeight: screenHeight,
                    screenWidth: screenWidth,
                  );
                },
              ),
            ),
            SizedBox(height: screenHeight * 0.01),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
              child: Text("YOU MAY ALSO LIKE", style: GoogleFonts.poppins()),
            ),
            SizedBox(height: screenHeight * 0.01),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
              child: SizedBox(
                height: screenHeight * 0.3,

                child: ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return ProductCard(
                      brand: "",
                      image: "",
                      price: "",
                      title: '',
                      screenWidth: screenWidth * 0.3,
                      screenHeight: screenHeight * 0.15,
                    );
                  },
                ),
              ),
            ),
            Divider(thickness: 5, color: GColors.gery),
            SizedBox(height: screenHeight * 0.01),
            CouponAndGift(
              screenHeight: screenHeight,
              screenWidth: screenWidth,
              iconData: Iconsax.tag,
              hint: "Enter Coupon Code",
              suffix: 'APPLY',
              title: "Apply Coupon",
            ),
            SizedBox(height: screenHeight * 0.01),
            CouponAndGift(
              screenHeight: screenHeight,
              screenWidth: screenWidth,
              iconData: Iconsax.tag,
              hint: "Enter Gift Voucher Code",
              suffix: 'APPLY',
              title: "Gift Voucher",
            ),
            SizedBox(height: screenHeight * 0.01),
            FinalPriceData(
              screenHeight: screenHeight,
              screenWidth: screenWidth,
            ),
          ],
        ),
      ),
    );
  }
}

class CouponAndGift extends StatelessWidget {
  const CouponAndGift({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.iconData,
    required this.title,
    required this.hint,
    required this.suffix,
  });

  final double screenHeight;
  final double screenWidth;
  final IconData iconData;
  final String title;
  final String hint;
  final String suffix;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: GColors.gery)),
      ),
      height: screenHeight * .18,
      width: screenWidth,

      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenHeight * 0.02),
        child: Column(
          children: [
            Row(
              children: [
                Icon(iconData),
                SizedBox(width: screenHeight * .01),
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: GColors.darkergray,
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * .04),
            TextField(
              onTap: () {
                // cubit.showKeyboard();
              },
              // focusNode: cubit.focusNode,
              // controller: cubit.pincodeController,
              style: GoogleFonts.poppins(color: GColors.darkergray),
              decoration: InputDecoration(
                suffixText: suffix,
                suffixStyle: GoogleFonts.poppins(color: Colors.teal),
                hintText: hint,
                hintStyle: GoogleFonts.poppins(color: GColors.darkgery),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: GColors.gery),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: GColors.gery),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: GColors.gery),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
