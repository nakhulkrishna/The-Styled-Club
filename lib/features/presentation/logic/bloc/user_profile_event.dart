// address_event.dart
import 'package:clothingstore/features/data/models/user_model.dart';
import 'package:clothingstore/features/data/models/user_profile_model.dart';
import 'package:equatable/equatable.dart';

abstract class UserProfileEvent extends Equatable {
  const UserProfileEvent();

  @override
  List<Object> get props => [];
}

class SaveUserProfileEvent extends UserProfileEvent {
  final UserProfileModel userProfileModel;

  const SaveUserProfileEvent(this.userProfileModel);

  @override
  List<Object> get props => [userProfileModel];
}

class FetchUserProfileEvent extends UserProfileEvent {
  final String userId;
  const FetchUserProfileEvent(this.userId);
}
