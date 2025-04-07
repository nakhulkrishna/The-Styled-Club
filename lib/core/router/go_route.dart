import 'package:clothingstore/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:clothingstore/features/authentication/presentation/pages/user_registration_page.dart';
import 'package:clothingstore/features/authentication/presentation/pages/user_sign_in_page.dart';
import 'package:clothingstore/features/home/presentation/pages/home_screen.dart';
import 'package:clothingstore/core/utils/widgets.common/wrapper.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/initialRoute',
  routes: [
    GoRoute(
      path: '/initialRoute',
      builder:
          (context, state) => BlocProvider(
            create:
                (context) => AuthBloc(
                  signInUseCase: context.read(),
                  signUpUseCase: context.read(),
                ),
            child: Wrapper(),
          ),
    ),
    GoRoute(
      path: '/signup',
      builder:
          (context, state) => BlocProvider(
            create:
                (context) => AuthBloc(
                  signInUseCase: context.read(),
                  signUpUseCase: context.read(),
                ),
            child: UserRegistrationPage(),
          ),
    ),
    GoRoute(
      path: '/signin',
      builder:
          (context, state) => BlocProvider(
            create:
                (context) => AuthBloc(
                  signInUseCase: context.read(),
                  signUpUseCase: context.read(),
                ),
            child: UserSignInPage(),
          ),
    ),
    GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
  ],
);
