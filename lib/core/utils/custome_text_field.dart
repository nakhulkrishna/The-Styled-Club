import 'package:clothingstore/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class CustomeTextField extends StatelessWidget {
  const CustomeTextField({super.key, required this.icon, required this.label, required this.controller});

  final IconData icon;
  final String label;
  final TextEditingController controller;
 

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: GoogleFonts.poppins(color: GColors.darkergray),
      decoration: InputDecoration(
        hintText: label,

        hintStyle: GoogleFonts.poppins(color: GColors.darkgery),
        prefixIcon: Icon(icon),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(width: 2, color: GColors.gery),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(width: 2, color: GColors.gery),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(width: 2, color: GColors.gery),
        ),
      ),
    );
  }
}
