import 'package:clothingstore/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomField extends StatelessWidget {
  const CustomField({
    super.key,
    required this.label,
    required this.controller,
    required this.keyBoardType,
    this.validator,
  });

  final String label;
  final TextEditingController controller;
  final TextInputType keyBoardType;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyBoardType,
      validator: validator,
      controller: controller,

      style: GoogleFonts.poppins(color: GColors.darkergray),
      decoration: InputDecoration(
        hintText: label,
        hintStyle: GoogleFonts.poppins(color: GColors.darkgery, fontSize: 13),
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
  }
}
