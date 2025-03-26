import 'package:bloc/bloc.dart';

// Cubit for managing the selected color index
class ColorSelectionCubit extends Cubit<int> {
  ColorSelectionCubit() : super(0); // Default selection index 0

  void selectColor(int index) => emit(index);
}

// Cubit for managing the selected size index
class SizeSelectionCubit extends Cubit<int> {
  SizeSelectionCubit() : super(0); // Default selection index 0

  void selectSize(int index) => emit(index);
}

// Cubit for managing the selected size index
class QuantitySelectionCubit extends Cubit<int> {
  QuantitySelectionCubit() : super(0); // Default selection index 0

  void selectSize(int index) => emit(index);
}
