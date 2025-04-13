import 'package:clothingstore/features/data/models/Users/user_profile_model.dart';
import 'package:clothingstore/features/profile/domain/repositories/user_repository.dart';

class UserProfileUsecases {
  final UserRepository userProfile;

  UserProfileUsecases({required this.userProfile});

  Future<void> addORupdateProfile(UserProfileModel userProfileModel) async {
    await userProfile.addORupdateUserProfile(userProfileModel);
  }
}
