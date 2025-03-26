import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CreateAccountEvent extends AuthEvent {
  final String email;
  final String password;
  final String firstnme;
  final String lastName;

  final String dateofbirth;

  CreateAccountEvent(
    this.email,
    this.password,
    this.firstnme,
    this.lastName,
    this.dateofbirth,
  );
  @override
  List<Object?> get props => [email, password];
}

class loginUser extends AuthEvent {
  final String email;
  final String password;

  loginUser(this.email, this.password);
  @override
  List<Object?> get props => [email, password];
}
