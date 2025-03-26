import 'package:clothingstore/core/constants/colors.dart' show GColors;
import 'package:clothingstore/core/formatters/formatters.dart';
import 'package:clothingstore/features/data/models/user_model.dart';
import 'package:clothingstore/features/presentation/logic/address_cubit/address_bloc.dart';
import 'package:clothingstore/features/presentation/logic/address_cubit/address_event.dart';
import 'package:clothingstore/features/presentation/logic/address_cubit/address_state.dart';
import 'package:clothingstore/features/presentation/logic/bloc/user_profile_bloc.dart';
import 'package:clothingstore/features/presentation/logic/bloc/user_profile_event.dart';
import 'package:clothingstore/features/presentation/logic/bloc/user_profile_state.dart';

import 'package:clothingstore/features/presentation/logic/radio_button/radio_button.dart';
import 'package:clothingstore/features/presentation/pages/cart/widgets/text_filed.dart';
import 'package:clothingstore/features/presentation/widgets/radio_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class AddressPage extends StatelessWidget {
  AddressPage({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();

  final TextEditingController lastNameController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final TextEditingController pincodeController = TextEditingController();

  final TextEditingController flatController = TextEditingController();

  final TextEditingController streetController = TextEditingController();

  final TextEditingController landmarkController = TextEditingController();

  final TextEditingController cityController = TextEditingController();

  final TextEditingController stateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //* screen hieght and width
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    //* formatters
    final NFormatters formatter = NFormatters();
    final User? userId = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
            context.read<AddressBloc>().add(FetchUserAddressEvent(userId!.uid));
          },
          icon: Icon(Iconsax.arrow_left),
        ),
        centerTitle: true,
        title: Text("ADD ADDRESS", style: GoogleFonts.poppins(fontSize: 14)),
      ),
      body: BlocListener<AddressBloc, AddressState>(
        listener: (context, state) {
          if (state is AddressSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Center(child: Text("Address saved successfully!")),
              ),
            );
          } else if (state is AddressFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Center(child: Text(state.error))));
          }
        },
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics().applyTo(ClampingScrollPhysics()),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * .02),
            child: BlocBuilder<UserProfileBloc, UserProfileState>(
              builder: (context, state) {
                if (state is UserProfileLoaded) {
                  firstNameController.text = state.userProfile.firstName;
                  lastNameController.text = state.userProfile.lastName;
                  phoneController.text = state.userProfile.phone;
                  return Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomField(
                          validator: _validateName,
                          keyBoardType: TextInputType.name,
                          label: 'First Name',
                          controller: firstNameController,
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        CustomField(
                          validator: _validateName,
                          keyBoardType: TextInputType.name,
                          label: 'Last Name',
                          controller: lastNameController,
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        CustomField(
                          keyBoardType: TextInputType.phone,
                          validator: _validatePhoneNumber,
                          label: 'Phone Number',
                          controller: phoneController,
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        CustomField(
                          label: 'Pincode',
                          controller: pincodeController,
                          keyBoardType: TextInputType.number,
                          validator: _validatePincode,
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        Divider(thickness: 5, color: GColors.gery),
                        SizedBox(height: screenHeight * 0.02),
                        CustomField(
                          keyBoardType: TextInputType.streetAddress,
                          validator:
                              (value) =>
                                  value!.isEmpty
                                      ? 'Please enter a flat/building'
                                      : null,
                          label: 'Flat, House No, Building, Company',
                          controller: flatController,
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        CustomField(
                          keyBoardType: TextInputType.streetAddress,
                          validator:
                              (value) =>
                                  value!.isEmpty
                                      ? 'Please enter a street/area'
                                      : null,
                          label: 'Street, Area',
                          controller: streetController,
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        CustomField(
                          validator:
                              (value) =>
                                  value!.isEmpty
                                      ? 'Please enter a landmark'
                                      : null,
                          keyBoardType: TextInputType.text,
                          label: 'Landmark',
                          controller: landmarkController,
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        CustomField(
                          validator:
                              (value) =>
                                  value!.isEmpty
                                      ? 'Please enter a city/district'
                                      : null, // Validate
                          keyBoardType: TextInputType.multiline,
                          label: 'City, District',
                          controller: cityController,
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        CustomField(
                          label: 'State',
                          controller: stateController,
                          keyBoardType: TextInputType.name,
                          validator:
                              (value) =>
                                  value!.isEmpty
                                      ? 'Please enter a state'
                                      : null,
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        SizedBox(height: screenHeight * 0.02),
                        Divider(thickness: 5, color: GColors.gery),
                        SizedBox(height: screenHeight * 0.02),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * .04,
                          ),
                          child: Text(
                            "Type",
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: GColors.darkgery,
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        BlocBuilder<RadioButtonCubit, AddressType>(
                          builder: (context, state) {
                            return RadioButton(
                              screenHeight: screenHeight,
                              screenWidth: screenWidth,
                              groupValue: state,
                            );
                          },
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        GestureDetector(
                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                              final User? user =
                                  FirebaseAuth.instance.currentUser;
                              final addressType =
                                  context.read<RadioButtonCubit>().state;
                              String addressTypeString = formatter
                                  .addressTypeToString(addressType);

                              if (user != null) {
                                UserModel userModel = UserModel(
                                  uid: user.uid, // Replace with real uid
                                  firstName: firstNameController.text,
                                  lastName: lastNameController.text,
                                  phone: phoneController.text,
                                  pincode: pincodeController.text,
                                  flat: flatController.text,
                                  street: streetController.text,
                                  landmark: landmarkController.text,
                                  city: cityController.text,
                                  state: stateController.text,
                                  addressType: addressTypeString,
                                );
                                BlocProvider.of<AddressBloc>(
                                  context,
                                ).add(SaveUserAddressEvent(userModel));
                              }
                            }
                          },
                          child: Container(
                            height: screenHeight * 0.06,
                            width: screenWidth,
                            decoration: BoxDecoration(color: GColors.error),
                            child: Center(
                              child: Text(
                                'Save Address',
                                style: GoogleFonts.poppins(
                                  color: GColors.light,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.03),
                      ],
                    ),
                  );
                }
                return SizedBox();
              },
            ),
          ),
        ),
      ),
    );
  }
}

// Industrial-Grade Validation for Name
String? _validateName(String? value) {
  final nameRegExp = RegExp(r'^[A-Za-z\s]+$');
  if (value == null || value.isEmpty) {
    return 'Name is required';
  } else if (!nameRegExp.hasMatch(value)) {
    return 'Please enter a valid name (letters only)';
  }
  return null;
}

// Industrial-Grade Validation for Phone Number
String? _validatePhoneNumber(String? value) {
  final phoneRegExp = RegExp(r'^\d{10}$');
  if (value == null || value.isEmpty) {
    return 'Phone number is required';
  } else if (!phoneRegExp.hasMatch(value)) {
    return 'Please enter a valid 10-digit phone number';
  }
  return null;
}

// Industrial-Grade Validation for Pincode
String? _validatePincode(String? value) {
  final pincodeRegExp = RegExp(r'^\d{6}$');
  if (value == null || value.isEmpty) {
    return 'Pincode is required';
  } else if (!pincodeRegExp.hasMatch(value)) {
    return 'Please enter a valid 6-digit pincode';
  }
  return null;
}
