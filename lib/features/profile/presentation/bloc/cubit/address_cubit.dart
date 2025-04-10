import 'package:clothingstore/features/profile/presentation/bloc/cubit/address_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:clothingstore/features/profile/data/model/user_model.dart';
import 'package:clothingstore/features/profile/domain/usecases/delivery_usecases.dart';

class DeliveryCubit extends Cubit<DeliveryState> {
  final DeliveryUsecases deliveryUsecases;

  DeliveryCubit(this.deliveryUsecases) : super(DeliveryInitial()) {
    fetchAddresses();
  }

  // Create
  Future<void> addNewAddress(AddressModel address) async {
    emit(DeliveryLoading());
    try {
      final newAddress = await deliveryUsecases.addNewAddress(address);
      emit(
        DeliverySuccess(
          message: "Address added successfully",
          address: newAddress,
        ),
      );
    } catch (e) {
      emit(DeliveryError(error: e.toString()));
    }
  }

  // Fetch
  Future<void> fetchAddresses() async {
    emit(DeliveryLoading());
    try {
      final addresses = await deliveryUsecases.getAddresses();
      emit(DeliveryLoaded(addresses: addresses));
    } catch (e) {
      emit(DeliveryError(error: e.toString()));
    }
  }

  // Update
  Future<void> updateAddress(
    String addressId,
    AddressModel updatedAddress,
  ) async {
    emit(DeliveryLoading());
    try {
      await deliveryUsecases.updateAddress(addressId, updatedAddress);
      emit(DeliverySuccess(message: "Address updated successfully"));
      fetchAddresses(); // Refresh
    } catch (e) {
      emit(DeliveryError(error: e.toString()));
    }
  }

  // Delete
  Future<void> deleteAddress(String addressId) async {
    emit(DeliveryLoading());
    try {
      await deliveryUsecases.deleteAddress(addressId);
      emit(DeliverySuccess(message: "Address deleted successfully"));
      fetchAddresses(); // Refresh
    } catch (e) {
      emit(DeliveryError(error: e.toString()));
    }
  }

void selectAddress(String addressId) {
    if (state is DeliveryLoaded) {
      final current = state as DeliveryLoaded;
      emit(current.copyWith(selectedAddressId: addressId));
    }
  }

}
