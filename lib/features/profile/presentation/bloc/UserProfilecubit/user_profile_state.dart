import 'package:clothingstore/features/data/models/Users/user_profile_model.dart';

abstract class UserProfileState {}

class UserProfileInitial extends UserProfileState {}

class UserProfileLoading extends UserProfileState {}

class UserProfileLoaded extends UserProfileState {
  final UserProfileModel userProfile;

  UserProfileLoaded(this.userProfile);
}

class UserProfileSaved extends UserProfileState {}

class UserProfileError extends UserProfileState {
  final String message;

  UserProfileError(this.message);
}
