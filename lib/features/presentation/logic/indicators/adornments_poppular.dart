import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdornmentsPoppular extends Cubit<int> {
  final ScrollController adronmentsScrollController;

  AdornmentsPoppular(this.adronmentsScrollController) : super(0) {
    // Attach listener for minimal style scroll controller
    adronmentsScrollController.addListener(_onMinimalStyleScroll);
  }

  void _onMinimalStyleScroll() {
    final double position = adronmentsScrollController.offset;
    final int index = (position / 200).round();
    emit(index); // Emit index for minimal style
  }

  @override
  Future<void> close() {
    adronmentsScrollController.removeListener(_onMinimalStyleScroll);
    adronmentsScrollController.dispose();
    return super.close();
  }
}
