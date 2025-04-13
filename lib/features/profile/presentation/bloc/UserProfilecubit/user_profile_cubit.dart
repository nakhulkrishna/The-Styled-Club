import 'package:clothingstore/features/profile/data/datasource/user_profile_remote_source.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'user_profile_state.dart';
import 'package:clothingstore/features/data/models/Users/user_profile_model.dart';

class UserProfileCubit extends Cubit<UserProfileState> {
  final UserProfileRemoteSource remoteSource;

  UserProfileCubit(this.remoteSource) : super(UserProfileInitial()) {
    fetchUserProfile();
  }

  Future<void> fetchUserProfile() async {
    try {
      emit(UserProfileLoading());
      final profile =
          await remoteSource.getUserProfile(); // implement this method
      emit(UserProfileLoaded(profile));
    } catch (e) {
      emit(UserProfileError("Failed to fetch profile"));
    }
  }

  Future<void> saveOrUpdateUserProfile(UserProfileModel model) async {
    try {
      emit(UserProfileLoading());
      await remoteSource.saveOrUpdateProfile(model); // your existing method
      emit(UserProfileSaved());
    } catch (e) {
      emit(UserProfileError("Failed to save/update profile"));
    }
  }
}
