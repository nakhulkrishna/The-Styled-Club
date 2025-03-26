import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WomenMinimalStyelDotIndicator extends Cubit<int> {
  final ScrollController menMinimalStyleScrollController;

  WomenMinimalStyelDotIndicator(this.menMinimalStyleScrollController) : super(0) {
    // Attach listener for minimal style scroll controller
    menMinimalStyleScrollController.addListener(_onMinimalStyleScroll);
  }

  void _onMinimalStyleScroll() {
    final double position = menMinimalStyleScrollController.offset;
    final int index = (position / 200).round();
    emit(index); // Emit index for minimal style
  }

  @override
  Future<void> close() {
    menMinimalStyleScrollController.removeListener(_onMinimalStyleScroll);
    menMinimalStyleScrollController.dispose();
    return super.close();
  }
}
