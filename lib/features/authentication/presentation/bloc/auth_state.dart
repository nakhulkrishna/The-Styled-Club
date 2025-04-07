import 'package:clothingstore/features/authentication/domain/entities/user_entity.dart';
import 'package:equatable/equatable.dart';


abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final UserEntity user;

  AuthSuccess(this.user);

  @override
  List<Object?> get props => [user];
}

class AuthFailure extends AuthState {
  final String message;

  AuthFailure(this.message);

  @override
  List<Object?> get props => [message];
}

class AuthLoggedIn extends AuthState {}

class AuthLoggedOut extends AuthState {}
