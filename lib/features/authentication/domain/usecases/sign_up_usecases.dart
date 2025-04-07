import 'package:clothingstore/features/authentication/domain/repositories/auth_repositories.dart';

import '../entities/user_entity.dart';


class SignUpUseCase {
  final AuthRepository repository;

  SignUpUseCase(this.repository);

  Future<UserEntity?> call(String email, String password) {
    return repository.signUp(email, password);
  }
}
