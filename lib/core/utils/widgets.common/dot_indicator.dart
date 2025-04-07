
import 'package:clothingstore/core/constants/colors.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({super.key, required this.position, this.dotCount = 6});
  final double position;
  final int dotCount;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: DotsIndicator(
        dotsCount: dotCount,
        position: position,
        decorator: DotsDecorator(
          size: Size(5, 5),
          activeSize: Size(5, 5),
          activeColor: GColors.darkergray,
        ),
      ),
    );
  }
}
