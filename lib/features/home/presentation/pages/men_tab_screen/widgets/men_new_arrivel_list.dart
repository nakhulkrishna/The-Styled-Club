import 'package:clothingstore/common/bloc/scroll_cubit/scroll_cubit.dart';
import 'package:clothingstore/common/widgets/product_card.dart';
import 'package:clothingstore/features/products/domain/entites/product_entity.dart';
import 'package:clothingstore/features/products/presentation/bloc/product/product_cubit.dart';
import 'package:clothingstore/features/products/presentation/bloc/product/product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MenNewArrivelList extends StatelessWidget {
  const MenNewArrivelList({
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

    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return SizedBox(
            height: screenHeight * 0.4,
            child: ListView.builder(
              controller: scrollController,
              physics: ScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 10,

              itemBuilder: (context, index) {
                return ProductCard(
                  screenWidth: screenWidth * 0.5,
                  screenHeight: screenHeight * 0.3,
                  image: "",
                  title: "",
                  brand: "",
                  price: "",
                );
              },
            ),
          );
        } else if (state is ProductLoaded) {
          return SizedBox(
            height: screenHeight * 0.4,
            child: ListView.builder(
              controller: scrollController,
              physics: ScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: state.products.length,

              itemBuilder: (context, index) {
                final product = state.products[index];

                return GestureDetector(
                  onTap: () => onTap(product), // <-- pass product,
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
            ),
          );
        } else if (state is ProductError) {
          return SizedBox(
            height: screenHeight * 0.4,
            child: ListView.builder(
              controller: scrollController,
              physics: ScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 10,

              itemBuilder: (context, index) {
                return GestureDetector(
                  child: ProductCard(
                    screenWidth: screenWidth * 0.5,
                    screenHeight: screenHeight * 0.3,
                    image: "",
                    title: '',
                    brand: "",
                    price: "",
                  ),
                );
              },
            ),
          );
        }
        return SizedBox(
          height: screenHeight * 0.4,
          child: ListView.builder(
            controller: scrollController,
            physics: ScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: 10,

            itemBuilder: (context, index) {
              return GestureDetector(
                child: ProductCard(
                  screenWidth: screenWidth * 0.5,
                  screenHeight: screenHeight * 0.3,
                  image: "",
                  title: "",
                  brand: "",
                  price: "",
                ),
              );
            },
          ),
        );
      },
    );
  }
}
