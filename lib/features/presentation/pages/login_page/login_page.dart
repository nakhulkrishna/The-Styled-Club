import 'package:clothingstore/core/constants/colors.dart';
import 'package:clothingstore/core/constants/sizes.dart';
import 'package:clothingstore/core/utils/custome_text_field.dart';
import 'package:clothingstore/features/presentation/logic/authentication/auth_bloc.dart';
import 'package:clothingstore/features/presentation/logic/authentication/auth_event.dart';
import 'package:clothingstore/features/presentation/logic/authentication/auth_state.dart';
import 'package:clothingstore/features/presentation/pages/register_page/register_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFF643F0A),
      body: GestureDetector(
        onTap: () {
          // Hide the keyboard when tapping outside the text field
          FocusScope.of(context).unfocus();
        },
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Center(child: Text("Account created"))),
              );
            } else if (state is AuthFailure) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text("state.message")));
            }
          },
          builder: (context, state) {
            return Column(
              children: [
                Flexible(
                  flex: 1,
                  child: Container(
                    width: screenWidth,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          "assets/images/login_poster - Copy.jpg",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    height: screenHeight,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: GSizes.spaceBTWinputField * 2),
                          CustomeTextField(
                            icon: Iconsax.direct,
                            label: "Email",
                            controller: emailController,
                          ),
                          SizedBox(height: GSizes.spaceBTWItems),
                          CustomeTextField(
                            icon: Iconsax.password_check,
                            label: "password",
                            controller: passwordController,
                          ),
                          SizedBox(height: GSizes.spaceBTWItems),

                          // Updated RichText with overflow handling
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
                                  loginUser(
                                    emailController.text,
                                    passwordController.text,
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
                                                  builder:
                                                      (context) =>
                                                          RegisterPage(),
                                                ),
                                              );
                                            },
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
