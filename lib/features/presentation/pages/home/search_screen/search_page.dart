import 'package:clothingstore/core/constants/colors.dart';
import 'package:flutter/material.dart';
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
          decoration: InputDecoration(
            hintText: " Search for products,",
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
            child: ListView.builder(
              itemCount: 6,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: GColors.gery)),
                  ),
                  height: screenHeight * .05,
                  width: screenWidth,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * .03,
                    ),
                    child: Row(
                      children: [
                        Icon(Iconsax.timer_start, size: 17),
                        SizedBox(width: screenWidth * .02),
                        Text(
                          'Search items name',
                          style: GoogleFonts.poppins(color: GColors.darkgery),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
