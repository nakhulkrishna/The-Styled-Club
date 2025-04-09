import 'package:clothingstore/core/constants/colors.dart';
import 'package:clothingstore/core/constants/sizes.dart';
import 'package:clothingstore/common/widgets/custome_text_field.dart';
import 'package:clothingstore/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:clothingstore/features/authentication/presentation/bloc/auth_event.dart';
import 'package:clothingstore/features/authentication/presentation/bloc/auth_state.dart';
import 'package:clothingstore/features/home/presentation/pages/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class UserRegistrationPage extends StatelessWidget {
  UserRegistrationPage({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bloc = context.read<AuthBloc>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text("Account created")));
          } else if (state is AuthFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Looks like you are new",
                      style: GoogleFonts.poppins(
                        color: GColors.error,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: GSizes.spaceBTWinputField * 2),
                    Row(
                      children: [
                        Expanded(
                          child: CustomeTextField(
                            icon: Iconsax.user,
                            label: "First Name",
                            controller: bloc.firstNameController,
                          ),
                        ),
                        SizedBox(width: GSizes.spaceBTWItems - 10),
                        Expanded(
                          child: CustomeTextField(
                            icon: Iconsax.user,
                            label: "Last Name",
                            controller: bloc.lastNameController,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: GSizes.spaceBTWinputField),
                    CustomeTextField(
                      icon: Iconsax.direct,
                      label: "Email",
                      controller: bloc.emailController,
                    ),
                    SizedBox(height: GSizes.spaceBTWinputField),
                    CustomeTextField(
                      icon: Iconsax.password_check,
                      label: "Password",
                      controller: bloc.passwordController,
                    ),
                    SizedBox(height: GSizes.spaceBTWinputField),
                    CustomeTextField(
                      icon: Icons.date_range_outlined,
                      label: "Birth Date",
                      controller: bloc.birthdateController,
                    ),
                    SizedBox(height: GSizes.spaceBTWinputField),
                    SizedBox(
                      width: screenWidth,
                      height: screenWidth * 0.12,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: GColors.error,
                          foregroundColor: GColors.light,
                          shape: const RoundedRectangleBorder(
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
                              SignUpEvent(
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
                    RichText(
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
                                      CupertinoPageRoute(
                                        builder: (context) => HomeScreen(),
                                      ),
                                    );
                                  },
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: GColors.error,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
