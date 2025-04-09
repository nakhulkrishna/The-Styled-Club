import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

class ProfileSection extends StatelessWidget {
  final String userName;
  final String phone;
  final double screenWidth;
  final double screenHeight;

  const ProfileSection({
    required this.userName,
    required this.phone,
    required this.screenWidth,
    required this.screenHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: screenHeight * 0.02),
        CircleAvatar(
          radius: screenWidth * 0.15,
          backgroundImage:
              userName.isNotEmpty
                  ? AssetImage(
                    'assets/images/userAvatar.jpg',
                  ) // Replace with your user image
                  : AssetImage('assets/images/userAvatar.jpg'),
          child:
              userName.isEmpty
                  ? Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      width: screenWidth * 0.3,
                      height: screenWidth * 0.3,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                    ),
                  )
                  : null,
        ),
        SizedBox(height: screenHeight * 0.02),
        userName.isNotEmpty
            ? Text(userName, style: GoogleFonts.poppins(fontSize: 18))
            : Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                width: screenWidth * 0.5,
                height: screenHeight * 0.03,
                color: Colors.white,
              ),
            ),
        SizedBox(height: screenHeight * 0.01),
        phone.isNotEmpty
            ? Text(phone, style: GoogleFonts.poppins(fontSize: 14))
            : Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                width: screenWidth * 0.4,
                height: screenHeight * 0.03,
                color: Colors.white,
              ),
            ),
      ],
    );
  }
}
