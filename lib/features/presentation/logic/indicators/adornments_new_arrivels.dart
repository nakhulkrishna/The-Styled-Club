import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class AdornmentsNewArrivels extends Cubit<int> {
  final ScrollController adornmentsScrollController;

  AdornmentsNewArrivels(this.adornmentsScrollController) : super(0) {
    // Attach listener for new arrivals scroll controller
    adornmentsScrollController.addListener(_onNewArrivalsScroll);
  }

  void _onNewArrivalsScroll() {
    final double position = adornmentsScrollController.offset;
    final int index = (position / 200).round();
    emit(index); // Emit index for new arrivals
  }

  @override
  Future<void> close() {
    adornmentsScrollController.removeListener(_onNewArrivalsScroll);
    adornmentsScrollController.dispose();
    return super.close();
  }
}
