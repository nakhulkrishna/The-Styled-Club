import 'package:clothingstore/core/constants/colors.dart';
import 'package:clothingstore/features/cart/presentation/bloc/cubit/cart_cubit.dart';
import 'package:clothingstore/features/cart/presentation/bloc/cubit/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItesmCount extends StatelessWidget {
  const ItesmCount({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchCartItemsCubit, FetchCartState>(
      builder: (context, state) {
        if (state is FetchCartLoaded) {
          final selectedCount =
              state.cartItem.where((item) => item.isSelected).length;
          final totalCount = state.cartItem.length;
          final totalPrice = state.cartItem
              .where((item) => item.isSelected)
              .fold(0.0, (sum, item) => sum + (item.price * item.quantity));

          return Row(
            children: [
              Transform.scale(
                scale: .8,
                child: Checkbox(
                  value: selectedCount == totalCount,
                  onChanged: (value) {
                    context.read<FetchCartItemsCubit>().selectAll(value!);
                  },
                  fillColor: const WidgetStatePropertyAll(
                    GColors.buttonPrimary,
                  
                  ),
                ),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "$selectedCount / $totalCount ",
                      style: const TextStyle(fontSize: 12, color: Colors.black),
                    ),
                    const TextSpan(
                      text: "ITEMS SELECTED ",
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                    TextSpan(
                      text: "(${totalPrice})", // Example total price logic
                      style: const TextStyle(
                        fontSize: 12,
                        color: GColors.buttonPrimary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
