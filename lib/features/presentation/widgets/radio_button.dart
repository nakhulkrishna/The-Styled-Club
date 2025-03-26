import 'package:clothingstore/core/constants/colors.dart';
import 'package:clothingstore/features/presentation/logic/radio_button/radio_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class RadioButton extends StatelessWidget {
  const RadioButton({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.groupValue,
  });

  final double screenHeight;
  final double screenWidth;
  final AddressType groupValue;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RadioButtonCubit, AddressType>(
      builder: (context, groupValue) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: GColors.gery),
          ),
          height: screenHeight * .07,
          width: screenWidth,
          child: Row(
            children: [
              Radio<AddressType>(
                value: AddressType.home,
                groupValue: groupValue,
                onChanged:
                    (value) => context.read<RadioButtonCubit>().updateSelection(
                      value!,
                    ),
                activeColor: GColors.buttonPrimary,
              ),
              Text(
                "Home",
                style: GoogleFonts.poppins(
                  color:
                      groupValue == AddressType.home
                          ? GColors.buttonPrimary
                          : Colors.grey,
                ),
              ),
              Radio<AddressType>(
                value: AddressType.work,
                groupValue: groupValue,
                onChanged:
                    (value) => context.read<RadioButtonCubit>().updateSelection(
                      value!,
                    ),
                activeColor: GColors.buttonPrimary,
              ),
              Text(
                "Work",
                style: GoogleFonts.poppins(
                  color:
                      groupValue == AddressType.work
                          ? GColors.buttonPrimary
                          : Colors.grey,
                ),
              ),
              Radio<AddressType>(
                value: AddressType.others,
                groupValue: groupValue,
                onChanged:
                    (value) => context.read<RadioButtonCubit>().updateSelection(
                      value!,
                    ),
                activeColor: GColors.buttonPrimary,
              ),
              Text(
                "Others",
                style: GoogleFonts.poppins(
                  color:
                      groupValue == AddressType.others
                          ? GColors.buttonPrimary
                          : Colors.grey,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
