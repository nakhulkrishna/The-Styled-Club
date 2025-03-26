import 'package:clothingstore/features/data/models/user_profile_model.dart';
import 'package:equatable/equatable.dart';

/// Provides a common structure for states, ensuring consistency across the bloc.
abstract class UserProfileState extends Equatable {
  const UserProfileState();

  @override
  List<Object> get props => [];
}

/// Initial state, representing the idle state before any action is taken.
class UserProfileInitial extends UserProfileState {
  const UserProfileInitial();
}

/// Loading state, triggered when user profile data is being fetched or updated.
class UserProfileLoading extends UserProfileState {
  const UserProfileLoading();
}

/// Success state, triggered when a user profile has been successfully fetched or updated.
class UserProfileSuccess extends UserProfileState {
  final String message;

  /// Optional success message can be passed to indicate the type of success (e.g., profile updated, profile created).
  const UserProfileSuccess({this.message = "Operation Successful"});

  @override
  List<Object> get props => [message];
}

/// Failure state, triggered when there's an error in fetching or updating the user profile.
class UserProfileFailure extends UserProfileState {
  final String errorMessage;

  /// Error message can provide detailed feedback for logging or UI purposes.
  const UserProfileFailure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

/// Loaded state, representing a successfully fetched user profile.
/// The `userProfile` object contains the fetched data.
class UserProfileLoaded extends UserProfileState {
  final UserProfileModel userProfile;

  /// Ensure that the user profile object is non-null.
  const UserProfileLoaded({required this.userProfile});

  @override
  List<Object> get props => [userProfile];

  @override
  String toString() =>
      'UserProfileLoaded { userProfile: ${userProfile.firstName} ${userProfile.lastName} }';
}
