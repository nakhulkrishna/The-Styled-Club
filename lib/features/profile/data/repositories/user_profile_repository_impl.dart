import 'package:clothingstore/features/data/models/Users/user_profile_model.dart';
import 'package:clothingstore/features/profile/data/datasource/user_profile_remote_source.dart';
import 'package:clothingstore/features/profile/domain/repositories/user_repository.dart';

class UserProfileRepositoryImpl implements UserRepository {
  final UserProfileRemoteSource userProfileRemoteSource;

  UserProfileRepositoryImpl({required this.userProfileRemoteSource});
  @override
  Future<void> addORupdateUserProfile(UserProfileModel userProfile) async {
    await userProfileRemoteSource.saveOrUpdateProfile(userProfile);
  }
}
