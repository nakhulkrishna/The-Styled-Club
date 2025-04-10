import 'package:clothingstore/features/profile/data/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DeliveryAddressRemoteSource {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser;

  /// CREATE address
Future<AddressModel> createNewAddress(AddressModel address) async {
    try {
      final addressRef =
          _db
              .collection("DeliverAddress")
              .doc(user!.uid)
              .collection("addresses")
              .doc(); // Auto-generated ID

      final addressWithId = address.copyWith(
        id: addressRef.id,
      ); // Add doc ID to model (if you support it)

      await addressRef.set(addressWithId.toMap());

      return addressWithId;
    } catch (e) {
      throw Exception("Failed to add address: $e");
    }
  }


  /// READ (fetch all) addresses
  Future<List<AddressModel>> fetchAllAddresses() async {
    try {
      final snapshot =
          await _db
              .collection("DeliverAddress")
              .doc(user!.uid)
              .collection("addresses")
              .get();

      return snapshot.docs
          .map((doc) => AddressModel.fromMap(doc.data()))
          .toList();
    } catch (e) {
      throw Exception("Failed to fetch addresses: $e");
    }
  }

  /// UPDATE an address (by document ID)
  Future<void> updateAddress(
    String addressId,
    AddressModel updatedAddress,
  ) async {
    try {
      await _db
          .collection("DeliverAddress")
          .doc(user!.uid)
          .collection("addresses")
          .doc(addressId)
          .update(updatedAddress.toMap());
    } catch (e) {
      throw Exception("Failed to update address: $e");
    }
  }

  /// DELETE an address (by document ID)
  Future<void> deleteAddress(String addressId) async {
    try {
      await _db
          .collection("DeliverAddress")
          .doc(user!.uid)
          .collection("addresses")
          .doc(addressId)
          .delete();
    } catch (e) {
      throw Exception("Failed to delete address: $e");
    }
  }
}
