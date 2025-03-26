import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FocusCubit extends Cubit<bool> {
  FocusCubit() : super(false);

  final FocusNode focusNode = FocusNode();
  final TextEditingController pincodeController = TextEditingController();

  void hideKeyboard() {
    focusNode.unfocus();
    emit(false);
  }

  void showKeyboard() {
    emit(true);
  }

  @override
  Future<void> close() {
    focusNode.dispose();
    pincodeController.dispose(); // Dispose the controller as well
    return super.close();
  }
}
