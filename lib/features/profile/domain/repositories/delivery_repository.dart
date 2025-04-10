import 'package:clothingstore/features/profile/data/model/user_model.dart';

abstract class DeliveryRepository {
  Future<AddressModel> addNewAddress(AddressModel address);
  Future<List<AddressModel>> getAddresses();
  Future<void> updateAddress(String addressId, AddressModel updatedAddress);
  Future<void> deleteAddress(String addressId);
}
