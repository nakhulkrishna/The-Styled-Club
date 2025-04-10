import 'package:clothingstore/features/profile/data/model/user_model.dart';

abstract class DeliveryState {}

class DeliveryInitial extends DeliveryState {}

class DeliveryLoading extends DeliveryState {}

// class DeliveryLoaded extends DeliveryState {
//   final List<AddressModel> addresses;

//   DeliveryLoaded({required this.addresses});
// }



class DeliverySuccess extends DeliveryState {
  final String message;
  final AddressModel? address;

  DeliverySuccess({required this.message, this.address});
}

class DeliveryError extends DeliveryState {
  final String error;

  DeliveryError({required this.error});
}

class DeliveryLoaded extends DeliveryState {
  final List<AddressModel> addresses;
  final String? selectedAddressId;

  DeliveryLoaded({required this.addresses, this.selectedAddressId});

  DeliveryLoaded copyWith({
    List<AddressModel>? addresses,
    String? selectedAddressId,
  }) {
    return DeliveryLoaded(
      addresses: addresses ?? this.addresses,
      selectedAddressId: selectedAddressId ?? this.selectedAddressId,
    );
  }
}
