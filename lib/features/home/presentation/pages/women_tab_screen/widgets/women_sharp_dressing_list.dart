import 'package:clothingstore/features/products/presentation/bloc/categories/categorie_cubit.dart';
import 'package:clothingstore/features/products/presentation/bloc/categories/categorie_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WomenSharpDressingList extends StatelessWidget {
  const WomenSharpDressingList({
    super.key,
    required this.screenHeight,
    required this.totalCount,
    this.scrollController,
    required this.screenWidth,
  });

  final double screenHeight;
  final int totalCount;
  final ScrollController? scrollController;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      WomenSharpDressingStyleCubit,
      WomenSharpDressingCategoriesState
    >(
      builder: (context, state) {
        if (state is WomenSharpDressingCategoriesLoading) {
          return SizedBox(
            height: screenHeight * 0.31,
            child: ListView.builder(
              physics: ScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: totalCount,
              controller: scrollController,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(2),
                  child: SizedBox(
                    width: screenWidth * 0.7,

                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => WomenSharpDressingList(
                                      screenHeight: screenHeight,
                                      screenWidth: screenWidth,
                                      totalCount: 1,
                                    ),
                              ),
                            );
                          },
                          child: Container(
                            width: screenWidth,
                            decoration: BoxDecoration(
                              color: Colors.blueGrey,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            height: screenHeight * 0.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is WomenSharpDressingCategoriesLoaded) {
          return SizedBox(
            height: screenHeight * 0.31,
            child: ListView.builder(
              physics: ScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: state.WomensharpDressingStyleCategoriess.length,
              controller: scrollController,
              itemBuilder: (context, index) {
                final categories =
                    state.WomensharpDressingStyleCategoriess[index];
                return Padding(
                  padding: const EdgeInsets.all(2),
                  child: SizedBox(
                    width: screenWidth * 0.7,

                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => WomenSharpDressingList(
                                      screenHeight: screenHeight,
                                      screenWidth: screenWidth,
                                      totalCount: 1,
                                    ),
                              ),
                            );
                          },
                          child: Container(
                            width: screenWidth,
                            decoration: BoxDecoration(
                              color: Colors.blueGrey,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            height: screenHeight * 0.3,
                            child: Image.network(
                              categories.image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is WomenSharpDressingCategoriesError) {
          return SizedBox(
            height: screenHeight * 0.31,
            child: ListView.builder(
              physics: ScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: totalCount,
              controller: scrollController,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(2),
                  child: SizedBox(
                    width: screenWidth * 0.7,

                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => WomenSharpDressingList(
                                      screenHeight: screenHeight,
                                      screenWidth: screenWidth,
                                      totalCount: 1,
                                    ),
                              ),
                            );
                          },
                          child: Container(
                            width: screenWidth,
                            decoration: BoxDecoration(
                              color: Colors.blueGrey,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            height: screenHeight * 0.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        } else {
          return SizedBox(
            height: screenHeight * 0.31,
            child: ListView.builder(
              physics: ScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: totalCount,
              controller: scrollController,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(2),
                  child: SizedBox(
                    width: screenWidth * 0.7,

                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => WomenSharpDressingList(
                                      screenHeight: screenHeight,
                                      screenWidth: screenWidth,
                                      totalCount: 1,
                                    ),
                              ),
                            );
                          },
                          child: Container(
                            width: screenWidth,
                            decoration: BoxDecoration(
                              color: Colors.blueGrey,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            height: screenHeight * 0.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
