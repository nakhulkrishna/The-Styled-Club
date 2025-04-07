import 'dart:developer';

import 'package:clothingstore/core/constants/colors.dart';
import 'package:clothingstore/features/authentication/data/model/user_profile_model.dart';
import 'package:clothingstore/features/data/repositories/user_registeration/user_registration.dart';
import 'package:clothingstore/features/presentation/logic/user_profile/user_profile_bloc.dart';
import 'package:clothingstore/features/presentation/logic/user_profile/user_profile_event.dart';
import 'package:clothingstore/features/presentation/logic/user_profile/user_profile_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shimmer/shimmer.dart';

class ProfileDataPages extends StatelessWidget {
  ProfileDataPages({super.key});

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController birthdateController = TextEditingController();
  final UserRegistration userRegistration = UserRegistration();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final User? userId = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
            context.read<UserProfileBloc>().add(
              FetchUserProfileEvent(userId!.uid),
            );
          },
          icon: Icon(Iconsax.arrow_left),
        ),
        centerTitle: true,
        title: Text(
          "EDIT PROFILE",
          style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 14),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * .04,
            vertical: screenHeight * .02,
          ),
          child: BlocBuilder<UserProfileBloc, UserProfileState>(
            builder: (context, state) {
              if (state is UserProfileLoading) {
                return _buildShimmerEffect(screenHeight, screenWidth);
              } else if (state is UserProfileLoaded) {
                firstNameController.text = state.userProfile.firstName;
                lastNameController.text = state.userProfile.lastName;
                emailController.text = state.userProfile.email;
                phoneController.text = state.userProfile.phone;
                birthdateController.text = state.userProfile.dateofbirth;
                return Column(
                  children: [
                    _CustomeText(
                      label: 'First Name',
                      textEditingController: firstNameController,
                    ),
                    SizedBox(height: screenHeight * .03),
                    _CustomeText(
                      label: 'Last Name',
                      textEditingController: lastNameController,
                    ),
                    SizedBox(height: screenHeight * .03),
                    _CustomeText(
                      label: 'Email',
                      textEditingController: emailController,
                    ),
                    SizedBox(height: screenHeight * .03),
                    _CustomeText(
                      label: 'Phone',
                      textEditingController: phoneController,
                    ),
                    SizedBox(height: screenHeight * .03),
                    _CustomeText(
                      label: 'Date of Birth',
                      textEditingController: birthdateController,
                    ),
                    SizedBox(height: screenHeight * .03),
                    GestureDetector(
                      onTap: () async {
                        if (userId != null) {
                          final userProfileModel = UserProfileModel(
                            email: emailController.text,
                            dateofbirth: birthdateController.text,
                            uid: userId.uid,
                            firstName: firstNameController.text,
                            lastName: lastNameController.text,
                            phone: phoneController.text,
                          );
                          log("updateting profile...");
                          context.read<UserProfileBloc>().add(
                            SaveUserProfileEvent(userProfileModel),
                          );

                          log("updated profile");

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              margin: EdgeInsets.symmetric(
                                horizontal: 50,
                                vertical: 20,
                              ),
                              padding: EdgeInsets.symmetric(vertical: 10),
                              content: Center(child: Text('Profile Updated')),
                              duration: Duration(
                                seconds: 3,
                              ), // Duration of SnackBar visibility
                            ),
                          );
                        }
                      },
                      child: Container(
                        height: screenHeight * .06,
                        width: screenWidth,
                        decoration: BoxDecoration(
                          color: GColors.error,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Text(
                            "SAVE CHANGES",
                            style: GoogleFonts.poppins(
                              color: GColors.lightContainers,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }
              return Column(
                children: [
                  _CustomeText(
                    label: 'First Name',
                    textEditingController: firstNameController,
                  ),
                  SizedBox(height: screenHeight * .03),
                  _CustomeText(
                    label: 'Last Name',
                    textEditingController: lastNameController,
                  ),
                  SizedBox(height: screenHeight * .03),
                  _CustomeText(
                    label: 'Email',
                    textEditingController: emailController,
                  ),
                  SizedBox(height: screenHeight * .03),
                  _CustomeText(
                    label: 'Phone',
                    textEditingController: phoneController,
                  ),
                  SizedBox(height: screenHeight * .03),
                  _CustomeText(
                    label: 'Date of Birth',
                    textEditingController: birthdateController,
                  ),
                  SizedBox(height: screenHeight * .03),
                  GestureDetector(
                    onTap: () {
                      final User? userId = FirebaseAuth.instance.currentUser;

                      if (userId != null) {
                        final userProfileModel = UserProfileModel(
                          email: emailController.text,
                          dateofbirth: birthdateController.text,
                          uid: userId.uid,
                          firstName: firstNameController.text,
                          lastName: lastNameController.text,
                          phone: phoneController.text,
                        );
                        userRegistration.userProfile(userProfileModel);
                      }
                    },
                    child: Container(
                      height: screenHeight * .06,
                      width: screenWidth,
                      decoration: BoxDecoration(
                        color: GColors.error,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          "SAVE CHANGES",
                          style: GoogleFonts.poppins(
                            color: GColors.lightContainers,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _CustomeText extends StatelessWidget {
  const _CustomeText({
    required this.label,
    required this.textEditingController,
  });
  final String label;
  final TextEditingController textEditingController;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      style: GoogleFonts.poppins(color: GColors.darkergray),
      decoration: InputDecoration(
        label: Text(label),

        labelStyle: GoogleFonts.poppins(fontSize: 14, color: GColors.darkgery),
        hintStyle: GoogleFonts.poppins(color: GColors.darkgery),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: GColors.gery),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: GColors.gery),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: GColors.gery),
        ),
      ),
    );
  }
}

Widget _buildShimmerEffect(double screenHeight, double screenWidth) {
  return Column(
    children: [
      _ShimmerCustomBox(height: screenHeight * .06, width: screenWidth),
      SizedBox(height: screenHeight * .03),
      _ShimmerCustomBox(height: screenHeight * .06, width: screenWidth),
      SizedBox(height: screenHeight * .03),
      _ShimmerCustomBox(height: screenHeight * .06, width: screenWidth),
      SizedBox(height: screenHeight * .03),
      _ShimmerCustomBox(height: screenHeight * .06, width: screenWidth),
      SizedBox(height: screenHeight * .03),
      _ShimmerCustomBox(height: screenHeight * .06, width: screenWidth),
    ],
  );
}

class _ShimmerCustomBox extends StatelessWidget {
  final double height;
  final double width;

  const _ShimmerCustomBox({required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: GColors.gery,
      highlightColor: GColors.darkgery,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: GColors.buttonPrimary,
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
