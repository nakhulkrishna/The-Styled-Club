import 'package:clothingstore/core/constants/colors.dart';
import 'package:clothingstore/features/presentation/logic/focusNode/focus_node.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class DeliveryDetailsSection extends StatelessWidget {
  const DeliveryDetailsSection({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.backendDataList,
  });

  final double screenWidth;
  final double screenHeight;
  final List<String> backendDataList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Delivery Details", style: GoogleFonts.poppins()),
          SizedBox(height: screenHeight * 0.02),
          BlocBuilder<FocusCubit, bool>(
            builder: (context, state) {
              final cubit = BlocProvider.of<FocusCubit>(context);
              return TextField(
                onTap: () {
                  cubit.showKeyboard();
                },
                focusNode: cubit.focusNode,
                controller: cubit.pincodeController,
                style: GoogleFonts.poppins(color: GColors.darkergray),
                decoration: InputDecoration(
                  suffixText: "CHECK",
                  suffixStyle: GoogleFonts.poppins(color: Colors.teal),
                  hintText: "Enter Pincode",
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
              );
            },
          ),

          // Product Details Section
          SizedBox(height: screenHeight * 0.05),
          Text("Product Details", style: GoogleFonts.poppins()),
          SizedBox(height: screenHeight * 0.05),
          Text("Material & Care :", style: GoogleFonts.poppins()),

          // Dynamically loaded product description (bullet points)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
                backendDataList.map((item) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      bottom: 8.0,
                    ), // Adds some space between items
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('• ', style: GoogleFonts.poppins()),
                        Expanded(
                          child: Text(item, style: GoogleFonts.poppins()),
                        ),
                      ],
                    ),
                  );
                }).toList(),
          ),
        ],
      ),
    );
  }
}
