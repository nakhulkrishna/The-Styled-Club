import 'dart:io'; // Platform detection
import 'package:clothingstore/core/router/go_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';

// Core
import 'firebase_options.dart';
import 'package:clothingstore/core/constants/colors.dart';

// Auth Features
import 'package:clothingstore/features/authentication/data/datasources/firebase_auth_datasource.dart';
import 'package:clothingstore/features/authentication/data/repository/auth_repositories_impl.dart';
import 'package:clothingstore/features/authentication/domain/repositories/auth_repositories.dart';
import 'package:clothingstore/features/authentication/domain/usecases/sign_in_usecases.dart';
import 'package:clothingstore/features/authentication/domain/usecases/sign_up_usecases.dart';
import 'package:clothingstore/features/authentication/presentation/bloc/auth_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class CustomScrollBehavior extends ScrollBehavior {
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return Platform.isIOS
        ? const BouncingScrollPhysics()
        : const ClampingScrollPhysics();
  }

  Widget buildViewportChrome(
    BuildContext context,
    Widget child,
    AxisDirection axisDirection,
  ) {
    return child;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => FirebaseAuthDataSource()),
        RepositoryProvider<AuthRepository>(
          create:
              (context) =>
                  AuthRepositoryImpl(context.read<FirebaseAuthDataSource>()),
        ),
        RepositoryProvider(
          create: (context) => SignInUseCase(context.read<AuthRepository>()),
        ),
        RepositoryProvider(
          create: (context) => SignUpUseCase(context.read<AuthRepository>()),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create:
                (context) => AuthBloc(
                  signInUseCase: context.read<SignInUseCase>(),
                  signUpUseCase: context.read<SignUpUseCase>(),
                ),
          ),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Clothing Store',
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              backgroundColor: Colors.white,
            ),
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
              surfaceTintColor: Colors.transparent,
            ),
            snackBarTheme: SnackBarThemeData(
              backgroundColor: GColors.darkergray,
              contentTextStyle: GoogleFonts.poppins(
                color: GColors.textWhite,
                fontSize: 14,
              ),
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          ),
          builder: (context, child) {
            return ScrollConfiguration(
              behavior: CustomScrollBehavior(),
              child: child!,
            );
          },
          routerConfig: appRouter,
        ),
      ),
    );
  }
}
