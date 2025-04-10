import 'package:clothingstore/features/profile/data/datasource/delivery_address_remote_source.dart';
import 'package:clothingstore/features/profile/data/model/user_model.dart';
import 'package:clothingstore/features/profile/domain/repositories/delivery_repository.dart';

class DeliveryAddresssRepositoryImpl implements DeliveryRepository {
  final DeliveryAddressRemoteSource deliveryAddressRemoteSource;

  DeliveryAddresssRepositoryImpl({required this.deliveryAddressRemoteSource});

  @override
  Future<AddressModel> addNewAddress(AddressModel address) {
    return deliveryAddressRemoteSource.createNewAddress(address);
  }

  @override
  Future<List<AddressModel>> getAddresses() {
    return deliveryAddressRemoteSource.fetchAllAddresses();
  }

  @override
  Future<void> updateAddress(String addressId, AddressModel updatedAddress) {
    return deliveryAddressRemoteSource.updateAddress(addressId, updatedAddress);
  }

  @override
  Future<void> deleteAddress(String addressId) {
    return deliveryAddressRemoteSource.deleteAddress(addressId);
  }
}
