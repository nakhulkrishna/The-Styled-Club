import 'package:clothingstore/core/constants/colors.dart';
import 'package:clothingstore/features/cart/presentation/bloc/cubit/cart_cubit.dart';
import 'package:clothingstore/features/cart/presentation/bloc/cubit/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        BlocBuilder<FetchCartItemsCubit, FetchCartState>(
          builder: (context, state) {
            if (state is FetchCartLoading) {
              return RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "",
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                    TextSpan(
                      text: "",
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                    TextSpan(
                      text: "",
                      style: TextStyle(
                        fontSize: 12,
                        color: GColors.buttonPrimary,
                      ),
                    ),
                  ],
                ),
              );
            } else if (state is FetchCartLoaded) {
              
              return RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "3 / ${state.cartItem.length} ",
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                    TextSpan(
                      text: "ITEMS SELECTED ",
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                    TextSpan(
                      text: "(2889)",
                      style: TextStyle(
                        fontSize: 12,
                        color: GColors.buttonPrimary,
                      ),
                    ),
                  ],
                ),
              );
            } else if (state is FetchCartError) {
              return RichText(
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
                      style: TextStyle(
                        fontSize: 12,
                        color: GColors.buttonPrimary,
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return RichText(
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
                      style: TextStyle(
                        fontSize: 12,
                        color: GColors.buttonPrimary,
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
