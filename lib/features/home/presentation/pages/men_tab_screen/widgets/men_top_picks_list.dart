import 'package:clothingstore/common/bloc/scroll_cubit/scroll_cubit.dart';
import 'package:clothingstore/common/widgets/product_card.dart';
import 'package:clothingstore/core/constants/colors.dart';
import 'package:clothingstore/features/products/data/models/products_model/product_model.dart';
import 'package:clothingstore/features/products/domain/entites/product_entity.dart';
import 'package:clothingstore/features/products/presentation/bloc/product/product_cubit.dart';
import 'package:clothingstore/features/products/presentation/bloc/product/product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MenTopPicksList extends StatelessWidget {
  const MenTopPicksList({
    super.key,
    required this.screenHeight,
    required this.totalCount,

    required this.screenWidth,
    required this.onTap,
  });

  final double screenHeight;
  final int totalCount;

  final double screenWidth;
  final void Function(ProductEntity) onTap; // <-- change here

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();

    scrollController.addListener(() {
      double offset = scrollController.offset;
      double itemWidth = screenWidth * 0.5; // Must match ProductCard width
      int currentIndex = (offset / itemWidth).round();

      context.read<ScrollIndexCubit>().updateIndex(currentIndex);
    });
    return SizedBox(
      height: screenHeight * 0.4,
      child: BlocBuilder<TopPickedCubit, TopPickedProductsState>(
        builder: (context, state) {
          if (state is TopPickedProductsLoading) {
            return ListView.builder(
              controller: scrollController,
              physics: ScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 10,

              itemBuilder: (context, index) {
                return Container(
                  width: screenWidth * 0.5,
                  height: screenHeight * 0.3,
                  color: GColors.light,
                );
              },
            );
          } else if (state is TopPickedProductsLoaded) {
            return ListView.builder(
              physics: ScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: state.products.length,

              itemBuilder: (context, index) {
                final product = state.products[index];

                return GestureDetector(
                  onTap: () => onTap(product),
                  child: ProductCard(
                    screenWidth: screenWidth * 0.5,
                    screenHeight: screenHeight * 0.3,
                    image: product.thumbnail,
                    title: product.title,
                    brand: product.brand!.name,
                    price: product.salePrice.toString(),
                  ),
                );
              },
            );
          } else if (state is TopPickedProductsError) {
            return ListView.builder(
              physics: ScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 10,

              itemBuilder: (context, index) {
                return Container(
                  width: screenWidth * 0.5,
                  height: screenHeight * 0.3,
                  color: GColors.light,
                );
              },
            );
          } else {
            return ListView.builder(
              physics: ScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 10,

              itemBuilder: (context, index) {
                return Container(
                  width: screenWidth * 0.5,
                  height: screenHeight * 0.3,
                  color: GColors.light,
                );
              },
            );
          }
        },
      ),
    );
  }
}
