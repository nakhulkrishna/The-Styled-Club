import 'package:clothingstore/features/authentication/data/datasources/firebase_auth_datasource.dart';
import 'package:clothingstore/features/authentication/data/model/user_model.dart';
import 'package:clothingstore/features/authentication/domain/repositories/auth_repositories.dart';


import '../../domain/entities/user_entity.dart';


class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuthDataSource dataSource;

  AuthRepositoryImpl(this.dataSource);

  @override
  Future<UserEntity?> signIn(String email, String password) async {
    final user = await dataSource.signIn(email, password);
    if (user != null) return UserModel.fromFirebaseUser(user);
    return null;
  }

  @override
  Future<UserEntity?> signUp(String email, String password) async {
    final user = await dataSource.signUp(email, password);
    if (user != null) return UserModel.fromFirebaseUser(user);
    return null;
  }

  @override
  Future<void> signOut() => dataSource.signOut();
}
