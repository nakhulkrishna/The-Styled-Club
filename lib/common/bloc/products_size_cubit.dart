import 'package:flutter_bloc/flutter_bloc.dart';

class SizeSelectionCubit extends Cubit<String?> {
  SizeSelectionCubit() : super(null);

  void selectSize(String size) {
    emit(size);
  }
}





class QuantitySelectionCubit extends Cubit<int?> {
  QuantitySelectionCubit() : super(null);

  void selectQuantity(int quantity) {
    emit(quantity);
  }
}
