import 'package:bloc/bloc.dart';
import 'package:clothingstore/features/data/repositories/user_registeration/user_registration.dart';
import 'package:clothingstore/features/presentation/logic/bloc/user_profile_event.dart';
import 'package:clothingstore/features/presentation/logic/bloc/user_profile_state.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:logger/logger.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  final UserRegistration userRegistration;

  //* logger for debbuging and error tracking
  final Logger _logger = Logger();

  UserProfileBloc(this.userRegistration) : super(UserProfileInitial()) {
    on<SaveUserProfileEvent>(_onSaveUserProfileData);
    on<FetchUserProfileEvent>(_onFecthUserProfileData);
  }

  Future<void> _onSaveUserProfileData(
    SaveUserProfileEvent event,
    Emitter<UserProfileState> emit,
  ) async {
    emit(UserProfileLoading());

    try {
      await userRegistration.userProfile(event.userProfileModel);
      await userRegistration.fecthUserProfile(event.userProfileModel.uid);
      emit(UserProfileSuccess());
    } on FirebaseException catch (e) {
      _logger.e('FirebaseException: Failed to save user profile', error: e);
      emit(UserProfileFailure("${e.message}"));
    } catch (e) {
      //* Handle other general exceptions
      _logger.e('General error: Failed to save user profile', error: e);
      emit(UserProfileFailure('An error occurred: ${e.toString()}'));
    }
  }

  Future<void> _onFecthUserProfileData(
    FetchUserProfileEvent event,
    Emitter<UserProfileState> emit,
  ) async {
    emit(UserProfileLoading());
    try {
      final userProfile = await userRegistration.fecthUserProfile(event.userId);

      if (userProfile != null) {
        emit(UserProfileLoaded(userProfile: userProfile));
      } else {
        _logger.w(
          'UserProfile: User profile not found for userId: ${event.userId}',
        );
        emit(UserProfileFailure('User profile not found'));
      }
    } on FirebaseException catch (e) {
      _logger.e('FirebaseException: Failed to fetch user profile', error: e);
      emit(UserProfileFailure('Firebase error: ${e.message}'));
    } catch (e) {
      // Handle other general exceptions
      _logger.e('General error: Failed to fetch user profile', error: e);
      emit(UserProfileFailure('An error occurred: ${e.toString()}'));
    }
  }
}
