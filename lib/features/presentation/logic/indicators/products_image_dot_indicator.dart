import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class ProductsImageDotIndicatorCubit extends Cubit<int> {
  final PageController productsImagePageController;

  ProductsImageDotIndicatorCubit(this.productsImagePageController) : super(0) {
    // Attach listener for new arrivals scroll controller
    productsImagePageController.addListener(_onNewArrivalsScroll);
  }

  void _onNewArrivalsScroll() {
    final double position = productsImagePageController.offset;
    final int index = (position / 400).round();
    emit(index); // Emit index for new arrivals
  }

  @override
  Future<void> close() {
    productsImagePageController.removeListener(_onNewArrivalsScroll);
    productsImagePageController.dispose();
    return super.close();
  }
}
