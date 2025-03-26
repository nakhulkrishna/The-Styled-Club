import 'package:flutter_bloc/flutter_bloc.dart';
enum AddressType { home, work, others }

class RadioButtonCubit extends Cubit<AddressType> {
  RadioButtonCubit() : super(AddressType.home); // Default to 'Home'

  void updateSelection(AddressType selected) {
    emit(selected);
  }
}


class DeliveryTo extends Cubit<AddressType> {
  DeliveryTo() : super(AddressType.home); // Default to 'Home'

  void updateSelection(AddressType selected) {
    emit(selected);
  }
}

