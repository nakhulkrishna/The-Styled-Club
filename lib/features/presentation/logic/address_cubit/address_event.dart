// address_event.dart
import 'package:clothingstore/features/data/models/user_model.dart';
import 'package:equatable/equatable.dart';

abstract class AddressEvent extends Equatable {
  const AddressEvent();

  @override
  List<Object> get props => [];
}

class SaveUserAddressEvent extends AddressEvent {
  final UserModel userModel;

  const SaveUserAddressEvent(this.userModel);

  @override
  List<Object> get props => [userModel];
}

class FetchUserAddressEvent extends AddressEvent {
  final String userId; // Assuming you want to fetch addresses based on user ID.
  const FetchUserAddressEvent(this.userId);
}
