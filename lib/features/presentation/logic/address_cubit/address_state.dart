// address_state.dart
import 'package:clothingstore/features/data/models/user_model.dart';
import 'package:equatable/equatable.dart';

abstract class AddressState extends Equatable {
  const AddressState();

  @override
  List<Object> get props => [];
}

class AddressInitial extends AddressState {}

class AddressLoading extends AddressState {}

class AddressSuccess extends AddressState {}

class AddressFailure extends AddressState {
  final String error;

  const AddressFailure(this.error);

  @override
  List<Object> get props => [error];
}

class AddressLoaded extends AddressState {
  final List<UserModel> addresses;
  

  const AddressLoaded({required this.addresses});
}
