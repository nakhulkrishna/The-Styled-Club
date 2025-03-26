import 'package:clothingstore/core/constants/colors.dart';
import 'package:clothingstore/core/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterOtp extends StatefulWidget {
  const RegisterOtp({super.key});

  @override
  _RegisterOtpState createState() => _RegisterOtpState();
}

class _RegisterOtpState extends State<RegisterOtp> {
  // Controllers for OTP fields
  TextEditingController otp1Controller = TextEditingController();
  TextEditingController otp2Controller = TextEditingController();
  TextEditingController otp3Controller = TextEditingController();
  TextEditingController otp4Controller = TextEditingController();

  // Focus nodes for managing focus shift
  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusNode focusNode3 = FocusNode();
  FocusNode focusNode4 = FocusNode();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Almost there",
              style: GoogleFonts.poppins(fontWeight: FontWeight.w700),
            ),

            Text(
              textAlign: TextAlign.center,
              "Please enter 4 didgit OTP \nyou have recieved",
              style: GoogleFonts.poppins(color: GColors.darkergray),
            ),
            SizedBox(height: GSizes.spaceBTWItems),
            // OTP input fields
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _otpTextField(otp1Controller, focusNode1, focusNode2),
                SizedBox(width: 10),
                _otpTextField(otp2Controller, focusNode2, focusNode3),
                SizedBox(width: 10),
                _otpTextField(otp3Controller, focusNode3, focusNode4),
                SizedBox(width: 10),
                _otpTextField(otp4Controller, focusNode4, focusNode1),
              ],
            ),
            SizedBox(height: GSizes.spaceBTWItems),
            Text(
              "Resend OTP",
              style: GoogleFonts.poppins(color: GColors.error),
            ),
            SizedBox(height: GSizes.spaceBTWItems),
            SizedBox(
              width: screenWidth,
              height: screenWidth * 0.12,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: GColors.error,
                  foregroundColor: GColors.light,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                  ),
                ),
                onPressed: () {
                  String otp =
                      otp1Controller.text +
                      otp2Controller.text +
                      otp3Controller.text +
                      otp4Controller.text;
                  print("Entered OTP: $otp");
                },
                child: Text("Continue to Login", style: GoogleFonts.poppins()),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Custom OTP text field widget
  Widget _otpTextField(
    TextEditingController controller,
    FocusNode currentFocus,
    FocusNode nextFocus,
  ) {
    return Container(
      width: 60,
      child: TextField(
        controller: controller,
        focusNode: currentFocus,
        maxLength: 1,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w500),
        decoration: InputDecoration(
          counterText: " ",
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
        onChanged: (value) {
          if (value.isNotEmpty) {
            nextFocus.requestFocus();
          }
        },
      ),
    );
  }
}
