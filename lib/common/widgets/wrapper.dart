import 'package:clothingstore/core/utils/bottombar.dart';
import 'package:clothingstore/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:clothingstore/features/authentication/presentation/bloc/auth_event.dart';
import 'package:clothingstore/features/authentication/presentation/bloc/auth_state.dart';
import 'package:clothingstore/features/authentication/presentation/pages/user_sign_in_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AuthBloc>().add(AuthStatusCheckEvent());
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthLoggedIn) {
          return BottomNavBar();
        } else if (state is AuthLoggedOut) {
          return UserSignInPage();
        } else {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}
