import 'package:clothingstore/bottombar.dart';
import 'package:clothingstore/features/presentation/pages/home/home.dart';
import 'package:clothingstore/features/presentation/pages/login_page/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        final user = snapshot.data;

        if (user == null) {
          return const LoginPage();
        } else {
          return BottomNavBar();
        }
      },
    );
  }
}
