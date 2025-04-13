import 'package:clothingstore/core/constants/colors.dart';
import 'package:clothingstore/features/cart/presentation/widgets/text_filed.dart';
import 'package:clothingstore/features/data/models/Users/user_profile_model.dart';

import 'package:clothingstore/features/profile/presentation/bloc/UserProfilecubit/user_profile_cubit.dart';
import 'package:clothingstore/features/profile/presentation/bloc/UserProfilecubit/user_profile_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileDataPages extends StatefulWidget {
  const ProfileDataPages({super.key});

  @override
  _ProfileDataPagesState createState() => _ProfileDataPagesState();
}

class _ProfileDataPagesState extends State<ProfileDataPages> {
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController emailController;
  late TextEditingController phoneNumberController;

  @override
  void initState() {
    super.initState();
    // Initialize controllers
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
    phoneNumberController = TextEditingController();
  }

  @override
  void dispose() {
    // Dispose controllers when the widget is disposed
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.read<UserProfileCubit>().fetchUserProfile();
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("EDIT PROFILE", style: GoogleFonts.poppins(fontSize: 14)),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: screenHeight * .03,
          horizontal: screenHeight * .015,
        ),
        child: BlocConsumer<UserProfileCubit, UserProfileState>(
          listener: (context, state) {
            if (state is UserProfileLoaded) {
              firstNameController.text = state.userProfile.firstName;
              lastNameController.text = state.userProfile.lastName;
              emailController.text = state.userProfile.email;
              phoneNumberController.text = state.userProfile.phone;
            }
          },
          builder: (context, state) {
            if (state is UserProfileLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            // if (state is UserProfileEmpty) {
            //   return const Center(
            //     child: Text("No profile found. Please create one."),
            //   );
            // }

            return Column(
              children: [
                CustomField(
                  label: "First Name",
                  controller: firstNameController,
                  keyBoardType: TextInputType.name,
                ),
                SizedBox(height: screenHeight * .015),
                CustomField(
                  label: "Last Name",
                  controller: lastNameController,
                  keyBoardType: TextInputType.name,
                ),
                SizedBox(height: screenHeight * .015),
                CustomField(
                  label: "Email",
                  controller: emailController,
                  keyBoardType: TextInputType.emailAddress,
                ),
                SizedBox(height: screenHeight * .015),
                CustomField(
                  label: "Phone Number",
                  controller: phoneNumberController,
                  keyBoardType: TextInputType.phone,
                ),
                SizedBox(height: screenHeight * .025),
                SizedBox(
                  width: screenWidth,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: GColors.error,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: () {
                      final profile = UserProfileModel(
                        uid: FirebaseAuth.instance.currentUser!.uid,
                        firstName: firstNameController.text.trim(),
                        lastName: lastNameController.text.trim(),
                        email: emailController.text.trim(),
                        phone: phoneNumberController.text.trim(),
                      );

                      context.read<UserProfileCubit>().saveOrUpdateUserProfile(
                        profile,
                      );
                    },
                    child: Text(
                      'SAVE CHANGES',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: GColors.borderPrimary,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
