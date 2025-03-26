import 'package:clothingstore/core/constants/colors.dart';
import 'package:clothingstore/core/constants/sizes.dart';
import 'package:clothingstore/core/utils/custome_text_field.dart';
import 'package:clothingstore/features/presentation/logic/authentication/auth_bloc.dart';
import 'package:clothingstore/features/presentation/logic/authentication/auth_event.dart';
import 'package:clothingstore/features/presentation/logic/authentication/auth_state.dart';
import 'package:clothingstore/features/presentation/pages/register_page/register_otp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    late TextEditingController firstNameController = TextEditingController();
    late TextEditingController lastNameController = TextEditingController();

    late TextEditingController emailController = TextEditingController();

    late TextEditingController passwordController = TextEditingController();

    late TextEditingController birthdateController = TextEditingController();
    void initState() {
      super.initState();
      emailController = TextEditingController();
      passwordController = TextEditingController();
      firstNameController = TextEditingController();
      lastNameController = TextEditingController();
      birthdateController = TextEditingController();
    }

    @override
    void dispose() {
      emailController.dispose();
      passwordController.dispose();
      firstNameController.dispose();
      lastNameController.dispose();
      birthdateController.dispose();
      super.dispose();
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),

      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text("Account created")));
          } else if (state is AuthFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
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
                        controller: firstNameController,
                      ),
                    ),
                    SizedBox(width: GSizes.spaceBTWItems - 10),
                    Expanded(
                      child: CustomeTextField(
                        icon: Iconsax.user,
                        label: "Last Name",
                        controller: lastNameController,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: GSizes.spaceBTWinputField),
                CustomeTextField(
                  icon: Iconsax.direct,
                  label: "Email",
                  controller: emailController,
                ),
                SizedBox(height: GSizes.spaceBTWinputField),
                CustomeTextField(
                  icon: Iconsax.password_check,
                  label: "Password",
                  controller: passwordController,
                ),
                SizedBox(height: GSizes.spaceBTWinputField),
                CustomeTextField(
                  icon: Icons.date_range_outlined,
                  label: "Birth Date",
                  controller: birthdateController,
                ),
                SizedBox(height: GSizes.spaceBTWinputField),
                SizedBox(
                  width: screenWidth,
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
                      context.read<AuthBloc>().add(
                        CreateAccountEvent(
                          emailController.text,
                          passwordController.text,
                          firstNameController.text,
                          lastNameController.text,
                          birthdateController.text,
                        ),
                      );
                    },
                    child: Text(
                      "Continue to Login",
                      style: GoogleFonts.poppins(),
                    ),
                  ),
                ),
                SizedBox(height: GSizes.spaceBTWItems),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: "Don't have an account? ",
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: GColors.darkgery,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            recognizer:
                                TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                        builder: (context) => RegisterPage(),
                                      ),
                                    );
                                  },
                            // recognizer: ,
                            text: 'Register',
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
              ],
            ),
          );
        },
      ),
    );
  }
}
