import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:clothingstore/features/data/models/user_model.dart';

import 'package:clothingstore/features/data/repositories/user_registeration/user_registration.dart';
import 'package:clothingstore/features/presentation/logic/address_cubit/address_event.dart';
import 'package:clothingstore/features/presentation/logic/address_cubit/address_state.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  final UserRegistration _address = UserRegistration();
  AddressBloc() : super(AddressInitial()) {
    on<SaveUserAddressEvent>(_onSaveUserAddress);
    on<FetchUserAddressEvent>(_onFecthUserAddres);

  }

  Future<void> _onSaveUserAddress(
    SaveUserAddressEvent event,
    Emitter<AddressState> emit,
  ) async {
    emit(AddressLoading());

    try {
      _address.saveUserAddress(userModel: event.userModel);
      emit(AddressSuccess());
    } catch (e) {
      emit(AddressFailure("Error saving address: ${e.toString()}"));
    }
  }

  Future<void> _onFecthUserAddres(
    FetchUserAddressEvent event,
    Emitter<AddressState> emit,
  ) async {
    emit(AddressLoading());
    try {
      log('fecthadres');
      final List<UserModel> addresses = await _address.fecthUserAddress(
        event.userId,
      );
      log('fecthadres emimtted');
      emit(AddressLoaded(addresses: addresses));
      log('fecthadres emimtted sucsses');
    } catch (e) {
      emit(AddressFailure("Error fetching addresses: ${e.toString()}"));
    }
  }
  
  
}
