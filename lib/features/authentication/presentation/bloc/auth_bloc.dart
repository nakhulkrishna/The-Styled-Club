import 'package:clothingstore/features/authentication/domain/usecases/sign_in_usecases.dart';
import 'package:clothingstore/features/authentication/domain/usecases/sign_up_usecases.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart' show TextEditingController;
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  // FIREBASE INSTANCE
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // CONTROLLERS
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController birthdateController = TextEditingController();

  // USESACSES
  final SignUpUseCase signUpUseCase;
  final SignInUseCase signInUseCase;

  AuthBloc({required this.signUpUseCase, required this.signInUseCase})
    : super(AuthInitial()) {
    on<SignUpEvent>(_onSignUp);
    on<SignInEvent>(_onSignIn);
    on<AuthStatusCheckEvent>(_authStatusChecking);
  }

  Future<void> _authStatusChecking(AuthStatusCheckEvent event, emit) async {
    final user = _auth.currentUser;

    if (user != null) {
      emit(AuthLoggedIn());
    } else {
      emit(AuthLoggedOut());
    }
  }

  Future<void> _onSignUp(SignUpEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final user = await signUpUseCase(event.email, event.password);
      if (user != null) {
        emit(AuthSuccess(user));
      } else {
        emit(AuthFailure("Sign up failed"));
      }
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> _onSignIn(SignInEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final user = await signInUseCase(event.email, event.password);
      if (user != null) {
        emit(AuthSuccess(user));
      } else {
        emit(AuthFailure("Sign in failed"));
      }
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  @override
  Future<void> close() {
    if (kDebugMode) {
      print("AuthBloc disposed");
    }
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    birthdateController.dispose();
    return super.close();
  }
}
