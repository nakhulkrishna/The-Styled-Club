import 'package:clothingstore/core/constants/colors.dart';
import 'package:clothingstore/features/cart/address_page.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';

class AddresListPage extends StatelessWidget {
  const AddresListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "ADDRESS BOOK",
          style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: screenHeight * .06,
            width: screenWidth,

            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * .04),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: GColors.buttonPrimary,
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: BorderSide(
                          color: GColors.buttonPrimary,
                          width: 2,
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AddressPage()),
                      );
                    },
                    child: Text("ADD NEW ADDRESS"),
                  ),
                ),
              ],
            ),
          ),
          Divider(color: GColors.gery),
          Expanded(
            child: ListView.separated(
              physics: BouncingScrollPhysics().applyTo(ClampingScrollPhysics()),
              separatorBuilder: (context, index) {
                return Divider(color: GColors.gery);
              },
              itemCount:10,
              itemBuilder: (context, index) {
                // final address = state.addresses[index];
                return SizedBox(
                  height: screenHeight * .29,
                  width: screenWidth,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: screenHeight * .01,
                      horizontal: screenWidth * .04,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Delivery To",
                          style: GoogleFonts.poppins(fontSize: 17),
                        ),

                        SizedBox(height: screenHeight * .01),

                        Row(
                          children: [
                            Text(
                              "{address.firstName} {address.lastName}",
                              style: GoogleFonts.poppins(fontSize: 17),
                            ),
                            SizedBox(width: screenWidth * .05),
                            Container(
                              height: screenHeight * .021,
                              width: screenWidth * .15,
                              color: GColors.gery,
                              child: Center(
                                child: Text(
                                 " address.addressType",
                                  style: GoogleFonts.poppins(
                                    color: GColors.darkgery,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        Text(
                          "{address.flat}, {address.street}",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: GColors.darkgery,
                          ),
                        ),
                        Text(
                          "{address.city} {address.state}",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: GColors.darkgery,
                          ),
                        ),
                        Text(
                          "{address.street}- {address.pincode}",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: GColors.darkgery,
                          ),
                        ),
                        Text(
                          "Mobile: +91 {address.phone}",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: GColors.darkgery,
                          ),
                        ),
                        SizedBox(height: screenHeight * .02),
                        Divider(color: GColors.gery),

                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: screenHeight * .05,
                                child: Center(
                                  child: Text(
                                    "Change/Edit",
                                    style: GoogleFonts.poppins(
                                      color: GColors.buttonPrimary,
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            // Wrapping the VerticalDivider in a SizedBox to give it height
                            SizedBox(
                              height: screenHeight * .05,
                              child: VerticalDivider(
                                color: GColors.gery,
                                thickness:
                                    1, // You can adjust the thickness if needed
                              ),
                            ),

                            Expanded(
                              child: SizedBox(
                                height: screenHeight * .05,
                                child: Center(
                                  child: Text(
                                    "Remove",
                                    style: GoogleFonts.poppins(
                                      color: GColors.buttonPrimary,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
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
