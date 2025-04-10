import 'package:clothingstore/features/profile/data/model/user_model.dart';
import 'package:clothingstore/features/profile/domain/repositories/delivery_repository.dart';

class DeliveryUsecases {
  final DeliveryRepository repository;

  DeliveryUsecases({required this.repository});

  Future<AddressModel> addNewAddress(AddressModel address) {
    return repository.addNewAddress(address);
  }

  Future<List<AddressModel>> getAddresses() {
    return repository.getAddresses();
  }

  Future<void> updateAddress(String addressId, AddressModel updatedAddress) {
    return repository.updateAddress(addressId, updatedAddress);
  }

  Future<void> deleteAddress(String addressId) {
    return repository.deleteAddress(addressId);
  }
}
