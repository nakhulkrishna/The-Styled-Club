import 'package:clothingstore/core/constants/colors.dart';
import 'package:clothingstore/core/constants/sizes.dart';
import 'package:clothingstore/core/utils/custome_text_field.dart';
import 'package:clothingstore/features/authentication/presentation/bloc/auth_event.dart';
import 'package:clothingstore/features/authentication/presentation/bloc/auth_state.dart';
import 'package:clothingstore/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:clothingstore/features/authentication/presentation/pages/user_registration_page.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class UserSignInPage extends StatelessWidget {
  UserSignInPage({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AuthBloc>();
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text("Login successful")));
        } else if (state is AuthFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          body: SingleChildScrollView(
            // ➕ Added scroll
            child: Column(
              children: [
                SizedBox(
                  height: screenHeight * 0.35,
                  width: screenWidth,
                  child: Image.asset(
                    "assets/images/login_poster - Copy.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: GSizes.spaceBTWinputField * 2),
                          CustomeTextField(
                            icon: Iconsax.direct,
                            label: "Email",
                            controller: bloc.emailController,
                          ),
                          SizedBox(height: GSizes.spaceBTWItems),
                          CustomeTextField(
                            icon: Iconsax.password_check,
                            label: "Password",
                            controller: bloc.passwordController,
                            // obscureText: true, // ➕ Hide password
                          ),
                          SizedBox(height: GSizes.spaceBTWItems),

                          RichText(
                            text: TextSpan(
                              text: 'By continuing, I agree to the ',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: GColors.darkgery,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Terms of use',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: GColors.error,
                                  ),
                                ),
                                TextSpan(
                                  text: ' & ',
                                  style: GoogleFonts.poppins(fontSize: 12),
                                ),
                                TextSpan(
                                  text: 'Privacy Policy',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: GColors.error,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: GSizes.spaceBTWItems),

                          SizedBox(
                            width: double.infinity,
                            height: screenWidth * 0.12,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: GColors.error,
                                foregroundColor: GColors.light,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(5),
                                    topRight: Radius.circular(5),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  context.read<AuthBloc>().add(
                                    SignInEvent(
                                      bloc.emailController.text.trim(),
                                      bloc.passwordController.text.trim(),
                                    ),
                                  );
                                }
                              },
                              child: Text(
                                "Continue to Login",
                                style: GoogleFonts.poppins(),
                              ),
                            ),
                          ),
                          SizedBox(height: GSizes.spaceBTWItems),

                          Center(
                            child: RichText(
                              text: TextSpan(
                                text: "Don't have an account? ",
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  color: GColors.darkgery,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Register',
                                    recognizer:
                                        TapGestureRecognizer()
                                          ..onTap = () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder:
                                                    (context) =>
                                                        UserRegistrationPage(),
                                              ),
                                            );
                                          },
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      color: GColors.error,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: GSizes.spaceBTWItems),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
