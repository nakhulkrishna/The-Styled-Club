import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class WomenNewArrivelsDotIndicator extends Cubit<int> {
  final ScrollController menNewArrivelsScrollController;

  WomenNewArrivelsDotIndicator(this.menNewArrivelsScrollController) : super(0) {
    // Attach listener for new arrivals scroll controller
    menNewArrivelsScrollController.addListener(_onNewArrivalsScroll);
  }

  void _onNewArrivalsScroll() {
    final double position = menNewArrivelsScrollController.offset;
    final int index = (position / 200).round();
    emit(index); // Emit index for new arrivals
  }

  @override
  Future<void> close() {
    menNewArrivelsScrollController.removeListener(_onNewArrivalsScroll);
    menNewArrivelsScrollController.dispose();
    return super.close();
  }
}
