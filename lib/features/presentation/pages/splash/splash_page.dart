import 'package:clothingstore/features/presentation/widgets/wrapper.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    // Navigate to the next screen after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Wrapper(),
        ), // Replace with your target page
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFC1121F),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                height: screenHeight * 0.2,
                width: screenWidth * 0.4,
                child: Stack(
                  children: [
                    // Logo
                    Image.asset("assets/images/logo.png", fit: BoxFit.contain),
                    // Left Eye
                    Positioned(
                      top: screenHeight * 0.035,
                      left: screenWidth * 0.02,
                      child: Container(
                        height: 10,
                        width: screenHeight * 0.03,
                        decoration: const BoxDecoration(
                          color: Colors.red, // Eye color
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    // Right Eye
                    Positioned(
                      top: screenHeight * 0.035,
                      left: screenWidth * 0.065,
                      child: Container(
                        height: 9,
                        width: screenHeight * 0.03,
                        decoration: const BoxDecoration(
                          color: Colors.red, // Eye color
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
