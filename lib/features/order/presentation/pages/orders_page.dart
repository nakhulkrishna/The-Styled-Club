import 'package:clothingstore/core/constants/colors.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Order History",
            style: GoogleFonts.poppins(fontSize: 14),
          ),
          bottom: TabBar(
            isScrollable: false,
            enableFeedback: false,
            overlayColor: MaterialStateProperty.all(Colors.transparent),
            dividerColor: Colors.transparent,
            labelStyle: GoogleFonts.poppins(color: GColors.black),
            unselectedLabelStyle: GoogleFonts.poppins(color: GColors.black),
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: GColors.buttonPrimary,
            tabs: const [Tab(text: "Online"), Tab(text: "In Store")],
          ),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              physics: BouncingScrollPhysics().applyTo(ClampingScrollPhysics()),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * .04,
                  vertical: screenWidth * .02,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: screenHeight * .03,
                      width: screenWidth,
                      child: Text(
                        "ORDERID#",
                        style: GoogleFonts.poppins(fontWeight: FontWeight.w700),
                      ),
                    ),
                    DottedLine(
                      dashLength: 6.0,
                      dashColor: GColors.darkgery, // Color of the dashes
                      lineThickness: 2.0,
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 10, // Define the number of items
                      itemBuilder: (context, index) {
                        return Container(
                          height: screenHeight * .35,
                          width: screenWidth,

                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: GColors.darkergray),
                            ),
                          ),
                          margin: EdgeInsets.symmetric(vertical: 5),
                          child: Column(
                            children: [
                              SizedBox(
                                height: screenHeight * .08,
                                width: screenWidth,

                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      size: screenHeight * .045,
                                      Iconsax.close_circle,
                                      color: GColors.darkergray,
                                    ),
                                    SizedBox(width: screenWidth * .02),
                                    Column(
                                      children: [
                                        Text(
                                          "Order Cancelled",
                                          style: GoogleFonts.poppins(
                                            color: GColors.darkergray,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          "On 22 Mar,2025",
                                          style: GoogleFonts.poppins(
                                            color: GColors.darkergray,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: screenHeight * .2,
                                    width: screenWidth * 0.3,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.amberAccent,
                                    ),
                                  ),
                                  SizedBox(width: screenWidth * .05),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: screenWidth * .015),
                                      Text(
                                        "Products Name",
                                        style: GoogleFonts.poppins(
                                          color: GColors.darkergray,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(height: screenWidth * .02),
                                      Text(
                                        "Material of cloth",
                                        style: GoogleFonts.poppins(
                                          color: GColors.darkergray,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      SizedBox(height: screenWidth * .02),
                                      Row(
                                        children: [
                                          Text(
                                            "Size : S",
                                            style: GoogleFonts.poppins(
                                              color: GColors.darkergray,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          SizedBox(width: screenWidth * .05),
                                          Text(
                                            "Qty : 2",
                                            style: GoogleFonts.poppins(
                                              color: GColors.darkergray,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: const [
                  // Add content for the "In Store" tab
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
