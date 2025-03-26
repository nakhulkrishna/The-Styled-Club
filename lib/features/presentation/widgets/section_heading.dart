import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SectionHeading extends StatelessWidget {
  const SectionHeading({
    super.key,
    required this.screenHeight,
    required this.sectionName,
  });

  final double screenHeight;
  final String sectionName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        sectionName,
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w600,
          fontSize: screenHeight * 0.02,
        ),
      ),
    );
  }
}
