import 'package:clothingstore/features/data/models/Users/user_profile_model.dart';

abstract class UserRepository {
  Future<void> addORupdateUserProfile(UserProfileModel userProfile);
}
