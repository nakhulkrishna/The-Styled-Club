
import 'package:bloc/bloc.dart';
import 'package:clothingstore/features/data/repositories/user_registeration/user_registration.dart';
import 'package:clothingstore/features/presentation/logic/authentication/auth_event.dart';
import 'package:clothingstore/features/presentation/logic/authentication/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserRegistration authServices;
  AuthBloc(this.authServices) : super(AuthInitial()) {
    on<CreateAccountEvent>(_createAccount);
    on<loginUser>(_loginUser);
  }
  Future<void> _createAccount(
    CreateAccountEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    try {
      final user = await authServices.registerUser(
        event.email,
        event.password,
       
      
      );

      if (user != null) {
        emit(AuthSuccess(user));
      } else {
        emit(AuthFailure("Unknown error occured during sign-up"));
      }
    } on FirebaseAuthException catch (e) {
      emit(AuthFailure(e.message.toString()));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
  
  Future<void> _loginUser(
    loginUser event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    try {
      final user = await authServices.loginUser(
        event.email,
        event.password
      );

      if (user != null) {
        emit(AuthSuccess(user));
      } else {
        emit(AuthFailure("Unknown error occured during sign-up"));
      }
    } on FirebaseAuthException catch (e) {
      emit(AuthFailure(e.message.toString()));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  
}
