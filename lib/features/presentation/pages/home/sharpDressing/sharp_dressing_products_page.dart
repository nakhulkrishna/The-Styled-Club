import 'package:clothingstore/features/presentation/widgets/listviewProductCard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class SharpDressingProductsPage extends StatelessWidget {
  const SharpDressingProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
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
          "Name of Categories",
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
              GridView.builder(
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
                    screenWidth: screenWidth,
                    screenHeight: screenHeight * 0.3,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
