import 'dart:ui';

import 'package:clothingstore/core/constants/colors.dart';
import 'package:flutter/material.dart';

class ItesmCount extends StatelessWidget {
  const ItesmCount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Transform.scale(
          scale: .8,
          child: Checkbox(
            materialTapTargetSize: MaterialTapTargetSize.padded,
            value: true,
            onChanged: (value) {},
            fillColor: WidgetStatePropertyAll(GColors.buttonPrimary),
          ),
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "2/2 ",
                style: TextStyle(fontSize: 12, color: Colors.black),
              ),
              TextSpan(
                text: "ITEMS SELECTED ",
                style: TextStyle(fontSize: 12, color: Colors.black),
              ),
              TextSpan(
                text: "(2889)",
                style: TextStyle(fontSize: 12, color: GColors.buttonPrimary),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
